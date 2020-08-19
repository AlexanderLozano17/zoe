<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends CI_Controller {
	
  function __construct() {
    parent::__construct();
  }

  public function index() {

    
    $data = array('titulo'       => "::Inicio::",
                  'rutaVista'    => "home",
                  'tituloPagina' => "Panel de Control",
                  'menu'         => $this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
    );

      $this->load->view('plantilla/template', $data);
  }

  /*public function mantenimiento(){


    $data=array(
    'titulo' 		=> "::Inicio::",
    'rutaVista' 	=> "tplMantenimiento",


    );

      $this->load->view('plantilla/template', $data);

      } */
}//class
