[[Switch:toPlaceholder=`indicator_class_[[+idx]]`?
    &get=`[[+alias]]`
    &c1=`stable`        &do1=`positive`
    &c2=`successful`    &do2=`positive`
    &c3=`problematic`   &do3=`negative`
    &c4=`expired`       &do4=`warning`
    &default=``
]]
<tr>
    <td class="[[+indicator_class_[[+idx]]]]">
        <svg class="ui mini icon image" viewBox="0 0 100 100">
            <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-[[+alias]]"></use>
        </svg>
    </td>
    <td>[[+name]]</td>
    <td>[[+description]]</td>
</tr>