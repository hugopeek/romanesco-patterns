<[[+level]] [[+level:eq=`h2`:then=`id="[[+category]]"`]] class="ui primary header">
    [[+category]]
</[[+level]]>

[[Switch:toPlaceholder=`element_class`?
    &get=`[[+type]]`
    &c1=`ElectronTV`        &do1=`modTemplateVar`
    &c2=`ElectronSS`        &do2=`modSystemSetting`
    &c3=`ElectronCC`        &do3=`cgSetting`
    &c4=`Atom`              &do4=`modChunk`
    &c5=`Molecule`          &do5=`modChunk`
    &c6=`Organism`          &do6=`modChunk`
    &c7=`Template`          &do7=`modTemplate`
    &c8=`Formula`           &do8=`modSnippet`
    &c9=`Computation`       &do9=`modPlugin`
    &c10=`BosonField`       &do10=`cbField`
    &c11=`BosonLayout`      &do11=`cbLayout`
    &c12=`BosonTemplate`    &do12=`cbTemplate`
    &default=`0`
]]
[[pdoResources?
    &class=`[[+element_class]]`
    &sortby=`[[+type:eq=`Template`:then=`templatename`:else=`name`]]`
    &sortdir=`ASC`
    &limit=`0`
    &where=`{"category:=":"[[+id]]"}`
    &tpl=`patternCategoryRow`
    &elementType=`[[+type]]`
    &includeContent=`1`
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