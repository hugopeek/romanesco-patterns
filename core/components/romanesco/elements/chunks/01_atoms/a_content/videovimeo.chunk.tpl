[[getVimeoData? &videoURL=`[[+video]]`]]

<div class="ui [[+aspect_ratio]] video embed"
     data-source="vimeo"
     data-id="[[+vimeoID]]"
     data-icon="[[+button_size:stripString=`medium`]] video play"
     [[+embed_on_click:is=`1`:then=`data-placeholder="https://i.vimeocdn.com/video/[[+vimeoThumbID]]_[[+img_size:default=`720`]].[[+img_type:default=`webp`]]"`]]>
</div>