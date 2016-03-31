window.signature =
  initialize: ->
    $('.signature svg').each ->
      paths = $('path, circle, rect', this)
      delay = 0
      for path in paths
        length = path.getTotalLength()
        previousStrokeLength = speed || 0

        speed = if length < 100
          20
        else if length > 200
          Math.floor(length)
        else
          Math.floor(length) + 1000

        delay += previousStrokeLength + 100
        $(path).css('transition', 'none')
               .attr('data-length', length)
               .attr('data-speed', speed)
               .attr('data-delay', delay)
               .attr('stroke-dashoffset', length)
               .attr('stroke-dasharray', length + ',' + length)

  animate: ->
    $('.signature svg').each ->
      paths = $('path, circle, rect', this)

      paths.on('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', (e) =>
        $path = $(e.currentTarget);
        $path.css('transition', 'fill 2000ms ease')
             .attr('fill', 'rgba(234,97,83,0.8)')
      )

      for path in paths
        @p = $path = $(path)
        speed = $path.attr('data-speed')
        delay = $path.attr('data-delay')
        finish = speed + delay
        $path.css('transition', 'stroke-dashoffset ' + speed + 'ms ' + delay + 'ms linear')
               .attr('stroke-dashoffset', '0')

  showProfileImage: ->
    setTimeout( ->
      $('.img-container').show();
    , 750)

$(document).ready ->
  window.signature.initialize()

$(window).load ->
  setTimeout( ->
    window.signature.animate()
    window.signature.showProfileImage()
  , 500)
