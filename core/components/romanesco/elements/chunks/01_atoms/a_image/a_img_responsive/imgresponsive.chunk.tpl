[[+lazy_load:eq=`1`:then=`data-`:else=``:toPlaceholder=`lazy`]]
[[++max_thumb_width:div=`[[+width]]`:replace=`,==.`:mpy=`[[+height]]`:round=`up`:toPlaceholder=`max_thumb_height`]]
[[If?
    &subject=`[[+enlarge]]`
    &operator=`contains`
    &operand=`inflated`
    &then=`80`
    &else=`[[$imgResponsiveScale?
        &layout_id=`[[+layout_id]]`
        &layout_column=`[[+layout_column]]`
        &uid=`[[+uid]]`
    ]]`
    &toPlaceholder=`scale`
]]
[[responsiveImgSrcset?
    &breakpoints=`[[++romanesco.img_breakpoints]]`
    &quality=`[[++romanesco.img_quality]]`
    &src=`[[+url]]`
    &width=`[[++max_thumb_width]]`
    &uid=`[[+uid]]`
    &toPlaceholder=`srcset`
]]
<img [[+lazy]]srcset="[[+srcset]]"
     [[+lazy]]sizes="(min-width: 1300px) [[+scale]]vw,
                     (min-width: 992px) [[+scale]]vw,
                     (min-width: 768px) [[+scale]]vw,
                     (min-width: 360px) [[+scale]]vw,
                     (max-width: 359px) [[+scale]]vw"
     [[+lazy]]src="[[pthumb:imgOptimizeThumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`]]"
     [[+lazy:notempty=`
     src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 [[++max_thumb_width]] [[+max_thumb_height]]'%3E%3C/svg%3E"
     class="lazy"
     `]]
     width="[[++max_thumb_width]]"
     height="[[+max_thumb_height]]"
     alt="[[+alt:empty=`[[%romanesco.img.alt_fallback]]`:htmlent]]"
>