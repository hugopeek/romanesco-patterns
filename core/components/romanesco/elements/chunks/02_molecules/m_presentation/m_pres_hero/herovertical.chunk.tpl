<div id="hero" class="ui link items">
    [[[[[[If?
        &subject=`[[getRawTVValue? &tv=`header_cta`]]`
        &operator=`is`
        &operand=`@INHERIT`
        &then=`
            If?
                &subject=`[[#[[*parent]].header_inheritance]]`
                &operator=`contains`
                &operand=`inherit_cta`
                &then=`$ctaHeaderVertical`
                &else=``
            `
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