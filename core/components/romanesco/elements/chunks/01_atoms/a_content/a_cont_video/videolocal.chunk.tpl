<video class="ui [[+lazy_load:eq=`1`:then=`lazy`]] [[+options:replace=`,== `]] video image"
       [[+width:notempty=`width="[[+width]]"`]]
       [[+height:notempty=`height="[[+height]]"`]]
       [[+thumb:notempty=`poster="[[pthumb:imgOptimizeThumb? &input=`[[+thumb]]` &options=`w=[[+width:empty=`[[++max_thumb_width]]`]]&q=[[++romanesco.img_quality]]&zc=1`]]"`]]
       controls>
    [[+files]]
</video>