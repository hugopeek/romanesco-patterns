[[+wrapper:isnot=``:then=`
<li class="ui simple [[+wrapper:contains=`rel="category"`:then=`three level`:else=`two level`]] dropdown item active [[+alias]]">
    <a class="title active" href="[[+link]]" [[+attributes]]>
        [[+menutitle]]
        <i class="dropdown icon"></i>
    </a>
    <ul class="menu content row active">
        [[+wrapper]]
    </ul>
</li>
`:else=`
<li class="item [[*id:eq=`[[+id]]`:then=`active`]]"">
    <a class="title" href="[[+link]]">
        [[+menutitle]]
    </a>
</li>
`]]
