<svg class="hidden">
    [[migxLoopCollection?
        &packageName=`romanescobackyard`
        &classname=`rmOption`
        &where=`{"key":"status_progress"}`
        &tpl=`statusIndicatorSVGSymbol`
    ]]
    [[migxLoopCollection?
        &packageName=`romanescobackyard`
        &classname=`rmOption`
        &where=`{"key":"status_health"}`
        &tpl=`statusIndicatorSVGSymbol`
    ]]
</svg>

<div class="ui grid">
    <div class="nine wide column">
        <h1 class="ui header">
            [[*pagetitle]]
            <span class="sub header">[[*longtitle]]</span>
        </h1>
    </div>
    <div class="seven wide right aligned bottom aligned column">
        <div class="ui basic icon buttons">
            <a href="[[~[[++site_start]]]]status/" class="ui button" title="Status grid">
                <i class="list icon"></i>
            </a>
            <a href="[[~[[++site_start]]]]backstop/" class="ui button" title="Visual regression tests">
                <i class="eye icon"></i>
            </a>
        </div>
    </div>
</div>

<div class="ui hidden divider"></div>

[[migxLoopCollection?
    &packageName=`romanescobackyard`
    &classname=`rmOption`
    &where=`{"key":"status_progress"}`
    &wrapperTpl=`kanbanGridStepsWrapper`
    &tpl=`kanbanGridStepsRow`
]]
<div class="ui stackable equal width celled kanban grid">
    [[migxLoopCollection?
        &packageName=`romanescobackyard`
        &classname=`rmOption`
        &where=`{"key":"content_priority"}`
        &tpl=`kanbanGridRow`
    ]]
</div>
