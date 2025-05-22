<?php
/**
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
 * field, a new item is created. This is not always desirable. Sometimes fields
 * are referenced by ID, so you want to keep these selections intact when making
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
 * And ALWAYS backup first.
 *
 * Usage:
 * [[jsonImportInputOptions?
 *     &json=`/absolute/path/to/file.json`
 *     &updateExisting=`0`
 * ]]
 *
 * Set the updateExisting option to true if you want existing values to be
 * overwritten by the file contents. The default is false: existing options will
 * be left alone; only new options will be added.
 *
 * Tip:
 * If you want to populate the options with only the contents of the file, you
 * can set them all to deleted=1 before updating and then back to 0 if present
 * in the json file.
 *
 * Don't do this if you want to mix options with user generated input.
 * If you need to delete options from the JSON file, just add "deleted":1 to
 * their config, run the script once and then delete them from the file.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$json = $modx->getOption('file', $scriptProperties, '');
$updateExisting = $modx->getOption('updateExisting', $scriptProperties, false);

if (!is_file($json)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[jsonImportInputOptions] Input file not found!');
    return '';
}
$options = file_get_contents($json);
$optionsArray = json_decode($options, true);

$modx->log(modX::LOG_LEVEL_INFO, 'Importing default set of input options...');

foreach ($optionsArray['groups'] as $group) {
    $groupID = '';

    // Prevent NULL on NOT NULL field errors
    if (!isset($group['deleted'])) {
        $group['deleted'] = 0;
    }

    // Assume group key is the same as any existing "old" key
    $oldKey = $group['key'];

    // Check if group exists
    $existingGroup = $modx->getObject('FractalFarming\Romanesco\Model\OptionGroup', array(
        'key' => $group['key']
    ));

    // Perform second check on name, to see if user wants to update key for existing group
    if (!is_object($existingGroup)) {
        $existingGroup = $modx->getObject('FractalFarming\Romanesco\Model\OptionGroup', array(
            'name' => $group['name']
        ));

        // If group key was changed, use previous key to fetch existing options correctly
        if (is_object($existingGroup)) {
            $oldKey = $existingGroup->get('key');
        }
    }

    // Update existing group with new data
    if (is_object($existingGroup) && $updateExisting) {
        $modx->log(modX::LOG_LEVEL_INFO, ' - updating group: ' . $group['name']);
        $existingGroup->set('name', $group['name']);
        $existingGroup->set('description', $group['description']);
        $existingGroup->set('key', $group['key']);
        $existingGroup->set('position', $group['position']);
        $existingGroup->set('deleted', $group['deleted']);
        $existingGroup->save();
        $groupID = $existingGroup->get('id'); // for connecting options
    }
    // If group doesn't exist, create it
    elseif (!is_object($existingGroup)) {
        $modx->log(modX::LOG_LEVEL_INFO, ' - creating group: ' . $group['name']);
        $newGroup = $modx->newObject('FractalFarming\Romanesco\Model\OptionGroup', array(
            'name' => $group['name'],
            'description' => $group['description'],
            'key' => $group['key'],
            'position' => $group['position'],
        ));
        $newGroup->save();
        $groupID = $newGroup->get('id'); // for connecting options
    }
    else {
        continue;
    }

    // Same drill for the options
    foreach ($group['options'] as $option) {
        // Prevent NULL on NOT NULL field errors
        if (!isset($option['deleted'])) {
            $option['deleted'] = 0;
        }

        // Generate alias if none was set
        if (!isset($option['alias'])) {
            $option['alias'] = $modx->filterPathSegment($option['name'], [
                'friendly_alias_restrict_chars' => 'alphanumeric'
            ]);
        }

        // Check if option exists
        $existingOption = $modx->getObject('FractalFarming\Romanesco\Model\Option', array(
            'alias' => $option['alias'],
            'key' => $oldKey,
        ));

        // Perform second check on name, to see if user wants to update alias for existing option
        if (!is_object($existingOption)) {
            $existingOption = $modx->getObject('FractalFarming\Romanesco\Model\Option', array(
                'name' => $option['name'],
                'key' => $oldKey,
            ));
        }

        // Update existing option with new data
        if (is_object($existingOption) && $updateExisting) {
            $existingOption->set('name', $option['name']);
            $existingOption->set('description', $option['description']);
            $existingOption->set('alias', $option['alias']);
            $existingOption->set('key', $group['key']);
            $existingOption->set('position', $option['position']);
            $existingOption->set('deleted', $option['deleted']);
            $existingOption->save();
        }
        // Or create new option
        elseif (!is_object($existingOption)) {
            $newOption = $modx->newObject('FractalFarming\Romanesco\Model\Option', array(
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