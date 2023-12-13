[[getVimeoData?
    &videoURL=`[[+video]]`
    &imgSize=`[[+img_size:default=`720`]]`
    &imgType=`[[+img_type:default=`webp`]]`
]]
[[helloConsentFriend?
    &service=`vimeo`
    &true=`consent`
    &false=``
    &toPlaceholder=`consent_vimeo`
]]

<div class="ui [[+aspect_ratio]] video embed [[+consent_vimeo]]"
     data-source="vimeo"
     data-id="[[+vimeoID]]"
     data-icon="[[+button_size:stripString=`medium`]] play circle outline"
     [[+embed_on_click:is=`1`:then=`
     data-placeholder="[[+vimeoThumb]]"
     data-alt="[[+img_alt:default=`Video thumbnail`]]"
     `]]>
    [[+consent_vimeo:notempty=`<div class="pending"><p>[[%romanesco.consent.video_embed? &service=`Vimeo`]]</p></div>`]]
</div>

[[loadAssets? &component=`embed`]]