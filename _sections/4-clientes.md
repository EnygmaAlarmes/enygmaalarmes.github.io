---
name: clientes
---

<div class="wrapper">
    <h2>Nossos parceiros e clientes</h2>
    <div class="slider no-js">
        {% for cliente in site.data.clientes %}
            <article data-grid="center spacing" class="slide cliente-item">
                <div data-cell="1of4" class="cliente-img">
                    <img src="{{ site.baseurl }}/img/clientes/{{ cliente.img }}" alt="{{ cliente.title }}" width="200">
                </div>
                <div data-cell="3of4" class="cliente-metadata">
                    <h3>{{ cliente.title }}</h3>
                    <p>{{ cliente.excerpt }}</p>
                </div>
            </article>
        {% endfor %}
    </div>
</div>

<script src="{{ site.baseurl }}/js/slider.js"></script>
<script>
slider = Slider({
    parentSelector: '.slider',
    childSelector: '.slide',
    duration: 4000
});
slider.parent.classList.remove('no-js');
slider
    .play()
    .on('mouseover', function(e) { slider.pause(); })
    .on('mouseout', function(e) { slider.play(); });
</script>