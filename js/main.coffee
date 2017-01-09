---
---

$ = (selector) ->
	document.querySelectorAll(selector)
_ = (nodeList, fn) ->
	if fn
		Array.prototype.map.call(nodeList, fn)
	else
		Array.prototype.slice.call(nodeList)
Element.prototype.prependChild = (child) ->
	this.insertBefore child, this.firstChild

SlideShow = (config) ->
	return new SlideShow(config) if !( this instanceof SlideShow )
	this.config = config
	this.container = $( this.config.containerSelector )[0]
	return false if not this.container
	this.slides = _ this.container.querySelectorAll this.config.slideSelector
	this.index = 0

SlideShow.prototype =
	select: (index) ->
		return if not this.slides[index]
		this.index = index
		prevIndex = if index is 0 then this.slides.length - 1 else index - 1
		nextIndex = if index is this.slides.length - 1 then 0 else index + 1
		this.prev = this.slides[prevIndex]
		this.next = this.slides[nextIndex]
		this.current = this.slides[this.index]
		this.update()
	update: () ->
		this.slides.forEach (slide) ->
				if slide is this.prev
					slide.classList.add 'prev'
				else
					slide.classList.remove 'prev'
				if slide is this.next
					slide.classList.add 'next'
				else
					slide.classList.remove 'next'
				if slide is this.current
					slide.classList.add 'current'
				else
					slide.classList.remove 'current'
			, this
	goPrev: () ->
		if this.index is 0
			this.select this.slides.length - 1
		else
			this.select this.index - 1
	goNext: () ->
		if this.index is this.slides.length - 1
			this.select 0
		else
			this.select this.index + 1
	play: () ->
		this.select this.index
		this.playingStateID = setInterval this.goNext.bind(this), this.config.interval
	pause: () -> clearInterval this.playingStateID if this.playingStateID

window.SlideShow = SlideShow

scrollToTarget = (target) ->
	scrollTarget = $(target)[0].offsetTop
	scrollToY scrollTarget - 20, 500, 'easeInOutQuint', () -> false

window.scrollToTarget = scrollToTarget

slider = SlideShow
	containerSelector: '.slideshow',
	slideSelector: '.slide',
	interval: 4000

if slider.container
	slider.play()

	slider.container.addEventListener 'mouseover', () ->
		slider.pause()
	slider.container.addEventListener 'mouseout', () ->
		slider.play()

	window.slider = slider



navbar = $('.site-header')[0]
navigate = (e) ->
	if e.target.href
		e.preventDefault()
		fixbarOffset = navbar.getBoundingClientRect().height
		target = e.target.attributes.href.nodeValue.toString()
		return if not target
		sectionTarget = $(target)[0] or $('a[name=' + target.substr(1) + ']')[0]
		if sectionTarget
			scrollTarget = sectionTarget.offsetTop - fixbarOffset
			scrollToY scrollTarget, 500, 'easeInOutQuint', () -> 
				false

_( $('a[href^="#"]') ).forEach (link) ->
	link.addEventListener 'click', navigate




scrollSpy = () ->
	links = _( $('.site-nav .trigger .page-link') )
	selectedHash = '#home'

	links.forEach (link) ->
		thisSection = $(link.hash)[0]
		bounds = thisSection.getBoundingClientRect()
		if bounds.top <= window.innerHeight * .3 and bounds.bottom > 0
			selectedHash = link.hash

	links.forEach (link) ->
		if link.hash is selectedHash
			link.classList.add 'active'
		else
			link.classList.remove 'active'

onScroll = (e) -> scrollSpy()


window.addEventListener 'scroll', onScroll
