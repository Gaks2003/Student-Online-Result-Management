const gulp = require('gulp');
const gulpLoadPlugins = require('gulp-load-plugins');
const browserSync = require('browser-sync');
const sass = require('sass');

const $ = gulpLoadPlugins();
const reload = browserSync.reload;

// To compile Sass files
gulp.task('styles', () => {
  return gulp.src('sass/*.scss')
    .pipe($.plumber())
    .pipe($.sourcemaps.init())
    .pipe($.sass({
      implementation: sass,
      outputStyle: 'expanded',
      precision: 10,
      includePaths: ['.']
    }).on('error', $.sass.logError))
    .pipe($.autoprefixer({overrideBrowserslist: ['> 1%', 'last 2 versions', 'Firefox ESR']}))
    .pipe($.sourcemaps.write())
    .pipe(gulp.dest('css'))
    .pipe($.cssnano())
    .pipe($.rename({                                // rename file
        suffix: ".min"                            // add *.min suffix
    }))
    .pipe(gulp.dest('css'))
    .on('end', reload);
});

// To minify scripts
gulp.task('scripts', () => {
  return gulp.src(['js/*.js', '!js/*.min.js'])
    .pipe($.plumber())
    .pipe($.uglify({preserveComments: 'license'}))
    .pipe($.rename({
        suffix: ".min"
    }))
    .pipe(gulp.dest('js'))
    .on('end', reload);
});

function lint(files, options) {
  return () => {
    return gulp.src(files)
      .pipe(reload({stream: true, once: true}))
      .pipe($.eslint(options))
      .pipe($.eslint.format())
      .pipe($.if(!browserSync.active, $.eslint.failAfterError()));
  };
}

gulp.task('lint', lint('js/*.js'));

// Uncomment following if you want to minify HTML files
/*
gulp.task('html', gulp.series('styles', 'scripts', () => {
  return gulp.src('*.html')
    .pipe($.htmlmin({collapseWhitespace: true}))
    .pipe(gulp.dest('minified-html'));
}));
*/

// Task to minify images
gulp.task('images', () => {
  return gulp.src('images/**/*')
    .pipe($.cache($.imagemin({
      progressive: true,
      interlaced: true,
      // don't remove IDs from SVGs, they are often used
      // as hooks for embedding and styling
      svgoPlugins: [{cleanupIDs: false}]
    })))
    .pipe(gulp.dest('images-min'));
});

// Task to serve everything with browserSync (except images)
gulp.task('serve', gulp.series('styles', 'scripts', () => {
  browserSync({
    notify: false,
    port: 9000,
    server: {
      baseDir: ['./']
    }
  });

  gulp.watch([
    '*.html',
    'images/**/*',
    'fonts/**/*'
  ]).on('change', reload);

  gulp.watch('sass/**/*.scss', gulp.series('styles'));
  gulp.watch('js/**/*.js', gulp.series('scripts'));
}));

gulp.task('default', gulp.series('serve'));
