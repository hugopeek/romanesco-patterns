[[++navbar_level:eq=`3`:then=`[[+wrapper:contains=`rel="category"`:then=`three level`:else=`two level`]]`:else=`two level`:toPlaceholder=`depth`]]

[[+wrapper:isnot=``:then=`
<li class="ui simple [[+depth]] dropdown item [[+alias]]">
    <a class="title [[+classnames]]" href="[[+link]]" [[+attributes]]>
        [[+menutitle]]
        <i class="dropdown icon"></i>
    </a>
    <ul class="menu content row">
        [[+wrapper]]
    </ul>
</li>
`:else=`
<li class="item">
    <a class="title [[+classnames]]" href="[[+link]]">
        [[+menutitle]]
    </a>
</li>
`]]
