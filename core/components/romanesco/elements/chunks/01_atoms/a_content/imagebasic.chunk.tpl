[[+img_scale:default=`100`:toPlaceholder=`scale`]]
[[+lazy_load:eq=`1`:then=`data-`:else=``:toPlaceholder=`lazy`]]
[[++max_thumb_width:div=`[[+width]]`:mpy=`[[+height]]`:toPlaceholder=`max_thumb_height`]]
[[responsiveImgSrcset?
    &breakpoints=`[[++img_breakpoints]]`
    &quality=`[[++img_quality]]`
    &src=`[[+url]]`
    &width=`[[++max_thumb_width]]`
    &toPlaceholder=`srcset`
]]
<figure class="ui [[+classes]] content image">
    <img [[+lazy]]srcset="[[+srcset]]"
         [[+lazy]]sizes="(min-width: 1300px) [[+scale]]vw,
                         (min-width: 992px) [[+scale]]vw,
                         (min-width: 768px) [[+scale]]vw,
                         (min-width: 360px) [[+scale]]vw,
                         [[+scale]]vw"
         [[+lazy]]src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]"
         [[+lazy:notempty=`
         src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 [[++max_thumb_width]] [[+max_thumb_height]]'%3E%3C/svg%3E"
         class="lazy"
         `]]
         width="[[++max_thumb_width]]"
         height="[[+max_thumb_height]]"
         alt="[[+alt:htmlent]]">
</figure>