<div class="column">
    <figure class="ui rounded [[+classes]] [[+lightbox:eq=`1`:then=`lightbox`]] image" data-idx="[[+idx]]">
        [[[[modifiedIf?
            &subject=`[[+extension:lcase]]`
            &operator=`EQ`
            &operand=`svg`
            &then=`svgSanitize? &file=`[[+url]]` &title=`[[+alt]]``
            &else=`$imgResponsiveGallery? &uid=`[[+unique_idx]]``
        ]]]]
    </figure>
</div>
