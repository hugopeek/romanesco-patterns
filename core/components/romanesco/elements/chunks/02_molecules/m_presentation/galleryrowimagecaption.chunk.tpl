<div class="column">
    <figure class="ui [[+column_type]]">
        <img class="ui rounded [[+lightbox:eq=`1`:then=`lightbox`]] image"
             src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]"
             alt="[[+title]]"
             data-lightbox-img="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++img_quality]]&zc=1`]]"
             data-caption="[[+title]]"
             data-idx="[[+idx]]"
        >
        [[+column_type:isnot=`minimal`:then=`
        <figcaption class="content">
            [[+caption:nl2br:stripTags=`<br>,<strong>,<em>,<cite>,<a>`]]
        </figcaption>
        `]]
    </figure>
</div>