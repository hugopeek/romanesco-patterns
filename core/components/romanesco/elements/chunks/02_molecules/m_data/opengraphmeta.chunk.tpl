<meta property="og:type" content="website" />
<meta property="og:title" content="[[*longtitle:empty=`[[*pagetitle]]`]]" />
<meta property="og:description" content="[[*description:empty=`[[*introtext]]`:stripTags:strip]]" />
<meta property="og:url" content="[[~[[*id]]? &scheme=`full`]]" />
[[returnFirstHit:toPlaceholder=`opengraph_img_type`?
    &1=`[[*overview_img_wide:notempty=`wide`]]`
    &2=`[[*overview_img_pano:notempty=`pano`]]`
    &3=`[[*overview_img_landscape:notempty=`landscape`]]`
    &4=`[[*overview_img_square:notempty=`square`]]`
    &5=`[[*overview_img_portrait:notempty=`portrait`]]`
    &6=`[[*overview_img_free:notempty=`free`]]`
]]
[[[[+opengraph_img_type:notempty=`
    ImagePlus?
        &tvname=`overview_img_[[+opengraph_img_type]]`
        &type=`tpl`
        &tpl=`imgOpenGraphRow`
        &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`
    `
]]]]