[[+wrapper:isnot=``:then=`
<div class="item [[+alias]]">
    <div class="ui buttons" tabindex="0">
        <a class="ui button" href="[[+link]]">
            [[+menutitle]]
        </a>
        <div class="ui icon button browse" data-target=".item.[[+alias]]">
            <i class="dropdown icon"></i>
        </div>
    </div>
</div>

<div class="ui flowing popup [[+alias]]">
    <div class="ui five column internally celled grid">
        <div class="row">
            [[+wrapper]]
        </div>
    </div>
</div>
`:else=`
<div class="item">
    <a class="ui button" href="[[+link]]">
        [[+menutitle]]
    </a>
</div>
`]]