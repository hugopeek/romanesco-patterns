<[[+level]] [[+level:eq=`h2`:then=`id="[[+category]]"`]] class="ui primary header">
    [[+category]]
</[[+level]]>

[[pdoResources?
    &class=`modChunk`
    &sortby=`name`
    &sortdir=`ASC`
    &limit=`0`
    &where=`{"category:=":"[[+id]]"}`
    &tpl=`patternCategoryRow`
]]
[[pdoResources:prepend=`<div class="ui segment">`:append=`</div>`?
    &class=`modCategory`
    &sortby=`category`
    &sortdir=`ASC`
    &limit=`0`
    &depth=`0`
    &where=`[{"parent:=":"[[+id]]"}]`
    &tpl=`patternCategoryParent`
    &level=`h3`
]]