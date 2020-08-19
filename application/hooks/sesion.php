<?php
if (!defined( 'BASEPATH')) exit('No direct script access allowed'); 

class Sesion{

    private $ci;

    public function __construct() {

        $this->ci =& get_instance();
        !$this->ci->load->library('session') ? $this->ci->load->library('session') : false;
       
    }    
	
	//Antes de cargar cualquier Controlador, verifico que exista la sesion
    public function check_login(){
        
        if($this->ci->uri->segment(2) == 'iniciar_sesion' && $this->ci->session->userdata('is_login') == TRUE)
        {
 
            redirect('inicio');
 
        }else if($this->ci->session->userdata('is_login') == FALSE && $this->ci->uri->segment(1) != 'login')
        {
 
            redirect('login');
 
        }
    }
}