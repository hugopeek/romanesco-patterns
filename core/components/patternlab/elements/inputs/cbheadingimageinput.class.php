<?php
/**
 * Class HeadingInput
 *
 * @author Mark Hamstra
 * @package contentblocks
 */
class HeadingImageInput extends cbBaseInput {
    public $defaultIcon = 'heading';
    public $defaultTpl = '<[[+level]]>[[+value]]</[[+level]]>';

    /**
     * @return array
     */
    public function getJavaScripts() {
        $assetsUrl = $this->modx->getOption('patternlab.assets_url', null, MODX_ASSETS_URL . 'components/patternlab/');
        return array(
            $assetsUrl . 'js/inputs/cbheadingimage.input.js',
        );
    }

    public function getName()
    {
        return 'Heading Image';
        // return $this->modx->lexicon('selectinput.input_name');
    }

    public function getDescription()
    {
        return 'A heading accompanied by an image.';
        // return $this->modx->lexicon('selectinput.input_description');
    }

    /**
     * @return array
     */
    public function getFieldProperties()
    {
        return array(
            array(
                'key' => 'default_level',
                'fieldLabel' => $this->modx->lexicon('contentblocks.default_level'),
                'xtype' => 'textfield',
                'default' => 'h2',
                'description' => $this->modx->lexicon('contentblocks.heading_default_level.description')
            ),
            array(
                'key' => 'available_levels',
                'fieldLabel' => $this->modx->lexicon('contentblocks.available_levels'),
                'xtype' => 'textfield',
                'default' => 'h1=heading_1,h2=heading_2,h3=heading_3,h4=heading_4,h5=heading_5',
                'description' => $this->modx->lexicon('contentblocks.heading_available_levels.description')
            ),
            array(
                'key' => 'use_tinyrte',
                'fieldLabel' => $this->modx->lexicon('contentblocks.use_tinyrte'),
                'xtype' => 'contentblocks-combo-boolean',
                'default' => '1',
                'description' => $this->modx->lexicon('contentblocks.use_tinyrte.description')
            ),
            array(
                'key' => 'source',
                'fieldLabel' => $this->modx->lexicon('contentblocks.image.source'),
                'xtype' => 'contentblocks-combo-mediasource',
                'default' => 0,
                'description' => $this->modx->lexicon('contentblocks.image.source.description')
            ),
            array(
                'key' => 'directory',
                'fieldLabel' => $this->modx->lexicon('contentblocks.directory'),
                'xtype' => 'textfield',
                'default' => $this->modx->getOption('contentblocks.image.upload_path', null, 'assets/uploads/images/'),
                'description' => $this->modx->lexicon('contentblocks.directory.description')
            ),
            array(
                'key' => 'file_types',
                'fieldLabel' => $this->modx->lexicon('contentblocks.file_types'),
                'xtype' => 'textfield',
                'default' => 'png,gif,jpg,jpeg',
                'description' => $this->modx->lexicon('contentblocks.file_types.description')
            ),
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

        $template = file_get_contents($corePath . 'elements/templates/03-templates/t_manager/cbheadingimageinput.template.tpl');

        // Wrap the template, giving the input a reference of "headingimageinput", and
        // add it to the returned array.
        $tpls[] = $this->contentBlocks->wrapInputTpl('headingimageinput', $template);
        return $tpls;
    }
}
