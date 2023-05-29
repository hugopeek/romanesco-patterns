[[getVimeoData?
    &videoURL=`[[+video]]`
    &imgSize=`[[+img_size:default=`720`]]`
    &imgType=`[[+img_type:default=`webp`]]`
]]

<div class="ui [[+aspect_ratio]] video embed"
     data-source="vimeo"
     data-id="[[+vimeoID]]"
     data-icon="[[+button_size:stripString=`medium`]] play circle outline"
     [[+embed_on_click:is=`1`:then=`
     data-placeholder="[[+vimeoThumb]]"
     data-alt="[[+img_alt:default=`Video thumbnail`]]"
     `]]>
</div>