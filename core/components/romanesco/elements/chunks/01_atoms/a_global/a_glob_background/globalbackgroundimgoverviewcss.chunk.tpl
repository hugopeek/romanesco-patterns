.background.[[+alias]]:before {
    background-image: url("[[ImagePlus? &value=`[[+overview_img_pano:empty=`[[+overview_img_wide]]`]]` &options=`w=800&q=[[++romanesco.img_quality]]` &type=`thumb`]]") !important;
    opacity: 1;
}

.background.[[+alias]]:after {
    [[+background_color:notempty=`background-color: [[+background_color]] !important;`]]
}

@media
    (min-width: 800px) {
    .background.[[+alias]]:before {
        background-image: url("[[ImagePlus? &value=`[[+overview_img_pano:empty=`[[+overview_img_wide]]`]]` &options=`w=1600&q=[[++romanesco.img_quality]]` &type=`thumb`]]") !important;
    }
}

[[++img_hidpi:eq=`1`:then=`
@media
    (-webkit-min-device-pixel-ratio: 2),
    (min-resolution: 192dpi) {
    .background.[[+alias]]:before {
        background-image: url("[[ImagePlus? &value=`[[+overview_img_pano:empty=`[[+overview_img_wide]]`]]` &options=`w=1200&q=[[++romanesco.img_quality]]` &type=`thumb`]]") !important;
    }
}
@media
    (-webkit-min-device-pixel-ratio: 2) and (min-width: 800px),
    (min-resolution: 192dpi) and (min-width: 800px) {
    .background.[[+alias]]:before {
        background-image: url("[[ImagePlus? &value=`[[+overview_img_pano:empty=`[[+overview_img_wide]]`]]` &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]` &type=`thumb`]]") !important;
    }
}
`]]