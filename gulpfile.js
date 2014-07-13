// GLOBAL TYPE THINGS
var gulp = require('gulp');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');

/* COMPASS */
var compass = require('gulp-compass');
gulp.task('compass', function() {
    return gulp.src('./src/sass/*.scss')
        .pipe(compass({
        config_file: './config.rb',
        css: './dist/css',
        sass: './src/sass'
    }));
});


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

/* REACT */
var react = require('gulp-react');
gulp.task('jsx', function () {
    return gulp.src('./src/jsx/*.jsx')
        .pipe(react())
        .pipe(uglify())
        .pipe(gulp.dest('./dist/js'))
        .pipe(rename({suffix: '.min'}))
        .pipe(gulp.dest('./dist/js'));
});


/* WATCH */
// WATCHER
gulp.task('watch', function () {
    gulp.watch('./src/jsx/*.jsx', ['jsx']);
    gulp.watch('./src/data/*.json', ['lint_data', 'min_data']);
    gulp.watch('./src/js/*.js', ['lint', 'minify_scripts']);
    gulp.watch('./src/sass/*.scss', ['compass']);
});

gulp.task('default', ['jsx', 'lint', 'minify_scripts', 'lint_data', 'min_data', 'compass']);
gulp.task('dev', ['default', 'watch']);
