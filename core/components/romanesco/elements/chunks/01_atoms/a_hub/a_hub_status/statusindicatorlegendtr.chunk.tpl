[[Switch?
    &get=`[[+alias]]`
    &c1=`todo`          &do1=`orange`
    &c2=`doing`         &do2=`yellow`
    &c3=`review`        &do3=`purple`
    &c4=`stable`        &do4=`olive`
    &c5=`successful`    &do5=`green`
    &c6=`problematic`   &do6=`red`
    &c7=`expired`       &do7=`brown`
    &default=`olive`
    &toPlaceholder=`indicator_class_[[+idx]]`
]]
<tr class="[[+indicator_class_[[+idx]]]]">
    <td>
        <svg class="ui tiny icon image" viewBox="0 0 100 100">
            <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-[[+alias]]"></use>
        </svg>
    </td>
    <td><strong>[[+name]]</strong></td>
    <td>[[+description]]</td>
</tr>