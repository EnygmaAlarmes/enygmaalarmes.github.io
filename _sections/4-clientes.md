---
name: clientes
---

<div class="wrapper">
    <h2>Nossos parceiros e clientes</h2>
    <div class="slider">
        {% for cliente in site.data.clientes %}
            <article data-grid="center" class="slide cliente-item">
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
