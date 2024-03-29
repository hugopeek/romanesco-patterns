[[Switch?
    &get=`[[+layout_id]]_[[+layout_column]]`

    &c1=`1_main`        &do1=`100`
    &c2=`2_main`        &do2=`66`
    &c3=`2_sidebar`     &do3=`33`
    &c4=`3_sidebar`     &do4=`33`
    &c5=`3_main`        &do5=`66`
    &c6=`4_col_1`       &do6=`25`
    &c7=`4_col_2`       &do7=`25`
    &c8=`4_col_3`       &do8=`25`
    &c9=`4_col_4`       &do9=`25`
    &c10=`5_col_1`      &do10=`33`
    &c11=`5_col_2`      &do11=`33`
    &c12=`5_col_3`      &do12=`33`
    &c13=`6_col_1`      &do13=`50`
    &c14=`6_col_2`      &do14=`50`

    &c15=`7_main`       &do15=`100`
    &c16=`8_main`       &do16=`66`
    &c17=`8_sidebar`    &do17=`33`
    &c18=`9_sidebar`    &do18=`33`
    &c19=`9_main`       &do19=`66`
    &c20=`10_col_1`     &do20=`25`
    &c21=`10_col_2`     &do21=`25`
    &c22=`10_col_3`     &do22=`25`
    &c23=`10_col_4`     &do23=`25`
    &c24=`11_col_1`     &do24=`33`
    &c25=`11_col_2`     &do25=`33`
    &c26=`11_col_3`     &do26=`33`
    &c27=`12_col_1`     &do27=`50`
    &c28=`12_col_2`     &do28=`50`

    &c29=`24_main`      &do29=`100`

    [[[[modifiedIf?
        &subject=`imgResponsiveScaleTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$imgResponsiveScaleTheme? &uid=`[[+unique_idx]]``
    ]]]]

    &default=`51`
]]