[[getImageList?
    &tvname=`global_background_img`
    &tpl=`globalBackgroundImgCSS`
]]

.background {
    position: relative;
    overflow: hidden;
}
.background:before,
.background:after {
    content: ' ';
    display: block;
    position: absolute;
    left: -1%;
    top: 0;
    width: 102%;
    height: 100%;
}
.background:before {
    z-index: -1;
    background-repeat: no-repeat;
    background-position: 50% 0;
    -ms-background-size: cover;
    -o-background-size: cover;
    -moz-background-size: cover;
    -webkit-background-size: cover;
    background-size: cover;
}
.background:after {
    z-index: -2;
}
.background.inverted {
    background-color: transparent !important;
}