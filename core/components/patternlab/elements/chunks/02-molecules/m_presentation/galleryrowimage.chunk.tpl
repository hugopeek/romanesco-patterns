[[+lightbox:eq=`1`:then=`
<a class="ui column image" href="[[+url]]">
    <img src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&h=[[++max_thumb_width:mpy=`.625`]]&zc=1`]]" alt="[[+title]]">
</a>
`:else=`
<figure class="ui column image">
    <img src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&h=[[++max_thumb_width:mpy=`.625`]]&zc=1`]]" alt="[[+title]]">
</figure>
`]]