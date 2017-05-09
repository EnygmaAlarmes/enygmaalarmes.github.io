---
---


class Insta

    constructor: (el) ->
        return new Insta(el) unless this instanceof Insta
        @container = el
        @url = el.getAttribute 'instagram-url'
        @length = el.getAttribute 'instagram-length'
        @template = el.querySelector('[instagram-item]').cloneNode(true)
        el.innerHTML = ''

    load: (fn) ->
        c = @container
        t = @template
        l = @length
        HTTP.get @url, (data) ->
            items = JSON.parse(data).data
            items.forEach (obj, index) ->
                return if l? and index >= l
                c.appendChild fn t.cloneNode(true), obj

_ $ '[instagram-url]'
    .forEach (insta) ->
        Insta(insta).load (el, data) ->
            img = el.querySelector 'img'
            res = img.getAttribute 'instagram-src'
            imgData = data.images[res]
            img.src = imgData.url
            el