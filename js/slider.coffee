---
---

class Slider
    constructor: (@config) ->
        return new Slider(@config) unless this instanceof Slider
        return unless @parent = document.querySelector @config.parentSelector
        @children = @parent.querySelectorAll @config.childSelector
        @index = 0
        @compose()

Slider.prototype =
    compose: () ->
        prevIndex = if @index > 0 then @index - 1 else @children.length - 1
        nextIndex = if @index < @children.length - 1 then @index + 1 else 0
        Array.prototype.slice.call( @children ).forEach (el) ->
            el.classList.remove 'prev'
            el.classList.remove 'current'
            el.classList.remove 'next'
            true
        @children[prevIndex].classList.add 'prev'
        @children[@index].classList.add 'current'
        @children[nextIndex].classList.add 'next'
        @config.callback(@children[@index], @index, @children) if typeof @config.callback is 'function'
        @
    play: () ->
        that = @
        @playingStateID = setInterval () ->
                that.next()
            , @config.duration
        @
    pause: () ->
        clearInterval @playingStateID
        @
    prev: () ->
        if @index > 0 then @index-- else @index = @children.length - 1
        @compose()
    next: () ->
        if @index < @children.length - 1 then @index++ else @index = 0
        @compose()
    on: (event, fn) ->
        that = @
        @parent.addEventListener event, fn
        @
    off: (event, fn) ->
        that = @
        @parent.removeEventListener event, fn
        @

window.Slider = Slider