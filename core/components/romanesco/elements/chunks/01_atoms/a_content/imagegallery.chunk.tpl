[[+lazy_load:eq=`1`:then=`data-`:else=``:toPlaceholder=`lazy`]]
[[++max_thumb_width:div=`[[+crops.default.width:empty=`[[+width]]`]]`:replace=`,==.`:mpy=`[[+crops.default.height:empty=`[[+height]]`]]`:round:toPlaceholder=`max_thumb_height`]]
[[$imgResponsiveScale:toPlaceholder=`scale`?
    &layout_id=`[[+layout_id]]`
    &layout_column=`[[+layout_column]]`
]]
[[responsiveImgSrcset?
    &breakpoints=`[[++img_breakpoints]]`
    &quality=`[[++img_quality]]`
    &src=`[[+crops.default.url:empty=`[[+url]]`]]`
    &width=`[[++max_thumb_width]]`
    &toPlaceholder=`srcset`
]]
<img [[+lazy]]srcset="[[+srcset]]"
     [[+lazy]]sizes="(min-width: 1300px) [[+scale]]vw / [[+cols:textToNumber]],
                     (min-width: 992px) [[+scale]]vw / [[+cols:textToNumber]],
                     (min-width: 768px) 100vw,
                     (min-width: 360px) 100vw,
                     100vw"
     [[+lazy]]src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]"
     [[+lazy:notempty=`
     src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 [[++max_thumb_width]] [[+max_thumb_height]]'%3E%3C/svg%3E"
     class="lazy"
     `]]
     [[+lightbox:eq=`1`:then=`
     data-lightbox-img="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++img_quality]]&zc=1`]]"
     data-caption="[[+title]]"
     `]]
     width="[[++max_thumb_width]]"
     height="[[+max_thumb_height]]"
     alt="[[+alt:htmlent]]"
>