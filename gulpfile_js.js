
var rename = require('gulp-rename');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');

/* LINT */
var jshint = require('gulp-jshint');
gulp.task('lint', function () {
    return gulp.src('./src/js/*.js')
            .pipe(jshint())
            .pipe(jshint.reporter('default'));
});

/* MOOSH YOUR JS */
gulp.task('minify_scripts', function () {
    return gulp.src('./src/js/*.js')
        .pipe(concat('app.js'))
        .pipe(gulp.dest('./dist/js'))
        .pipe(rename('app.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest('./dist/js'));
});

