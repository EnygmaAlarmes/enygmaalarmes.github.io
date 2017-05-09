---
name: clientes
menu-title: Clientes
---

<div class="wrapper">
    <h2>Nossos parceiros e clientes</h2>
    <div class="clientes-galeria slider no-js">
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
(function(){
    var sliderControls = document.createElement('div');
    sliderControls.className = 'slider-controls';
    var slider = Slider({
        parentSelector: '.slider',
        childSelector: '.slide',
        duration: 4000,
        callback: function(slide, i) {
            var controls = sliderControls.querySelectorAll('.slider-bullet');
            Array.prototype.slice.call( controls ).forEach(function(bullet, b){
                if ( b === i ) {
                    bullet.classList.add( 'active' );
                }
                else {
                    bullet.classList.remove( 'active' );
                }
            });
        }
    });
    slider.parent.classList.remove('no-js');
    slider.parent.parentNode.appendChild(sliderControls);
    slider
        .play()
        .on('mouseover', function(e) { slider.pause(); })
        .on('mouseout', function(e) { slider.play(); });
    Array.prototype.slice.call(slider.children).forEach( function(slide, i){
        var bullet = document.createElement('div');
        bullet.className = 'slider-bullet';
        if (i === 0) bullet.classList.add('active');
        bullet.addEventListener('click', function() {
            slider.index = i;
            slider.compose();
        });
        sliderControls.appendChild(bullet);
    } );
    sliderControls.addEventListener('mouseover', function(){ slider.pause() });
    sliderControls.addEventListener('mouseout', function(){ slider.play() });
})()
</script>