[[+width:lte=`[[+crop.width]]`:then=`[[+width]]`:else=`[[+crop.width]]`:toPlaceholder=`thumb_width`]]
[[+thumb_width:div=`[[+crop.width]]`:replace=`,==.`:mpy=`[[+crop.height]]`:round=`up`:toPlaceholder=`thumb_height`]]
<meta property="og:image" content="[[++site_url:clipString=`-1`]][[+url:imgOptimizeThumb]]" />
<meta property="og:image:width" content="[[+thumb_width]]" />
<meta property="og:image:height" content="[[+thumb_height]]" />