<?php if (!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<div id="home">
    <div class="col-md-12">
        <p class="text text-center lead"><strong> Bienvenido <?= $this->session->userdata("usuario") ?></strong> </p>
    </div>

    <div class="col-md-12 col-sm-12 col-xs-12">
	    <!--Carrusel de Imagenes-->
	    <div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		        <li data-target="#myCarousel" data-slide-to="3"></li>
		    </ol>

		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" role="listbox">
		        <div class="item active">
		            <img src="<?php echo base_url('extra/img/sefiz2.jpg')?>" alt="sefiz1">
		        </div>

		        <div class="item">
		            <img src="<?php echo base_url('extra/img/sefiz1.jpg')?>" alt="sefiz2">
		        </div>

		        <div class="item">
		            <img src="<?php echo base_url('extra/img/sefiz3.jpg')?>" alt="sefiz3">
		        </div>

		        <div class="item">
		            <img src="<?php echo base_url('extra/img/sefiz4.jpg')?>" alt="sefiz4">
		        </div>
		    </div>

		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		    </a>
		</div>
   </div>
</div>

