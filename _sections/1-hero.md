---
name: home
menu-title: Início
---


<div class="wrapper large" data-grid="center spacing">
    <div data-cell="1of3">
        <h1 class="hero-title">Somos especialistas em instalação e manutenção de sistemas de segurança</h1>
        <h2 class="hero-subtitle">Entregue o que há de melhor em sistemas de segurança para sua empresa e seus clientes</h2>
        <p><a href="#" data-btn="">Solicite um orçamento</a></p>
    </div>
    <div data-cell="1of2">
        <ul class="seamless hero-gallery">
            <li><img src="/img/hero/hero-1.jpg" alt="Sistemas de segurança"></li>
            <li><img src="/img/hero/hero-2.jpg" alt="Serviços de segurança"></li>
            <li><img src="/img/hero/hero-3.jpg" alt="Equipamentos de segurança"></li>
        </ul>
    </div>
</div>

<script>
    var maw = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    if (maw > 600) {
        var section = document.querySelector('.section-home');
        var backgroundContainer = document.createElement('div');
        backgroundContainer.innerHTML = '<div class="background-content"></div>';
        backgroundContainer.className = 'background-container';
        var backgroundContent = backgroundContainer.querySelector('.background-content');
        var backgroundVideo = document.createElement('video');
        backgroundVideo.src = '{{ site.baseurl }}/midia/background-hero.mp4';
        backgroundVideo.autoplay = true;
        backgroundVideo.loop = true;
        backgroundVideo.controls = false;
        backgroundContent.appendChild(backgroundVideo);
        console.log(backgroundContainer);
    }
</script>