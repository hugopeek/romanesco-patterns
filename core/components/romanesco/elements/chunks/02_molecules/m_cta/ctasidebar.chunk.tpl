<div id="sidebar-cta" class="ui [[+sticky]] cta" property="significantLink">
[[[[[[If?
    &subject=`[[getRawTVValue? &tv=`sidebar_cta`]]`
    &operator=`is`
    &operand=`@INHERIT`
    &then=`
        If?
            &subject=`[[#[[*parent]].sidebar_inheritance]]`
            &operator=`contains`
            &operand=`inherit_cta`
            &then=`#[[*sidebar_cta:empty=`0`]].content`
            &else=``
        `
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
