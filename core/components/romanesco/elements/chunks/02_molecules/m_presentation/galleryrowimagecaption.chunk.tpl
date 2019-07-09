<div class="column">
    <figure class="ui [[+box_type]]">
        [[+lightbox:eq=`1`:then=`
        <a href="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width:mpy=`1.5`]]&q=[[++img_quality]]&zc=1`]]" data-caption="[[+caption:nl2br:stripTags=`<br>,<strong>,<em>`]]">
            <img class="ui image" src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]" alt="[[+title]]">
        </a>
        `:else=`
        <img class="ui image" src="[[pthumb? &input=`[[+url]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]" alt="[[+title]]">
        `]]
        [[+box_type:isnot=`lightbox`:then=`
        <figcaption class="content">
            [[+caption:nl2br:stripTags=`<br>,<strong>,<em>,<cite>,<a>`]]
        </figcaption>
        `]]
    </figure>
</div>