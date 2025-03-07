<meta property="og:type" content="website" />
<meta property="og:title" content="[[*longtitle:empty=`[[*pagetitle]]`]]" />
<meta property="og:description" content="[[*description:empty=`[[*introtext:stripTags:strip:htmlent]]`]]" />
<meta property="og:url" content="[[~[[*id]]? &scheme=`full`]]" />
[[returnFirstHit:toPlaceholder=`opengraph_img`?
    &1=`[[*overview_img_wide]]`
    &2=`[[*overview_img_pano]]`
    &3=`[[*overview_img_landscape]]`
    &4=`[[*overview_img_square]]`
    &5=`[[*overview_img_portrait]]`
    &6=`[[*overview_img_free]]`
]]
[[[[+opengraph_img:notempty=`
    ImagePlus?
        &value=`[[+opengraph_img]]`
        &type=`tpl`
        &tpl=`imgOpenGraphRow`
        &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`
    `
]]]]