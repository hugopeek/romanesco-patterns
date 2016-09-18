<?php

class SelectInput extends cbBaseInput {
    public $defaultIcon = 'chunk_A';
    public $defaultTpl = '[[+value]]';

    
    /**
     * @return array
     */
    public function getJavaScripts() {
        $assetsUrl = $this->modx->getOption('patternlab.assets_url', null, MODX_ASSETS_URL . 'components/patternlab/');
        return array(
            $assetsUrl . 'js/inputs/cbselect.input.js',
        );
    }

    /**
     * @return array
     */
    public function getTemplates()
    {
        $tpls = array();
        
        // Grab the template from a .tpl file
        $corePath = $this->modx->getOption('patternlab.core_path', null, MODX_CORE_PATH . 'components/patternlab/');

        $template = file_get_contents($corePath . 'elements/inputs/cbclassselectinput.template.tpl');
        
        // Wrap the template, giving the input a reference of "selectinput", and
        // add it to the returned array.
        $tpls[] = $this->contentBlocks->wrapInputTpl('selectinput', $template);
        return $tpls;
    }

    public function getName()
    {
        return 'Class Select';
        // return $this->modx->lexicon('selectinput.input_name');
    }
    
    public function getDescription()
    {
        return 'Selectbox for adding a class name to the output.';
        // return $this->modx->lexicon('selectinput.input_description');
    }

    public function getFieldProperties()
    {
        return array(
            array(
                'key' => 'class_options',
                'fieldLabel' => 'Available class names',
                'xtype' => 'textarea',
                'default' => '',
                'description' => 'Define available values as "Displayed Value=placeholder_value", one per line. Available placeholders: [[+value]], [[+display]]. If you only pass a single value per line (such as "foo"), that will be used as both displayed and placeholder value.'
            ),
            array(
                'key' => 'default_value',
                'fieldLabel' => 'Default value',
                'xtype' => 'textfield',
                'default' => '',
                'description' => 'Default value to use. Leave blank if none.'
            ),
        );
    }
}