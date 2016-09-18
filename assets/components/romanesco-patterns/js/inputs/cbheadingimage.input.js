(function ($, ContentBlocks) {
    ContentBlocks.fieldTypes.headingimageinput = function(dom, data) {

        // Code below is copied from default contentblocks image.js and text.js files
        var input = {
            fileBrowser: false,
            source: data.properties.source > 0 ? data.properties.source : ContentBlocksConfig['image.source'],
            directory: data.properties.directory
        };

        input.init = function() {
            // HEADING
            // Generate the heading dropdown based on field configuration
            var avl = data.properties.available_levels || "h1=heading_1,h2=heading_2,h3=heading_3,h4=heading_4,h5=heading_5,h6=heading_6",
                select = dom.find('.contentblocks-field-heading-level select');

            avl = avl.split(',');
            $.each(avl, function(i, lvl) {
                lvl = lvl.split('=');
                var val = _('contentblocks.' + lvl[1]) || lvl[1];
                select.append('<option value="' + lvl[0] + '">' + val + '</option>');
            });


            if (data.level) {
                select.val(data.level);
            }
            else {
                var def = data.properties.default_level || 'h2';
                select.val(def);
            }

            if (ContentBlocks.toBoolean(data.properties.use_tinyrte)) {
                var title = dom.find('#' + data.generated_id + '_input');
                ContentBlocks.addTinyRte(title);
            }

            // IMAGE
            if (data.url && data.url.length) {
                dom.find('.url').val(data.url);
                dom.find('.size').val(data.size);
                dom.find('.extension').val(data.extension);
                dom.find('img').attr('src', data.url);
                dom.addClass('preview');
            }

            dom.find('.contentblocks-field-delete-image').on('click', function() {
                dom.removeClass('preview');
                dom.find('.url').val('');
                dom.find('.size').val('');
                dom.find('.extension').val('');
                dom.find('img').attr('src', '');

                ContentBlocks.fixColumnHeights();
                ContentBlocks.fireChange();
            });
            dom.find('.contentblocks-field-upload').on('click', function() {
                dom.find('.contentblocks-field-upload-field').click();
            });

            dom.find('.contentblocks-field-image-choose').on('click', $.proxy(function() {
                this.chooseImage();
            }, this));

            this.initUpload();
        };

        input.initUpload = function() {
            var id = dom.attr('id');
            dom.find('#' + id + '-upload').fileupload({
                url: ContentBlocksConfig.connectorUrl + '?action=content/image/upload',
                dataType: 'json',
                dropZone: dom,
                progressInterval: 250,
                paramName: 'file',
                pasteZone: null,

                /**
                 * Add an item to the upload queue.
                 *
                 * The item gets an image preview using the FileReader APIs if available
                 *
                 * @param e
                 * @param data
                 */
                add: function(e, data) {
                    ContentBlocks.fireChange();
                    dom.addClass('uploading');
                    data.files[0].ext = data.files[0].name.split('.').pop();
                    if (data.files[0].size < 700000 && window.FileReader) {
                        // Only if the image is smaller than ~ 700kb we want to show a preview.
                        // This is to prevent filling up the users' RAM, while providing the user
                        // with a fancy preview of what they're uploading.
                        var reader = new FileReader();
                        reader.onload = function(e) {
                            dom.find('img').attr('src', e.target.result);
                            ContentBlocks.fixColumnHeights();
                        };
                        reader.readAsDataURL(data.files[0]);
                    }

                    setTimeout(function() {
                        data.submit();
                    }, 1000);
                },

                /**
                 * When the image has been uploaded add it to the collection.
                 *
                 */
                done: function(e, data) {
                    if (data.result.success) {
                        var record = data.result.object;

                        dom.find('.url').val(record.url);
                        dom.find('.size').val(record.size);
                        dom.find('.extension').val(record.extension);
                        dom.find('img').attr('src', record.url);
                        dom.addClass('preview');
                        input.loadTinyRTE();
                    }
                    else {
                        var message = _('contentblocks.upload_error', {file: data.files[0].filename, message:  data.result.message});
                        if (data.files[0].size > 1048576*1.5) {
                            message += _('contentblocks.upload_error.file_too_big');
                        }
                        ContentBlocks.alert(message);
                        dom.find('img').attr('src','');
                    }
                    dom.removeClass('uploading');

                    setTimeout(function() {
                        ContentBlocks.fixColumnHeights(dom.parents('.contentblocks-region-content'));
                    }, 150);
                },

                fail: function(e, data) {
                    var message = _('contentblocks.upload_error', {file: data.files[0].filename, message:  data.result.message});
                    if (data.files[0].size > 1048576*1.5) {
                        message += _('contentblocks.upload_error.file_too_big');
                    }
                    ContentBlocks.alert(message);

                    dom.removeClass('uploading');
                    dom.find('img').attr('src','');

                    ContentBlocks.fixColumnHeights(dom.parents('.contentblocks-region-content'));
                },

                /**
                 * Fetch the items we want to send along in the POST. In this case,
                 * this is overridden because normally it sends the entire form = the resource.
                 * All we really want is the resource ID, which we fetch from the URL.
                 * @returns {Array}
                 */
                formData: function() {
                    return [{
                        name: 'HTTP_MODAUTH',
                        value: MODx.siteId
                    },{
                        name: 'resource',
                        value: MODx.request.id || 0
                    },{
                        name: 'field',
                        value: data.id
                    }];
                },

                /**
                 * Update progress for queue items
                 */
                progress: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10) + '%';
                    dom.find('.upload-progress .bar').width(progress);
                }
            });
        };

        input.chooseImage = function() {
            var fileBrowser = MODx.load({
                xtype: 'modx-browser',
                id: Ext.id(),
                multiple: true,
                listeners: {
                    select: function(imageData) {
                        input.chooseImageCallback(imageData);
                    }
                },
                allowedFileTypes: data.properties.file_types,
                hideFiles: true,
                title: _('contentblocks.choose_image'),
                source: input.source
            });
            fileBrowser.setSource(input.source);

            fileBrowser.show();
        };

        input.chooseImageCallback = function(imageData) {
            var url = imageData.fullRelativeUrl;
            if (url.substr(0, 4) != 'http' && url.substr(0,1) != '/' ) {
                url = MODx.config.base_url + url;
            }
            dom.find('.url').val(url);
            dom.find('.size').val(imageData.size);
            dom.find('.extension').val(imageData.ext);
            dom.find('img').attr('src', url).on('load', function() {
                setTimeout(function() {
                    ContentBlocks.fixColumnHeights();
                }, 50);
            });
            dom.addClass('preview');
            ContentBlocks.fireChange();
            this.loadTinyRTE();
        };

        input.getData = function () {
            return {
                value: dom.find('.contentblocks-field-heading-input input').val(),
                level: dom.find('.contentblocks-field-heading-level select').val(),
                url: dom.find('.url').val(),
                size: dom.find('.size').val(),
                extension: dom.find('.extension').val()
            };
        };

        input.confirmBeforeDelete = function() {
            var inputData = input.getData(),
                hasLevel = inputData.level != data.properties.default_level,
                hasText = inputData.value.replace(/^\s\s*/, '').replace(/\s\s*$/, '').length > 0;

            return hasLevel || hasText;
        };

        input.loadTinyRTE = function() { };

        return input;
    };

})(vcJquery, ContentBlocks);