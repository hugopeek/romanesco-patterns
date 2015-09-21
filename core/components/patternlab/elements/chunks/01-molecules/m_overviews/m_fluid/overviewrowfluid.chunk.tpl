[[!If:toPlaceholder=`background`?
   &subject=`[[+idx:mod]]`
   &operator=`EQ`
   &operand=`0`
   &then=`[[+background_even]]`
   &else=`[[+background_odd]]`
]]

[[!If:toPlaceholder=`interchange`?
   &subject=`[[+cols_interchange]]`
   &operator=`EQ`
   &operand=`1`
   &then=`[[+idx:mod:eq=`0`:then=`computer reversed tablet reversed`]]`
]]

<div class="ui vertical stripe segment [[+background]]">
    <div class="ui container">
        <div class="ui stackable equal width grid [[+interchange]]">
            <div class="column">
                <a href="[[~[[+id]]]]">
                    [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback]]`]]
                </a>
            </div>
            <div class="[[+cols]] wide floated column">
                <h2 class="ui heading">
                    <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
                </h2>
                <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
                <p><a href="[[~[[+id]]]]" class="ui primary button">[[+link_text]]</a></p>
            </div>
        </div>
    </div>
</div>