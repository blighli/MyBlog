var gulp = require('gulp'),
    livereload = require('gulp-livereload');

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch('*', function(){
  	gulp.src('*.html').pipe(livereload());
  });
});