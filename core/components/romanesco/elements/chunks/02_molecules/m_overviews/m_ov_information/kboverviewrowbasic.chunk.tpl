<section class="ui vertical stripe segment white ticket">
    <div class="ui container">
        <h2 class="title"><a href="[[~[[+id]]]]">[[+pagetitle]]</a></h2>
        <div class="content lead">
            [[+introtext:ellipsis=`400`]]
        </div>

        <footer class="ui equal width meta grid ticket-meta" data-id="[[+id]]">
            <div class="compact column">
                <i class="calendar icon"></i> [[+date_ago]]
            </div>
            <div class="compact column">
                <i class="user icon"></i> [[+fullname]]
            </div>
            [[+section.id:ne=`[[*id]]`:then=`
            <div class="compact column">
                <a href="[[~[[+section.id]]]]"><i class="folder open icon"></i> [[+section.pagetitle]]</a>
            </div>
            `]]
            <div class="compact column">
                <i class="star icon"></i>
                <span class="ticket-star[[+can_star]]">[[+stared]][[+unstared]] <span class="ticket-star-count">[[+stars]]</span></span>
            </div>
            <div class="compact column">
                <i class="eye open icon"></i> [[+views]]
            </div>
            <div class="compact column">
                <i class="comment icon"></i> [[+comments]]
                [[+new_comments:ne=`0`:and:ne=``:then=`<span class="ui tiny floating blue label">1[[+new_comments]]&nbsp;new</span>`]]
            </div>
            <div class="right aligned column ticket-rating[[+active]][[+inactive]]">
                <span class="vote plus[[+voted_plus]]" title="[[%ticket_like]]">
                    <i class="small green circular plus icon"></i>
                </span>
                [[+can_vote]][[+cant_vote]]
                <span class="vote minus[[+voted_minus]]" title="[[%ticket_dislike]]">
                    <i class="small red circular minus icon"></i>
                </span>
            </div>
        </footer>
    </div>
</section>
<!--tickets_can_vote <span class="vote rating" title="[[%ticket_refrain]]"><i class="circular plus icon"></i></span>-->
<!--tickets_cant_vote <span class="rating[[+rating_positive]][[+rating_negative]]" title="[[%ticket_rating_total]] [[+rating_total]]: ↑[[+rating_plus]] [[%ticket_rating_and]] ↓[[+rating_minus]]">[[+rating]]</span>-->
<!--tickets_new_comments <span class="ticket-new-comments">+[[+new_comments]]</span>-->
<!--tickets_active  active-->
<!--tickets_inactive  inactive-->
<!--tickets_voted_plus  voted-->
<!--tickets_voted_minus  voted-->
<!--tickets_rating_positive  positive-->
<!--tickets_rating_negative  negative-->
<!--tickets_can_star  active-->
<!--tickets_stared <i class="blue star icon"></i>-->
<!--tickets_unstared <i class="glyphicon glyphicon-star unstared star"></i>-->