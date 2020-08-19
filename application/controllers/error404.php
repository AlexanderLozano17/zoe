<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Error404 extends CI_Controller {

	public function index(){
		
		 $this->load->view('plantilla/headerLogin',
                                   array('titulo'=>'Error 404'));
		 $this->load->view('tplError404');
		
	
	}

}
