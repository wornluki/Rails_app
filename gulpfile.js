var gulp = require('gulp');
var sass = require('gulp-sass');
var jade = require('gulp-jade');
var prefix = require('gulp-autoprefixer');

gulp.task('sass', function () {
    return gulp.src('app/assets/stylesheets/application.scss')
        .pipe(sass({
            includePaths: ['css'],
        }))
        .pipe(prefix(['last 15 versions', '> 1%', 'ie 8', 'ie 7'], { cascade: true }))
        .pipe(gulp.dest('app/assets/stylesheets'));
});

/*
* Travis is trying to Gulp stuff
*/

// gulp.task('jade', function(){
//   return gulp.src('_jadefiles/*.jade')
//   .pipe(jade())
//   .pipe(gulp.dest('_includes'));
// });

gulp.task('watch', function () {
    gulp.watch('app/assets/stylesheets/**', ['sass']);
    // gulp.watch('_jadefiles/*.jade', ['jade']);
});