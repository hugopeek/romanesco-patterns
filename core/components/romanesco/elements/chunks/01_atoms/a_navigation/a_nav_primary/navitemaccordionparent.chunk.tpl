[[+wrapper:isnot=``:then=`
<div class="item [[+active]]">
    <div class="title [[+classnames]]">
        <a href="[[+link]]" title="[[+pagetitle]]" [[+attributes]]>
            [[+menutitle]]
        </a>
        <button class="ui tiny icon button"><i class="dropdown icon"></i></button>
    </div>
    <div class="content [[+active]]">
        [[+wrapper]]
    </div>
</div>
`:else=`
[[$navItemAccordion]]
`]]