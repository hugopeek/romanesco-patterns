<div class="row">
    <div class="sixteen wide priority column">
        <h4 class="ui disabled header">
            [[+name]]
        </h4>
    </div>
</div>
<div class="row">
    [[migxLoopCollection?
        &packageName=`romanescobackyard`
        &classname=`rmOption`
        &where=`{"key":"status_progress"}`
        &tpl=`kanbanGridColumn`
        &addfields=`priority:[[+alias]]`
    ]]
</div>