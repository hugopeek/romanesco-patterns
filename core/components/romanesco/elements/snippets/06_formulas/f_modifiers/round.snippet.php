<?php
if ($input == '') return '';
if (!$options) $options = 0;
return round($input,$options);