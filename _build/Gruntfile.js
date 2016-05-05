module.exports = function(grunt) {

    grunt.initConfig({
        "merge-json": {
            "default": {
                src: ['src/*.json','src/*/*.json','src/*/*/*.json'],
                dest: 'config.json'
            }
        },
        replace: {
            dist: {
                options: {
                    patterns: [
                        {
                            match: 'templates_all',
                            replacement: '<%= grunt.file.read("src_snippets/template-list-all") %>'
                        },{
                            match: 'templates_basic',
                            replacement: '<%= grunt.file.read("src_snippets/template-list-basic") %>'
                        },{
                            match: 'templates_publication',
                            replacement: '<%= grunt.file.read("src_snippets/template-list-publication") %>'
                        }
                    ]
                },
                files: [
                    {expand: true, flatten: true, src: ['config.json'], dest: ''}
                ]
            }
        },
        jsonlint: {
            all: {
                src: ['config.json'],
                options: {
                    format: true,
                    indent: 2
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-merge-json');
    grunt.loadNpmTasks('grunt-replace');
    grunt.loadNpmTasks('grunt-jsonlint');
    grunt.registerTask('default', ['merge-json', 'replace', 'jsonlint']);
};
