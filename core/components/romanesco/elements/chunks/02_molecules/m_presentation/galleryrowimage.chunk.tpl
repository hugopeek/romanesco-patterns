<figure class="[[+classes]]">
    [[+lightbox:eq=`1`:then=`
    <a class="ui image" href="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&zc=1`]]">
        <img src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&zc=1`]]" alt="[[+title]]">
    </a>
    `:else=`
    <img class="ui image" src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&zc=1`]]" alt="[[+title]]">
    `]]
</figure>