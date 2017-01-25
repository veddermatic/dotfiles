/* REACT */
var react = require('gulp-react');
gulp.task('jsx', function () {
    return gulp.src('./src/jsx/*.jsx')
        .pipe(react())
        .pipe(gulp.dest('./dist/js'))
        .pipe(uglify())
        .pipe(rename({suffix: '.min'}))
        .pipe(gulp.dest('./dist/js'));
});
