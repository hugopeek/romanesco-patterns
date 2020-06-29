[[+wrapper:isnot=``:then=`
<li class="item [[+active]]">
    <div class="title [[+classnames]]">
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
[[$navItemAccordion]]
`]]