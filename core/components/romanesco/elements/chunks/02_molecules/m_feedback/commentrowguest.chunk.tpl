<li class="comment ticket-comment" id="comment-[[+id]]">
    <a class="avatar">
        <img src="[[+avatar]]" alt="[[+fullname]] avatar">
    </a>
    <div class="content">
        <a class="author">[[+fullname]]</a>
        <div class="metadata">
            <span class="date">[[+date_ago]]</span>[[+comment_was_edited]]
        </div>
        <div class="text">
            [[+text]]
        </div>
        <div class="actions comment-reply">
            <a href="#" class="reply">[[%ticket_comment_reply]]</a>
            [[+comment_edit_link]]
        </div>
    </div>
    [[+children:notempty=`
    <ol class="comments">
        [[+children]]
    </ol>
    `:else=``]]
</li>
<!--tickets_rating_positive  positive-->
<!--tickets_rating_negative  negative-->
<!--tickets_has_parent <span class="ticket-comment-up"><a href="[[+url]]#comment-[[+parent]]" data-id="[[+id]]" data-parent="[[+parent]]">&uarr;</a></span>-->