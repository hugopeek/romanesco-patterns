<?php
/*
 * jsonImportInputOptions
 *
 * Generate input options from a JSON file.
 *
 * Tip:
 * If you want to populate the options with only the contents of the file, you
 * can set them all to deleted=1 before updating and then back to 0 if present
 * in the json file.
 *
 * Don't do this if you want to mix options with user generated input (obviously).
 * If you need to delete options from the JSON file, just add "deleted":1 to
 * their config, run the script once and then delete them from the file.
 *
 */

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$backyard = $modx->addPackage('romanescobackyard', $corePath . 'model/');
$json = $modx->getOption('file', $scriptProperties, '');

if (!is_file($json)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[jsonImportInputOptions] input file not found!');
    return '';
}
$options = file_get_contents($json);
$optionsArray = json_decode($options, true);

foreach ($optionsArray['groups'] as $group) {
    $groupID = '';

    // Check if group exists
    $existingGroup = $modx->getObject('rmOptionGroup', array(
        'key' => $group['key']
    ));

    // Update existing group with new data
    if (is_object($existingGroup)) {
        $existingGroup->set('name', $group['name']);
        $existingGroup->set('description', $group['description']);
        $existingGroup->set('position', $group['position']);
        if ($group['deleted']) {
            $existingGroup->set('deleted', $group['deleted']);
        }
        $existingGroup->save();
    }
    // If group doesn't exist, create it
    else {
        $newGroup = $modx->newObject('rmOptionGroup', array(
            'name' => $group['name'],
            'description' => $group['description'],
            'key' => $group['key'],
            'position' => $group['position'],
        ));
        $newGroup->save();
        $groupID = $newGroup->get('id'); // for connection options
    }

    // Same drill for the options
    foreach ($group['options'] as $option) {

        // Generate alias if none was set
        if (!$option['alias']) {
            $option['alias'] = $modx->runSnippet('stripAsAlias', array('input' => $option['name']));
        }

        // Check if option exists
        $existingOption = $modx->getObject('rmOption', array(
            'alias' => $option['alias'],
            'key' => $group['key'],
        ));

        // Update existing option with new data
        if (is_object($existingOption)) {
            $existingOption->set('name', $option['name']);
            $existingOption->set('description', $option['description']);
            $existingOption->set('position', $option['position']);
            if ($option['deleted']){
                $existingOption->set('deleted', $option['deleted']);
            }
            $existingOption->save();
        }
        // Or create new option
        else {
            $newOption = $modx->newObject('rmOption', array(
                'name' => $option['name'],
                'description' => $option['description'],
                'alias' => $option['alias'],
                'group' => $groupID,
                'key' => $group['key'],
            ));
            $newOption->save();
        }
    }
}

return '';