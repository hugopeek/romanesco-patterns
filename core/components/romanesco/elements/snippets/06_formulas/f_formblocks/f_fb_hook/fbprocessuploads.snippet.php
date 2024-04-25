<?php
/**
 * fbProcessUploads
 *
 * Sanitize filenames, check if file extension is allowed and store file if
 * enabled.
 *
 * For single file uploads. Multiple file uploads are processed by AjaxUpload.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var FormIt $formit
 * @var fiHooks $hook
 *
 * @package romanesco
 */

// Define prefix
$formID = $modx->resource->get('id');
$prefix = 'fb' . $formID . '-';

// Storage settings
$storeAttachments = $modx->resource->getTVValue('fb_store_attachments');
if ($storeAttachments == 'default') {
    $storeAttachments = $modx->getOption('formblocks.store_attachments', $scriptProperties);
}
$attachmentPath = $modx->resource->getTVValue('fb_attachment_path') ?? $modx->getOption('formblocks.attachment_path');
$attachmentPath = str_replace('[[*id]]', $formID, $attachmentPath);
$attachmentPath = rtrim($attachmentPath, '/') . '/';

// Sanitation settings
$sanitizeFilename = $modx->getOption('formblocks.sanitize_filenames', $scriptProperties);
$fileNameTranslit = $modx->getOption('filename_translit', $scriptProperties, $modx->getOption('friendly_alias_translit'));
$fileNameRestrictChars = $modx->getOption('filename_restrict_chars', $scriptProperties, $modx->getOption('friendly_alias_restrict_chars'));
$fileNameRestrictCharsPattern = $modx->getOption('filename_restrict_chars_pattern', $scriptProperties, $modx->getOption('friendly_alias_restrict_chars_pattern'));

// Get all file upload fields
$fields = $modx->runSnippet('cbGetFieldContent', [
    'field' => $modx->getOption('formblocks.cb_input_file_id', $scriptProperties),
    'returnAsJSON' => true
]);

// Process fields
foreach (json_decode($fields, 1) as $field) {
    $fieldLabel = $field['settings']['field_name'] ?? null;
    $allowedFileTypes = $field['settings']['allowed_file_types'] ?? null;
    $maxFileSize = $field['settings']['max_file_size'] ?? null;

    //$modx->log(modX::LOG_LEVEL_ERROR, print_r($field,1));

    // Reconstruct correct field name
    $fieldName = $prefix . $modx->filterPathSegment($fieldLabel, [
        'friendly_alias_translit' => $fileNameTranslit,
        'friendly_alias_restrict_chars' => $fileNameRestrictChars,
        'friendly_alias_restrict_chars_pattern' => $fileNameRestrictCharsPattern,
    ]);

    // Fetch file properties
    $file = $hook->getValue($fieldName);
    $pathinfo = pathinfo($file['name']);
    $fileName = $pathinfo['filename'] ?? null;
    $fileExt = $pathinfo['extension'] ?? null;

    // Skip empty non-required fields
    if (!$fileName) continue;

    // Verify
    if (!in_array($fileExt, explode(',',$allowedFileTypes))) {
        $hook->addError($fieldName, $modx->lexicon('formblocks.validation.file_not_allowed', ['ext' => $fileExt, 'allowed' => $allowedFileTypes]));
    }
    $fileSize = filesize($file['tmp_name']);
    $fileSize = number_format($fileSize / 1048576, 2);
    if (!$maxFileSize) {
        $maxFileSize = number_format($modx->getOption('upload_maxsize') / 1048576, 2);
    }
    if ($fileSize > $maxFileSize) {
        $hook->addError($fieldName, $modx->lexicon('formblocks.validation.file_too_big', ['max_file_size' => $maxFileSize]));
    }
    if ($hook->hasErrors()) continue;

    // Sanitize
    if ($sanitizeFilename) {
        $fileName = $modx->filterPathSegment($fileName, [
            'friendly_alias_translit' => $fileNameTranslit,
            'friendly_alias_restrict_chars' => $fileNameRestrictChars,
            'friendly_alias_restrict_chars_pattern' => $fileNameRestrictCharsPattern,
        ]);
        $file['name'] = $fileName . '.' . $fileExt;
        $hook->setValue($fieldName, $file);
    }

    // Store
    if ($storeAttachments) {
        file_put_contents(MODX_ASSETS_PATH . $attachmentPath . $file['name'], file_get_contents($file['tmp_name']));
    }
}

if ($hook->hasErrors()) {
    return false;
}

return true;