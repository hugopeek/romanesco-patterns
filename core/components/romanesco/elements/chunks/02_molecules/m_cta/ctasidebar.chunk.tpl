<div id="sidebar-cta" class="ui [[+sticky]] cta" property="significantLink">
[[[[[[If?
    &subject=`[[getRawTVValue? &tv=`sidebar_cta`]]`
    &operator=`is`
    &operand=`@INHERIT`
    &then=`#[[*parent]].sidebar_inheritance:contains=`inherit_cta`:then=`#[[*sidebar_cta:empty=`0`]].content`:else=```
    &else=`
        If?
            &subject=`[[getRawTVValue? &tv=`sidebar_cta`]]`
            &operator=`isnot`
            &operand=`@INHERIT`
            &then=`#[[*sidebar_cta:empty=`0`]].content`
            &else=``
        `
]]]]]]
</div>
