[[If?
    &subject=`[[+content]]`
    &operator=`notempty`
    &then=`[[+content:htmlent:replace=`[==&#91;`:replace=`]==&#93;`:replace=``==&#96;`]]`
    &else=`[[+template:htmlent:replace=`[==&#91;`:replace=`]==&#93;`:replace=``==&#96;`]]`
]]