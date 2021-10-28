[[+img_scale:default=`100`:toPlaceholder=`scale`]]
[[+lazy_load:eq=`1`:then=`data-`:else=``:toPlaceholder=`lazy`]]
[[++max_thumb_width:div=`[[+crop.width]]`:replace=`,==.`:mpy=`[[+crop.height]]`:round=`up`:toPlaceholder=`max_thumb_height`]]
[[responsiveImgSrcset?
    &breakpoints=`[[++romanesco.img_breakpoints]]`
    &quality=`[[++romanesco.img_quality]]`
    &src=`[[+source.src]]`
    &crop=`[[+crop.options]]`
    &width=`[[+width]]`
    &toPlaceholder=`[[+prefix]].srcset`
]]

<img [[+lazy]]srcset="[[+[[+prefix]].srcset]]"
     [[+lazy]]sizes="(min-width: 1300px) calc([[+scale]]vw / [[+cols]]),
                     (min-width: 992px) calc([[+scale]]vw / [[+cols]]),
                     (min-width: 768px) [[+cols:gt=`2`:then=`calc(([[+scale]]vw - 2em) / 2)`:else=`[[+scale]]vw`]],
                     (min-width: 360px) [[+scale]]vw,
                     [[+scale]]vw"
     [[+lazy]]src="[[+url:imgOptimizeThumb]]"
     [[+lazy:notempty=`
     src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 [[++max_thumb_width]] [[+max_thumb_height]]'%3E%3C/svg%3E"
     class="lazy"
     `]]
     width="[[++max_thumb_width]]"
     height="[[+max_thumb_height]]"
     alt="[[+alt:empty=`[[+pagetitle]]`:htmlent]]"
/>