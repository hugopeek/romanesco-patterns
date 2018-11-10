<?php
/*
 * jsonImportInputOptions
 *
 * Generate input options from a JSON file. These options are written directly
 * into their database table inside the Backyard package.
 *
 * The option groups are referenced and compared by key, the options themselves
 * by alias. This means that IDs are assigned by MODX and settings can be mixed
 * with user generated input.
 *
 * Normally, this also means that when you change the key or alias of a
 * field, a new item is created. This is not always desirable. Sometimes, fields
 * are referenced by ID so you want to keep these selections intact when making
 * adjustments to a field.
 *
 * That's why there is a safety net built in. It works like this: if you want to
 * change the key of a group or alias of an option, you can do that. But *only*
 * if you leave the name property alone. The script will perform a second check
 * in the background, and if the names still match it will update the existing
 * element instead of creating a new one.
 *
 * So NEVER change name and key/alias in the same update, unless you don't mind
 * new elements being created. Change one > run script > change the other.
 *
 * Usage:
 * [[jsonImportInputOptions? &json=`/absolute/path/to/file.json`]]
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
    $oldKey = $group['key'];

    // Check if group exists
    $existingGroup = $modx->getObject('rmOptionGroup', array(
        'key' => $group['key']
    ));

    // Perform second check on name, to see if user wants to update key for existing group
    if (!is_object($existingGroup)) {
        $existingGroup = $modx->getObject('rmOptionGroup', array(
            'name' => $group['name']
        ));
        $oldKey = $existingGroup->get('key'); // for updating options
    }

    // Update existing group with new data
    if (is_object($existingGroup)) {
        $existingGroup->set('name', $group['name']);
        $existingGroup->set('description', $group['description']);
        $existingGroup->set('key', $group['key']);
        $existingGroup->set('position', $group['position']);
        if ($group['deleted']) {
            $existingGroup->set('deleted', $group['deleted']);
        }
        $existingGroup->save();
        $groupID = $existingGroup->get('id'); // for connecting options
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
        $groupID = $newGroup->get('id'); // for connecting options
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

        // Perform second check on name, to see if user wants to update alias for existing option
        if (!is_object($existingOption)) {
            $existingOption = $modx->getObject('rmOption', array(
                'name' => $option['name'],
                'key' => $group['key'],
            ));
        }

        // Perform second check on name, to see if user wants to update alias for existing option
        if (!is_object($existingOption)) {
            $existingOption = $modx->getObject('rmOption', array(
                'name' => $option['name'],
                'key' => $oldKey, // check for old key, in case parent key was updated
            ));
        }

        // Update existing option with new data
        if (is_object($existingOption)) {
            $existingOption->set('name', $option['name']);
            $existingOption->set('description', $option['description']);
            $existingOption->set('alias', $option['alias']);
            $existingOption->set('key', $group['key']);
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
                'position' => $option['position'],
                'deleted' => $option['deleted'],
            ));
            $newOption->save();
        }
    }
}

return '';