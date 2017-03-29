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



scrollToTarget = (target) ->
	scrollTarget = $(target)[0].offsetTop
	scrollToY scrollTarget - 20, 500, 'easeInOutQuint', () -> false

window.scrollToTarget = scrollToTarget



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
	link.addEventListener( 'click', navigate ) unless link.href is '#'



scrollSpy = () ->
	links = _( $('.site-nav a') )
	selectedHash = '#home'

	links.forEach (link) ->
		if thisSection = $(link.hash)[0]
			bounds = thisSection.getBoundingClientRect()
			if bounds.top <= window.innerHeight * .3 and bounds.bottom > 0
				selectedHash = link.hash

	links.forEach (link) ->
		if link.hash is selectedHash
			link.classList.add 'active'
		else
			link.classList.remove 'active'

onScroll = (e) -> scrollSpy()

scrollSpy()
window.addEventListener 'scroll', onScroll
