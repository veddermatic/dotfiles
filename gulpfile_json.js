/* LINT AND SMOOSH DATA FILES */
var jsonminify = require('gulp-jsonminify');
var jsonlint = require("gulp-jsonlint");
gulp.task('lint_data', function () {
    return gulp.src('./src/data/*.json')
        .pipe(jsonlint())
        .pipe(jsonlint.reporter());
});
gulp.task('min_data', function () {
    return gulp.src('./src/data/*.json')
        .pipe(jsonminify())
        .pipe(rename({suffix: '.min'}))
        .pipe(gulp.dest('./dist/data'));
});
