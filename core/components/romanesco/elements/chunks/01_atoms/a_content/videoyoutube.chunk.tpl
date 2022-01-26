[[getYoutubeThumb?
    &videoID=`[[+video]]`
    &imgSize=`[[+img_size:default=`720`]]`
    &imgType=`[[+img_type:default=`webp`]]`
]]

<div class="ui [[+aspect_ratio]] video embed"
     data-source="youtube"
     data-id="[[+video]]"
     data-icon="[[+button_size:stripString=`medium`]] play circle outline"
     [[+embed_on_click:is=`1`:then=`data-placeholder="[[+youtubeThumb]]"`]]>
</div>