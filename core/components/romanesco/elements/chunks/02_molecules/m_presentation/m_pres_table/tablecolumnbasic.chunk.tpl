[[+cell:toPlaceholder=`head_[[+colIdx]]_[[+idx]]`]]
[[+idx:eq=`1`:then=`
    [[+table_head:eq=`1`:then=`
    <th>[[+cell]]</th>
    `:else=`
    <td>[[+cell]]</td>
    `]]
`:else=`
    [[$tableColumnBasicTD? &uid=`[[+unique_idx]]_[[+idx]]_[[+colIdx]]`]]
`]]