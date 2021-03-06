[[+lazy_load:eq=`1`:then=`data-`:else=``:toPlaceholder=`lazy`]]
[[$imgResponsiveScale:toPlaceholder=`scale`?
    &layout_id=`[[+layout_id]]`
    &layout_column=`[[+layout_column]]`
]]
[[responsiveImgSrcset?
    &breakpoints=`[[++img_breakpoints]]`
    &quality=`[[++img_quality]]`
    &src=`[[+url]]`
    &width=`[[+width]]`
    &toPlaceholder=`[[+prefix]].srcset`
]]
<div class="column">
    <figure class="ui rounded [[+classes]] [[+lightbox:eq=`1`:then=`lightbox`]] image" data-idx="[[+idx]]">
        <img [[+lazy]]srcset="[[+[[+prefix]].srcset]]"
             [[+lazy]]sizes="(min-width: 1300px) calc([[+scale]]vw / [[+cols]]),
                             (min-width: 992px) calc([[+scale]]vw / [[+cols]]),
                             (min-width: 768px) [[+cols:gt=`2`:then=`calc(([[+scale]]vw - 2em) / 2)`:else=`[[+scale]]vw`]],
                             (min-width: 360px) [[+scale]]vw,
                             [[+scale]]vw"
             [[+lazy]]src="[[+url]]"
             [[+lazy:notempty=`
             src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 [[+width]] [[+height]]'%3E%3C/svg%3E"
             class="lazy"
             `]]
             [[+lightbox:eq=`1`:then=`
             data-lightbox-img="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++img_quality]]&zc=1`]]"
             data-caption="[[+title]]"
             `]]
             width="[[+width]]"
             height="[[+height]]"
             alt="[[+alt:htmlent]]"
        />
    </figure>
</div>
