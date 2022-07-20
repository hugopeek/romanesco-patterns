<div id="hero" class="ui link items">
    [[[[[[If?
        &subject=`[[getRawTVValue? &tv=`header_cta`]]`
        &operator=`EQ`
        &operand=`@INHERIT`
        &then=`#[[*parent]].header_inheritance:contains=`inherit_cta`:then=`$ctaHeaderVertical`:else=```
        &else=`
            If?
                &subject=`[[getRawTVValue? &tv=`header_cta`]]`
                &operator=`isnot`
                &operand=`@INHERIT`
                &then=`$ctaHeaderVertical`
                &else=``
            `
    ]]]]]]
</div>