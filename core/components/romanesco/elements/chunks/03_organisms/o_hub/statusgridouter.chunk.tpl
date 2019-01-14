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
        <a class="ui legend icon button" title="Show legend">
            <i class="info icon"></i>
        </a>
        <div class="ui basic icon buttons">
            <a href="[[~[[*id]]]]/kanban" class="ui button" title="Kanban view">
                <i class="trello icon"></i>
            </a>
            <a href="[[~[[*id]]]]/backstop" class="ui button" title="Visual regression tests">
                <i class="eye icon"></i>
            </a>
        </div>
    </div>
</div>

<table class="ui very compact sortable celled status table">
    <thead>
    <tr>
        <th>[[%romanesco.status.table_indicator]]</th>
        <th>[[%romanesco.status.table_id]]</th>
        <th>[[%romanesco.status.table_resource]]</th>
        <th>[[%romanesco.status.table_improvements]]</th>
        <th>[[%romanesco.status.table_issues]]</th>
        [[*id:SeoTabIndexation:isnot=`[[*id]]`:then=`
        <th>[[%romanesco.status.table_indexation]]</th>
        `]]
        <th>[[%romanesco.status.table_owner]]</th>
        <th>[[%romanesco.status.table_date_due]]</th>
    </tr>
    </thead>
    <tbody>
    [[pdoMenu?
        &contexts=`[[+context:default=`web`]]`
        &parents=`0`
        &showHidden=`1`
        &showUnpublished=`1`
        &includeTVs=`status_progress,status_health,status_improvements,status_issues,content_owner,planning_date_completed`
        &processTVs=`1`
        &tplOuter=`@INLINE [[+wrapper]]`
        &tpl=`statusGridRow`
        &where=`{"contentType:=":"text/html"}`
    ]]
    </tbody>
</table>

<div class="ui small legend modal">
    <div class="header">
        [[%romanesco.status.legend]]
    </div>

    <div class="content">
        <div class="ui two column grid">
            <div class="ui column">
                <div class="ui small header">[[%romanesco.status.legend_progress]]</div>
                <table class="ui small very compact basic table">
                    <tbody>
                    [[migxLoopCollection?
                        &packageName=`romanescobackyard`
                        &classname=`rmOption`
                        &where=`{"key":"status_progress"}`
                        &sortConfig=`[{"sortby":"position","sortdir":"ASC"}]`
                        &tpl=`statusIndicatorLegendTR`
                    ]]
                    </tbody>
                </table>
            </div>
            <div class="ui column">
                <div class="ui small header">[[%romanesco.status.legend_health]]</div>
                <table class="ui small very compact basic table">
                    <tbody>
                    [[migxLoopCollection?
                        &packageName=`romanescobackyard`
                        &classname=`rmOption`
                        &where=`{"key":"status_health"}`
                        &sortConfig=`[{"sortby":"position","sortdir":"ASC"}]`
                        &tpl=`statusIndicatorLegendTR`
                    ]]
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
