module.exports = function (grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        concat: {
          dist: {
              src: ['app/static/js/*.js'],
              dest: 'app/static/all.js'
          }
        },
        uglify: {
            build: {
                src: 'app/static/all.js',
                dest: 'app/static/all.min.js'
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');

    grunt.registerTask('default', ['concat', 'uglify']);

};