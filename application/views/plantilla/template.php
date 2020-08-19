<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

$this->load->view('plantilla/header', $titulo);
$this->load->view('plantilla/menu', $menu);
$this->load->view('plantilla/content', $tituloPagina);
$this->load->view($rutaVista);
$this->load->view('plantilla/footer');
