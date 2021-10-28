[[+lazy_load:eq=`1`:then=`data-`:else=``:toPlaceholder=`lazy`]]
[[++max_thumb_width:div=`[[+width]]`:replace=`,==.`:mpy=`[[+height]]`:round=`up`:toPlaceholder=`max_thumb_height`]]
[[$imgResponsiveScale:toPlaceholder=`scale`?
    &layout_id=`[[+layout_id]]`
    &layout_column=`[[+layout_column]]`
]]
[[responsiveImgSrcset?
    &breakpoints=`[[++romanesco.img_breakpoints]]`
    &quality=`[[++romanesco.img_quality]]`
    &src=`[[+url]]`
    &width=`[[++max_thumb_width]]`
    &toPlaceholder=`srcset`
]]
<figure class="ui [[+classes]] content image">
    <img [[+lazy]]srcset="[[+srcset]]"
         [[+lazy]]sizes="(min-width: 1300px) [[+scale]]vw,
                         (min-width: 992px) [[+scale]]vw,
                         (min-width: 768px) [[+scale]]vw,
                         (min-width: 360px) 100vw,
                         100vw"
         [[+lazy]]src="[[pthumb:imgOptimizeThumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`]]"
         [[+lazy:notempty=`
         src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 [[++max_thumb_width]] [[+max_thumb_height]]'%3E%3C/svg%3E"
         class="lazy"
         `]]
         width="[[++max_thumb_width]]"
         height="[[+max_thumb_height]]"
         alt="[[+alt:htmlent]]">
    [[If?
        &subject=`[[+credits]][[+caption]]`
        &operator=`notempty`
        &then=`<figcaption>[[+caption]][[+credits:stripTags=`<a>,<em>,<strong>`:prepend=`<span class="credits meta">&copy; `:append=`</span>`]]</figcaption>`
    ]]
</figure>