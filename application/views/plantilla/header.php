<!DOCTYPE html>
<html>
    <head>

        <title><?php echo $titulo; ?></title>

        <!-- META -->
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="shortcut icon" href="<?php echo base_url();?>extra/img/favicon.ico" type="image/vnd.microsoft.icon">
        <!-- CSS -->
        <link href="<?php echo base_url(); ?>extra/css/bootstrap.min.css" rel="stylesheet" />
        <link href="<?php echo base_url(); ?>extra/css/simple-line-icons.css" rel="stylesheet"/>
        <link href="<?php echo base_url(); ?>extra/css/style.css" rel="stylesheet" />
        <link href="<?php echo base_url();?>extra/js/plugins/jquery-ui/jquery-ui.css" rel="stylesheet"/>
        <!--<link href="<?php echo base_url(); ?>extra/css/font-awesome.min.css" rel="stylesheet" />-->
        <link href="<?php echo base_url(); ?>extra/css/custom.css" rel="stylesheet" />
        <!--link dataTable-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.css"/>
        <!--Link para los iconos-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <!--Link para la fuente de letra-->
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <!--css slide-->
        <link href="<?php echo base_url();?>extra/js/plugins/jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
        
        <!--JS-->
        <script src="<?php echo base_url();?>extra/js/plugins/jquery-1-11-1.js"></script> 
        <script src="<?php echo base_url();?>extra/js/plugins/bootstrap.js"></script> 
        <script src="<?php echo base_url();?>extra/js/plugins/jquery-ui/jquery-ui.js"></script>
        <!--script dataTable-->
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.js"></script>
       <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script> -->     
        <!--<script src="<?php echo base_url(); ?>extra/js/datatable.js"></script>-->
         <!--js slide-->
        <script src="<?php echo base_url();?>extra/js/plugins/jquery.bxslider/jquery.bxslider.min.js"></script>    

        <!--Llamar script segun en el documento que se piensa usar-->
        <?php if (isset($scripts)): ?>
            <?php foreach ($scripts as $script): ?>
                <script src="<?php echo base_url(); ?>extra/js/<?php echo $script ?>"></script>
                <?php
            endforeach;
        endif;
        ?>

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <input type="hidden" id="url" value="<?php echo site_url().'/';?>">
        <!-- CONTENEDOR PRINCIPAL WRAPPER  -->

        <div class="wrapper" id="cuerpo">

            <!-- start: Header -->

            <nav id="navid" style="background: #0b2027;" class="navbar navbar-default header navbar-fixed-top">
                <div class="col-md-12 nav-wrapper">
                    <div class="navbar-header" style="width:100%;">
                        <div class="opener-left-menu is-open">
                            <a href="<?php echo site_url('inicio')?>"> <img style="width: 80px; height: 60px;" class="" src="<?php echo base_url('extra/img/logo_sefiz .png'); ?>"></a>
                        </div>  

                        <b class="navbar-brand">SEFIZ</b>                     

                        <ul class="nav navbar-nav navbar-right user-nav">
                            <li class="user-name"><span><?php echo $this->session->userdata("usuario"); ?></span></li>
                            <li class="dropdown avatar-dropdown">
                                <img src="<?php echo base_url(); ?><?php echo $this->session->userdata('avatar'); ?>" alt="<?php echo $this->session->userdata('usuario'); ?>" class="img-circle avatar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                                <ul class="dropdown-menu user-dropdown">
                                    <li><a href="<?php echo site_url('mi_perfil') ?>"><span style="color:#000099;" class="fa fa-user"></span> Mi Perfil</a></li>
                                    <li><a href="<?php echo site_url(); ?>/login/cerrar_sesion"><span style="color: #cc0033;" class="fa fa-sign-out"></span> Salir</a></li>   
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>


            <!-- end: Header -->

            <div class="container-fluid mimin-wrapper">


