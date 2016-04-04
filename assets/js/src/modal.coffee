ModalEffects = do ->

  init = ->
    overlay = document.querySelector('.md-overlay')
    [].slice.call(document.querySelectorAll('.md-trigger')).forEach (el, i) ->
      # modal = document.querySelector()
      console.log $('#' + el.getAttribute('data-modal'));
      modal = $('#' + el.getAttribute('data-modal'));

      # close = modal.querySelector('.md-close')

      removeModal = (hasPerspective) ->
        classie.remove modal, 'md-show'
        if hasPerspective
          classie.remove document.documentElement, 'md-perspective'
        return

      removeModalHandler = ->
        removeModal classie.has(el, 'md-setperspective')
        return

      el.addEventListener 'click', (ev) ->
        classie.add modal, 'md-show'
        overlay.removeEventListener 'click', removeModalHandler
        overlay.addEventListener 'click', removeModalHandler
        if classie.has(el, 'md-setperspective')
          setTimeout (->
            classie.add document.documentElement, 'md-perspective'
            return
          ), 25
        return
      # close.addEventListener 'click', (ev) ->
      #   ev.stopPropagation()
      #   removeModalHandler()
      #   return
      # return
    return

  init()
  return
