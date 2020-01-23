<figure class="[[+classes]]">
    [[+lightbox:eq=`1`:then=`
    <a class="ui rounded lightbox image" data-unique-idx="[[+unique_idx]]" data-idx="[[+idx]]">
        <img src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]" alt="[[+title]]">
    </a>
    `:else=`
    <img class="ui image" src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]" alt="[[+title]]">
    `]]
</figure>