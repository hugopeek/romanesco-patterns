<div id="comments-wrapper">
    <h3 class="ui tiny dividing header title">
        [[%comments]] (<span id="comment-total">[[+total]]</span>)
    </h3>
    <ol id="comments" class="ui minimal threaded comments">
        [[+comments]]
    </ol>
</div>

<div id="comments-tpanel">
    <div id="tpanel-refresh"></div>
    <div id="tpanel-new"></div>
</div>

[[+modx.user.id:isloggedin:is=`1`:then=`
<span class="ui checkbox comments-subscribe">
    <input type="checkbox" name="" id="comments-subscribe" value="1" [[+subscribed]]>
    <label for="comments-subscribe">
        [[%ticket_comment_notify]]
    </label>
</span>
`:else=``:toPlaceholder=`comments_subscribe`]]

<!--tickets_subscribed checked-->
