.background.[[+background_title:stripAsAlias]]:before {
    background-image: url("[[ImagePlus? &value=`[[+background_img]]` &type=`thumb`]]") !important;
    opacity: [[+background_opacity:div=`100`:replace=`,==.`:empty=`1`]];
}
.background.[[+background_title:stripAsAlias]]:after {
    [[+background_color:notempty=`background-color: [[+background_color]] !important;`]]
}