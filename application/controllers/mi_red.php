<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Mi_red extends CI_Controller{
    
    public function __construct() {
        parent::__construct();
        $this->load->model('m_red');
        $this->load->model('m_miperfil');
        
    }

    #Red Empresarios
    public function index(){   

	    $data = array('titulo'          => '::Mi red::',
	                  'rutaVista'       => 'red/red_Empresarios',
	                  'tituloPagina'    => 'Mi red',
	                  'red'             => array('listEmpresarios'=>$this->m_red->obtener_Red_Empresarios(),
                                                 'Usuario'        =>$this->m_miperfil->obtener_Datos_Usuario(),
                                                 'Nprospectos'    =>$this->m_red->cantidad_red_empresario()),
                      'scripts'         =>array('red.js'),
	                  'menu'            => $this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
	                );       

	    $this->load->view('plantilla/template', $data);              
    
    
    }


    #Metodo para buscar los datos del empresario
    public function buscar_empresario_datos(){
        #Dato enviado desde el red.js
        $ide = intval($_POST['id']);         
        #Obtengo el id del empresario desda la url
        //$ide = $this->uri->segment(3);
        #Pasamos el $ide como parametro al funcion buscar_datos_empresario
        $respuesta = $this->m_red->buscar_datos_empresario($ide);
        
        echo json_encode($respuesta);      
     
    }

    
    #Metodo para imprimir la red descendiente dentro de otra red 
    public function lista_red_descendiente(){
        #Dato enviado desde el red.js
        $ide = intval($_POST['idEm']);
        #$ide = $this->uri->segment(3);
        #Pasamos el $ide como parametro al funcion obtener_descendientes
    	$red_Descendiente = $this->m_red->obtener_descendientes($ide);

    	echo json_encode($red_Descendiente);

    }

    #Metodo para imprimir la red de Prospectos Pendiente por el metodo ajax
    /*
    public function red_Prospectos(){

    	$listProspectos = $this->m_red->obtener_Red_Prospectos();

    	echo json_encode($listProspectos);

    }
    */
}
