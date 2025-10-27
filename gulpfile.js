const gulp = require('gulp');

// Import ES modules dynamically
async function compileStyles() {
  const sass = require('sass');
  const gulpSass = (await import('gulp-sass')).default;
  const autoprefixer = (await import('gulp-autoprefixer')).default;
  const cssnano = (await import('gulp-cssnano')).default;
  const rename = (await import('gulp-rename')).default;
  const sourcemaps = (await import('gulp-sourcemaps')).default;
  const plumber = (await import('gulp-plumber')).default;

  const sassCompile = gulpSass(sass);

  return gulp.src('sass/*.scss')
    .pipe(plumber())
    .pipe(sourcemaps.init())
    .pipe(sassCompile({
      outputStyle: 'expanded',
      precision: 10,
      includePaths: ['.']
    }).on('error', sassCompile.logError))
    .pipe(autoprefixer({
      browsers: ['> 1%', 'last 2 versions', 'Firefox ESR']
    }))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('css'))
    .pipe(cssnano())
    .pipe(rename({
      suffix: '.min'
    }))
    .pipe(gulp.dest('css'));
}

// Define the gulp task
gulp.task('styles', compileStyles);
gulp.task('default', gulp.series('styles'));
