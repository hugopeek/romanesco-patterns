<div class="column">
    <figure class="ui rounded [[+classes]] [[+extension:lcase]] [[+lightbox:eq=`1`:then=`lightbox`]] image" data-idx="[[+idx]]">
        [[[[If?
            &subject=`[[+extension:lcase]]`
            &operator=`EQ`
            &operand=`svg`
            &then=`$svg? &classes=`regular` &url=`[[+url]]` &alt=`[[+title:empty=`[[%romanesco.gallery.alt_fallback]]`]]` &uid=`[[+unique_idx]]``
            &else=`$imgResponsiveGallery? &alt=`[[+title:empty=`[[%romanesco.gallery.alt_fallback]]`]]` &uid=`[[+unique_idx]]``
        ]]]]
    </figure>
</div>
