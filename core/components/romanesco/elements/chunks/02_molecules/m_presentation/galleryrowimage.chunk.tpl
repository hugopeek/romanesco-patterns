<figure class="[[+classes]]">
    [[+lightbox:eq=`1`:then=`
    <a class="ui image" href="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++img_quality]]&zc=1`]]">
        <img src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]" alt="[[+title]]">
    </a>
    `:else=`
    <img class="ui image" src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]" alt="[[+title]]">
    `]]
</figure>