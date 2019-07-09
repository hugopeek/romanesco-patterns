[[+lightbox:eq=`1`:then=`
<a href="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++img_quality]]&zc=1`]]" data-caption="[[+caption]]">
    <img class="[[+classes]]" src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]" alt="[[+title]]">
</a>
`:else=`
<img class="[[+classes]]" src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]" alt="[[+title]]">
`]]