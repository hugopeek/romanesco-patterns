module.exports = function(grunt) {

    grunt.initConfig({
        "merge-json": {
            "default": {
                src: ['src/*.json','src/*/*.json'],
                dest: 'config.json'
            }
        }
    });

    grunt.loadNpmTasks('grunt-merge-json');
    grunt.registerTask('default', ['merge-json']);
};
