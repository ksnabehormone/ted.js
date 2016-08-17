gulp    = require 'gulp'
plumber = require 'gulp-plumber'
jade    = require('gulp-jade')
sass    = require 'gulp-sass'
coffee  = require 'gulp-coffee'

gulp.task 'jade', ->
  gulp.src 'src/jade/**/*.jade'
    .pipe plumber()
    .pipe(jade(pretty: true))
    .pipe gulp.dest('dist/')

gulp.task 'coffee', () ->
  gulp.src 'src/coffee/**/*.coffee'
    .pipe plumber()
    .pipe coffee()
    .pipe gulp.dest('dist/js')

gulp.task 'sass', ->
  gulp.src('src/sass/**/*.sass')
    .pipe(sass())
    .on('error', sass.logError)
    .pipe gulp.dest('dist/css')

gulp.task 'build', ['jade', 'coffee', 'sass']

gulp.task 'watch', ->
  gulp.watch 'src/jade/**/*.jade', [ 'jade' ]
  gulp.watch 'src/coffee/**/*.coffee', [ 'coffee' ]
  gulp.watch 'src/sass/**/*.sass', [ 'sass' ]

gulp.task 'default', ['watch']
