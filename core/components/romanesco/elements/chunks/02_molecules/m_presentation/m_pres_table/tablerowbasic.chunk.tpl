[[+idx:eq=`1`:then=`
    [[+table_head:eq=`1`:then=`
    <thead>
        <tr>[[+row]]</tr>
    </thead>
    <tbody>
    `:else=`
    <tbody>
        <tr>[[+row]]</tr>
    `]]
`:else=`
    <tr>[[+row]]</tr>
`]]