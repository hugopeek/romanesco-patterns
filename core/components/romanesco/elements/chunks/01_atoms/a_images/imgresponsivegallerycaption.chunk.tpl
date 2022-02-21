[[+lazy_load:eq=`1`:then=`data-`:else=``:toPlaceholder=`lazy`]]
[[++max_thumb_width:div=`[[+crops.default.width:empty=`[[+width]]`]]`:replace=`,==.`:mpy=`[[+crops.default.height:empty=`[[+height]]`]]`:round=`up`:toPlaceholder=`max_thumb_height`]]
[[$imgResponsiveScale:toPlaceholder=`scale`?
    &layout_id=`[[+layout_id]]`
    &layout_column=`[[+layout_column]]`
    &uid=`[[+unique_idx]]`
]]
[[responsiveImgSrcset?
    &breakpoints=`[[++romanesco.img_breakpoints]]`
    &quality=`[[++romanesco.img_quality]]`
    &src=`[[+crops.default.url:empty=`[[+url]]`]]`
    &width=`[[++max_thumb_width]]`
    &uid=`[[+unique_idx]]`
    &toPlaceholder=`srcset`
]]
<img [[+lazy]]srcset="[[+srcset]]"
     [[+lazy]]sizes="(min-width: 1300px) calc([[+scale]]vw / [[+cols:textToNumber]]),
                     (min-width: 992px) calc([[+scale]]vw / [[+cols:textToNumber]]),
                     (min-width: 768px) [[+cols:textToNumber:gt=`2`:then=`calc(([[+scale]]vw - 2em) / 2)`:else=`[[+scale]]vw`]],
                     (min-width: 360px) [[+cols:textToNumber:gt=`2`:then=`calc(([[+scale]]vw - 2em) / 2)`:else=`[[+scale]]vw`]],
                     (max-width: 359px) calc([[+scale]]vw / [[+cols:textToNumber]])"
     [[+lazy]]src="[[pthumb:imgOptimizeThumb? &input=`[[+crops.default.url:empty=`[[+url]]`]]` &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`]]"
     [[+lazy:notempty=`
     src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 [[++max_thumb_width]] [[+max_thumb_height]]'%3E%3C/svg%3E"
     class="lazy"
     `]]
     [[+lightbox:eq=`1`:then=`
     data-lightbox-img="[[pthumb:imgOptimizeThumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++romanesco.img_quality]]&zc=1`]]"
     data-caption="[[+title]]"
     `]]
     width="[[++max_thumb_width]]"
     height="[[+max_thumb_height]]"
     alt="[[+alt:htmlent]]"
>