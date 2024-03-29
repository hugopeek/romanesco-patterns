[[+background_svg:notempty=`, url("/uploads/img/background/[[+background_svg]]")`:toPlaceholder=`background_img_secondary`]]

.background.[[+background_title:stripAsAlias]]:before {
    background-image:
        url("[[ImagePlus? &value=`[[+background_img_portrait:empty=`[[+background_img]]`]]` &options=`w=800&q=[[++romanesco.img_quality]]` &type=`thumb`]]")
        [[+background_img_secondary]] !important
    ;
    opacity: [[+background_opacity:div=`100`:replace=`,==.`:empty=`1`]];
}
.background.[[+background_title:stripAsAlias]]:after {
    [[+background_color:notempty=`background-color: [[+background_color]] !important;`]]
}

@media
    (min-width: 800px) {
    .background.[[+background_title:stripAsAlias]]:before {
        background-image:
            url("[[ImagePlus? &value=`[[+background_img]]` &options=`w=1600&q=[[++romanesco.img_quality]]` &type=`thumb`]]")
            [[+background_img_secondary]] !important
        ;
    }
}

[[++img_hidpi:eq=`1`:then=`
@media
    (-webkit-min-device-pixel-ratio: 2),
    (min-resolution: 192dpi) {
    .background.[[+background_title:stripAsAlias]]:before {
        background-image:
            url("[[ImagePlus? &value=`[[+background_img_portrait:empty=`[[+background_img]]`]]` &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]` &type=`thumb`]]")
            [[+background_img_secondary]] !important
        ;
    }
}
@media
    (-webkit-min-device-pixel-ratio: 2) and (min-width: 800px),
    (min-resolution: 192dpi) and (min-width: 800px) {
    .background.[[+background_title:stripAsAlias]]:before {
        background-image:
            url("[[ImagePlus? &value=`[[+background_img]]` &options=`w=[[++max_thumb_width:mpy=`2`]]&q=[[++romanesco.img_quality]]` &type=`thumb`]]")
            [[+background_img_secondary]] !important
        ;
    }
}
`]]