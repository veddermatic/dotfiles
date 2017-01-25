
/* COMPASS */
var sass = require('gulp-compass');
gulp.task('sass', function() {
    return gulp.src('./src/sass/*.scss')
        .pipe(sass({
        config_file: './config.rb',
        css: './dist/css',
        sass: './src/sass'
    }));
});
