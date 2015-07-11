var gulp = require('gulp'),
    livereload = require('gulp-livereload');

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch('app/**/*', function(file){
  	gulp.src(file.path).pipe(livereload());
  });
});