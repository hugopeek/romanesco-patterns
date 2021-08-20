[[If?
    &subject=`[[+cta_link]]`
    &operator=`notempty`
    &then=`
    <a class="item" href="[[~[[If? &subject=`[[+cta_link]]` &operator=`notempty` &then=`[[+cta_link]]` &else=`[[++error_page]]`]]">
        <div class="content">
            [[+main]]
        </div>
    </a>
    `
    &else=`[[+main]]`
]]