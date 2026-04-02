<section class="[[+column_type]] person">
    [[$[[+row_tpl]]? &unique_idx=`[[+unique_idx]]_[[+page:empty=`0`]]_[[+idx]]`]]
</section>
[[structuredDataOverview?
    &type=`Person`
    &name=`[[+pagetitle]]`
    &description=`[[+description:empty=`[[+introtext:stripForJS]]`]]`
    &jobTitle=`[[+person_jobtitle]]`
    &id=`[[+id]]`
    &idx=`[[+idx]]`
    &uid=`[[+unique_idx]]`
]]