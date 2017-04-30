[[+img_scale:default=`100`:toPlaceholder=`scale`]]
[[responsiveImgSrcset?
    &breakpoints=`[[++img_breakpoints]]`
    &quality=`[[++img_quality]]`
    &src=`[[+source.src]]`
    &crop=`[[+crop.options]]`
    &width=`[[+width]]`
    &toPlaceholder=`srcset`
]]

<img srcset="[[+srcset]]"
     sizes="(min-width: 1300px) calc([[+scale]]vw / [[+cols]]),
        (min-width: 992px) calc([[+scale]]vw / [[+cols]]),
        (min-width: 768px) [[+cols:gt=`2`:then=`calc(([[+scale]]vw - 2em) / 2)`:else=`[[+scale]]vw`]],
        (min-width: 360px) [[+scale]]vw,
        [[+scale]]vw"
     src="[[+url]]"
     alt="[[+alt:htmlent]]"
/>