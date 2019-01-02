[[+wrapper:contains=`menu content`:then=`
<li class="ui simple dropdown item [[+alias]]">
    <a class="title" [[+attributes]]>
        [[+menutitle]]
        <i class="dropdown icon"></i>
    </a>
    <ul class="row menu content">
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