[[getYoutubeThumb?
    &videoID=`[[+video]]`
    &imgSize=`[[+img_size:default=`720`]]`
    &imgType=`[[+img_type:default=`webp`]]`
]]
[[helloConsentFriend?
    &service=`youtube`
    &true=`consent`
    &false=``
    &toPlaceholder=`consent_youtube`
]]

<div class="ui [[+aspect_ratio]] video embed [[+consent_youtube]]"
     data-source="youtube"
     data-id="[[+video]]"
     data-icon="[[+button_size:stripString=`medium`]] play circle outline"
     [[+embed_on_click:is=`1`:then=`
     data-placeholder="[[+youtubeThumb]]"
     data-alt="[[+img_alt:default=`Video thumbnail`]]"
     `]]>
    [[+consent_youtube:notempty=`<div class="pending"><p>[[%romanesco.consent.video_embed? &service=`Youtube`]]</p></div>`]]
</div>

[[loadAssets? &component=`embed`]]