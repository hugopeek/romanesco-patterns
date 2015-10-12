.background.[[+background_title:stripAsAlias]]:before {
    background-image: url("[[ImagePlus? &value=`[[+background_img]]` &type=`thumb`]]") !important;
    opacity: [[+background_opacity:div=`100`:replace=`,==.`:empty=`1`]];
    [[+background_color:ne=`background-color: [[+background_color]];`]]
}