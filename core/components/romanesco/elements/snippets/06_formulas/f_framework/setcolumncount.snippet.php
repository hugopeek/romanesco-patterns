<?php
/**
 * setColumnCount
 *
 * For telling responsive content images how many columns their container has.
 */
 
$total = $modx->getOption('total', $scriptProperties, '');
$modx->setPlaceholder('column_count', $total);