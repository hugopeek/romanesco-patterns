<?php
$parents = $modx->getOption('parents',$scriptProperties,true);

$output = $modx->runSnippet('getResources', (array(
    'parents' => $parents,
    'showHidden' => 1,
    'showUnpublished' => 1,
    'limit' => '99',
    'sortBy' => 'menuindex',
    'sortDir' => 'ASC',
    'tpl' => '@INLINE [[+pagetitle]]==[[+id]]',
    'outputSeparator' => '||'
)
));

return $output;