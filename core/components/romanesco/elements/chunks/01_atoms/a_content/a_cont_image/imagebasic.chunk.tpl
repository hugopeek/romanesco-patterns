<figure [[+id:prepend=`id="`:append=`"`]] class="ui [[+classes]] content image">
    [[$imgResponsive? &uid=`[[+url]]`]]
    [[[[If?
        &subject=`[[+credits]][[+caption]]`
        &operator=`notempty`
        &then=`$imageBasicCaption? &uid=`[[+uid]]``
    ]]]]
</figure>