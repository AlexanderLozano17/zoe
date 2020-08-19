<!DOCTYPE html>
<html lang="es">
    <head>

        <title><?php echo $titulo; ?></title>

        <!-- META -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="shortcut icon" href="<?php echo base_url(); ?>extra/img/favicon.ico" type="image/vnd.microsoft.icon">

        <!-- CSS -->
        <link href="<?php echo base_url(); ?>extra/css/bootstrap.min.css" rel="stylesheet" />
        <link href="<?php echo base_url(); ?>extra/css/simple-line-icons.css" rel="stylesheet"/>
        <link href="<?php echo base_url(); ?>extra/css/style.css" rel="stylesheet" />
        <link href="<?php echo base_url(); ?>extra/css/custom.css" rel="stylesheet" />

        <!-- JS -->
        <script src="<?php echo base_url(); ?>extra/js/plugins/jquery-1-11-1.js"></script>
        <script src="<?php echo base_url(); ?>extra/js/plugins/bootstrap.js"></script>
        <script src="<?php echo base_url(); ?>extra/js/comunes.js"></script>
        <? if(isset($script)):  ?>
        <script src="<?php echo base_url(); ?>extra/js/<?php echo $script ?>"></script>
        <? endif ?>
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body class="bg-login">

        <!-- Contenedor Principal  -->
        <div class="container-fluid">
            <div class="row">