<div id="gallery-[[+unique_idx]]"
     class="ui [[+cols]] column [[+responsive:replace=`,== `]] [[+padding]] grid gallery [[+lightbox:eq=`1`:then=`with lightbox`]] [[+caption:eq=`1`:then=`with caption`]]"
     data-uid="[[+unique_idx]]"
    >
    [[+rows]]
</div>

[[sliderLoadAssets?
    &uid=`[[+unique_idx]]`
    &behaviour=`loop,arrows,keyboard`
    &lazyload=`0`
    &pagination=`bullets`
    &lightbox=`[[+lightbox]]`
]]