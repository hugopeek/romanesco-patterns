[[Switch:toPlaceholder=`element_class`?
    &get=`[[+type]]`
    &c1=`BosonField`       &do1=`cbField`
    &c2=`BosonLayout`      &do2=`cbLayout`
    &c3=`BosonTemplate`    &do3=`cbTemplate`
    &default=`0`
]]
[[pdoResources?
    &class=`[[+element_class]]`
    &sortby=`sortorder`
    &sortdir=`ASC`
    &limit=`0`
    &where=`{"category:=":"[[+id]]"}`
    &tpl=`patternCategoryBosonRow`
    &elementType=`[[+type]]`
    &includeContent=`1`
    &toPlaceholder=`cb_cat_[[+id]]`
]]

[[+cb_cat_[[+id]]:notempty=`
<[[+level]] [[+level:eq=`h2`:then=`id="[[+name]]"`]] class="ui primary header">
    [[+name]]
</[[+level]]>

[[+description:prepend=`<p class="lead">`:append=`</p>`]]

[[+cb_cat_[[+id]]]]
`]]