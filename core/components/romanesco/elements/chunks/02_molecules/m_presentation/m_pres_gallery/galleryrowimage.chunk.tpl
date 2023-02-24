<div class="column">
    <figure class="ui rounded [[+classes]] [[+extension:lcase]] [[+lightbox:eq=`1`:then=`lightbox`]] image" data-idx="[[+idx]]">
        [[[[modifiedIf?
            &subject=`[[+extension:lcase]]`
            &operator=`EQ`
            &operand=`svg`
            &then=`$svg? &classes=`regular` &url=`[[+url]]` &alt=`[[+title]]` &uid=`[[+unique_idx]]``
            &else=`$imgResponsiveGallery? &alt=`[[+title]]` &uid=`[[+unique_idx]]``
        ]]]]
    </figure>
</div>
