[[[[[[If?
    &subject=`[[getRawTVValue? &tv=`sidebar_cta`]]`
    &operator=`EQ`
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