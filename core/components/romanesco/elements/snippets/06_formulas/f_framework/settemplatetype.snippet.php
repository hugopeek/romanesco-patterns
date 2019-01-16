<?php
/**
 * setTemplateType
 *
 * Currently being used by cbLayoutSingleColumn chunk to prevent double containers.
 */
$type = $modx->getOption('type', $scriptProperties, '');
$modx->setPlaceholder('template_type', $type);

return '';
