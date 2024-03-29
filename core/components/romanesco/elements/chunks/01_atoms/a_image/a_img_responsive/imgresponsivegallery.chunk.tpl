[[+lazy_load:eq=`1`:then=`data-`:else=``:toPlaceholder=`lazy`]]
[[$imgResponsiveScale:toPlaceholder=`scale`?
    &layout_id=`[[+layout_id]]`
    &layout_column=`[[+layout_column]]`
    &uid=`[[+unique_idx]]`
]]
[[responsiveImgSrcset?
    &breakpoints=`[[++romanesco.img_breakpoints]]`
    &quality=`[[++romanesco.img_quality]]`
    &src=`[[+url]]`
    &width=`[[+width]]`
    &uid=`[[+unique_idx]]`
    &toPlaceholder=`srcset`
]]
<img [[+lazy]]srcset="[[+srcset]]"
     [[+lazy]]sizes="(min-width: 1300px) calc([[+scale]]vw / [[+cols]]),
                     (min-width: 992px) calc([[+scale]]vw / [[+cols]]),
                     (min-width: 768px) [[+cols:gt=`2`:then=`calc(([[+scale]]vw - 2em) / 2)`:else=`[[+scale]]vw`]],
                     (min-width: 360px) [[+cols:gt=`2`:then=`calc(([[+scale]]vw - 2em) / 2)`:else=`[[+scale]]vw`]],
                     (max-width: 359px) calc([[+scale]]vw / [[+cols]])"
     [[+lazy]]src="[[+url:imgOptimizeThumb]]"
     [[+lazy:notempty=`
     src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 [[+width]] [[+height]]'%3E%3C/svg%3E"
     class="lazy"
     `]]
     [[+lightbox:eq=`1`:then=`
     data-lightbox-img="[[pthumb:imgOptimizeThumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++romanesco.img_quality]]&zc=1`]]"
     data-caption="[[+title]]"
     `]]
     [[+width:notempty=`width="[[+width]]"`]]
     [[+height:notempty=`height="[[+height]]"`]]
     alt="[[+alt:htmlent]]"
/>