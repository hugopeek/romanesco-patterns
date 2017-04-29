[[+img_scale:default=`100`:toPlaceholder=`scale`]]
[[responsiveImgSrcset?
    &breakpoints=`320,560,800,960,1024,1140,1280,1440,1600,1920`
    &quality=`[[++thumb_quality:default=`65`]]`
    &src=`[[+source.src]]`
    &crop=`[[+crop.options]]`
    &width=`[[+width]]`
    &toPlaceholder=`srcset`
]]
[[-responsiveImgSrcset?
    &breakpoints=`[[++responsive_img_breakpoints]]`
    &quality=`[[++thumb_quality]]`
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