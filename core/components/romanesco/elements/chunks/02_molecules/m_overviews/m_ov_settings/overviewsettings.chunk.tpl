&row_tpl=`[[If? &subject=`[[$[[+row_tpl]]Theme]]` &operator=`isnull` &then=`[[+row_tpl]]` &else=`[[+row_tpl]]Theme`]]`
&box_type=`[[+[[+prefix]].box_type]]`
&row_type=`[[+[[+prefix]].row_type]]`
&column_type=`[[+[[+prefix]].column_type]]`
&grid_settings=`[[+[[+prefix]].grid_settings]]`
&cols=`[[+cols:textToNumber]]`
&padding=`[[+padding]]`
&alignment=`[[+alignment]]`
&responsive=`[[+responsive]]`
&prefix=`[[+prefix]]`
&unique_idx=`[[+layout_title:stripAsAlias:append=`_`]][[+layout_id]]_[[+unique_idx]]`
&title_field=`[[+title_field]]`
&title_hierarchy=`[[+title_hierarchy]]`
&classes=`[[+title_hierarchy:is=`span`:then=`tiny`]]`
&show_subtitle=`[[+show_subtitle]]`
&show_introtext=`[[+show_introtext]]`
&link_text=`[[If? &subject=`[[+link_text]]` &operator=`isnull` &then=`0` &else=`[[+link_text]]`]]`
&de_emphasize=`[[+de_emphasize]]`
&img_type=`[[+img_type]]`
&icon_type=`[[+icon_type]]`
&lazy_load=`[[+lazy_load]]`