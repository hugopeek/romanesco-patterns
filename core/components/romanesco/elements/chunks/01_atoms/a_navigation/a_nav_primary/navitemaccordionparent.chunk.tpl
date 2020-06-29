[[+wrapper:isnot=``:then=`
<li class="link item [[+classnames]]">
    <div class="title [[+active]]">
        <a href="[[+link]]" [[+attributes]]>
            [[+menutitle]]
        </a>
        <button class="ui tiny icon button"><i class="dropdown icon"></i></button>
    </div>
    <ul class="content [[+active]]">
        [[+wrapper]]
    </ul>
</li>
`:else=`
<li class="link item [[+classnames]]">
    <div class="title">
        <a href="[[+link]]" [[+attributes]]>
            [[+menutitle]]
        </a>
    </div>
</li>
`]]