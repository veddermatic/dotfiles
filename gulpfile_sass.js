
/* SASS */
var compass = require('gulp-ruby-sass');
var autoprefix = require('gulp-autoprefixer');
gulp.task('sass', function () {
    return gulp.src('./src/sass/*.scss')
    .pipe(sass({style:'compressed'}))
    .pipe(autoprefix(['last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1'], {cascade: false}))
    .pipe(gulp.dest('./dist/css'));
});
