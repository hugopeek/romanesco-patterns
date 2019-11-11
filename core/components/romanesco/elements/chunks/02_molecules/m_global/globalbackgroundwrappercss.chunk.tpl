[[jsonGetValue? &json=`[ [[+rows]] ]` &key=`url` &toPlaceholder=`background_images`]]
[[jsonGetValue? &json=`[ [[+rows]] ]` &key=`position` &toPlaceholder=`background_positions`]]
[[jsonGetValue? &json=`[ [[+rows]] ]` &key=`width` &toPlaceholder=`background_sizes`]]
<style>
    .background.test:before {
        background-image:
            [[+background_images]] !important
        ;
        background-position: [[+background_positions]] !important;
        background-size: [[+background_sizes]] !important;

        opacity: [[+background_opacity:div=`100`:replace=`,==.`:empty=`1`]];
    }
    .background.test:after {
        [[+background_color:notempty=`background-color: [[+background_color]] !important;`]]
    }
</style>