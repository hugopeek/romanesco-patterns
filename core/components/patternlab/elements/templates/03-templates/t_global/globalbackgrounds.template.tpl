[[getImageList?
    &tvname=`global_background_img`
    &tpl=`globalBackgroundImgCSS`
]]

.background {
    position: relative;
    overflow: hidden;
}
.background:before {
    content: ' ';
    display: block;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    background-repeat: no-repeat;
    background-position: 50% 0;
    -ms-background-size: cover;
    -o-background-size: cover;
    -moz-background-size: cover;
    -webkit-background-size: cover;
    background-size: cover;
}
.background.inverted {
    background-color: transparent !important;
}