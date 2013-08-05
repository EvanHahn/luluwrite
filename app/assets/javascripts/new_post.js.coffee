$window = $(window)
$titleEl = $(".post-title-input")
$bodyEl = $(".post-body-input")
$submitEl = $(".post-submit")

$titleEl.focus()

resize = ->
  newHeight = $window.height() - $titleEl.height() - $submitEl.height() - 100
  $bodyEl.height(newHeight)

$window.on "resize", resize
resize()
