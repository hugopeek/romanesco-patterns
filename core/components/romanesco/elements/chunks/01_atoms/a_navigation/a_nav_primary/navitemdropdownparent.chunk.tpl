[[+wrapper:isnot=``:then=`
<li class="ui simple [[+wrapper:contains=`rel="category"`:then=`three level`:else=`two level`]] dropdown item [[+alias]]">
    <a class="title" href="[[+link]]" [[+attributes]]>
        [[+menutitle]]
        <i class="dropdown icon"></i>
    </a>
    <ul class="menu content row">
        [[+wrapper]]
    </ul>
</li>
`:else=`
<li class="item">
    <a class="title" href="[[+link]]">
        [[+menutitle]]
    </a>
</li>
`]]
