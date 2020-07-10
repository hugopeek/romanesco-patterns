<div class="column">
    <figure class="ui [[+column_type]] [[+lightbox:eq=`1`:then=`lightbox`]] image" data-idx="[[+idx]]">
        [[+image]]
        [[+column_type:isnot=`minimal`:then=`
        <figcaption class="content">
            [[+caption:nl2br:stripTags=`<br>,<strong>,<em>,<cite>,<a>`]]
        </figcaption>
        `]]
    </figure>
</div>