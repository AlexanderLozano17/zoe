<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Prospectos extends CI_Controller {

  public function __construct() {
    parent::__construct();

    $this->load->model('m_prospectos');
    $this->load->model('m_red');
    $this->load->model('m_llamados_select');        
    $this->load->library('form_validation');         
        
    }
    
    
  #Pagina Principal , Listado de Prospectos
  public function index() {
        

    $data = array('titulo'       => '::lista prospectos::',
                  'rutaVista'    => 'prospectos/v_listprospectos',
                  'tituloPagina' => 'Listado de Prospectos',
                  'datosm_red'   =>  array('listMiRed'    => $this->m_red->obtener_Red_Prospectos(),
                                           'actividadesPR'=> $this->m_prospectos->actividades_perfil(),
                                           'temas'        => $this->m_prospectos->actividad_temas(),
                                           'material'     => $this->m_llamados_select->obtener_materiales()),
                  'menu'         => $this->m_usuarios->crear_menu($this->session->userdata('idperfil')),
                  'scripts'      =>array('datatable.js','prospectos.js') 
                  );            

    $this->load->view('plantilla/template', $data);
        
  }       
    

  #Nuevo Prospecto , Formulario de Registro
  public function registro() {
        
    $data = array('titulo'      => "::Registro Sefiz::",
                  'rutaVista'   => "prospectos/v_fromRegistro",
                  'tituloPagina'=> "Registro Sefiz",
                  'menu'        => $this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
                  );

    $this->load->view('plantilla/template', $data);        
        
  }    
    
    
  public function registrar_prospecto() {
        
    #Reglas para validacion del formulario de registro
    $this->form_validation->set_rules('txtNombre'     , 'Nombres'    , 'required|max_length[45]');
    $this->form_validation->set_rules('txtApell'      , 'Apellidos'  , 'required|max_length[45]');
    $this->form_validation->set_rules('Telefono'      , 'telefono'   , 'trim|numeric|max_length[7]');
    $this->form_validation->set_rules('Celular'       , 'celular'    , 'required|trim|numeric|max_length[10]');
    $this->form_validation->set_rules('txtEmail'      , 'email'      , 'required|valid_email');
        

    if ($this->form_validation->run() === FALSE) {
            
      #sino se cumple la validacion recargamos de nuevo la pagina
      $data = array('titulo'      => "::Registro Sefiz::",
                    'rutaVista'   => "prospectos/v_fromRegistro",
                    'tituloPagina'=> "Registro Sefiz",
                    'menu'        => $this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
                  );

      $this->load->view('plantilla/template', $data); 
          
    } else {
      #capturamos los datos enviados por la vista
      $dataUsuRegistro = array('nombres'        => ucwords($this->input->post("txtNombre")),
                               'apellidos'      => ucwords($this->input->post("txtApell")),
                               'telefono'       => $this->input->post("Telefono"),
                               'celular'        => $this->input->post("Celular"),
                               'email'          => $this->input->post("txtEmail"),
                               'fec_registro'   => date("Y-m-d | H:i:s"),
                               'estado'         => ("P"),
                               'usuarioCreacion'=> $this->session->userdata('idusuario')
                              );
                                       
          
      $email = $this->input->post("txtEmail");
      #Almaceno la respuesta retornada por el modelo
      $respModelo = $this->m_prospectos->registra_prospecto($email,$dataUsuRegistro);
      redirect('prospectos');
      #Cargo la libreria email
      /*$this->load->library('email');
      
      #Si lo retornado por el modelo es igual a 'S' preparo el controlador para enviar un email al prospecto registrado.
      if($respModelo == "S"){
        $this->email->from('alexanderlozano950@gmail.com', 'alexander lozano');
        $this->email->to('lexlozano950@gmail.com');
        $this->email->subject('Email de Prueba');
        $this->email->message('Probando la Clase Email.');
        $this->email->send();

        if(! $this->email->send()):
          $this->session->set_flashdata(array('mensaje' => '<i class="fa fa-exit icon-2x"></i> Error al enviar el correo.',
                'clase' => 'alert alert-danger'));
        endif;

      }*/
             
    }        
        
  }
    
    
  #Form para editar datos del prospecto
  public function editar_prospecto(){
    #Modelo donde obtengo estados
    $this->load->model('m_llamados_select','select');
        
    #Dato resivido del formulario  
    $idprospecto = $_REQUEST['Idprospecto'];
        
    $data = array('titulo'       =>'Editar',
                  'rutaVista'    =>'prospectos/v_editar',
                  'tituloPagina' =>'Editar Datos',
                  'estados'      =>$this->m_llamados_select->obtener_estado(),
                  'datoprospecto'=>$this->m_prospectos->editar_Registro($idprospecto),                       
                  'menu'         =>$this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
                );
      
    $this->load->view('plantilla/template',$data);        
        
  }
    
    
  public function actualizarRegistroProspecto(){
        
    #Reglas para validacion del formulario de registro
    /*$this->form_validation->set_rules('txtNombre'  ,'Nombres'   ,'required');
    $this->form_validation->set_rules('txtApell'   ,'Apellidos' ,'required');        
    $this->form_validation->set_rules('Telefono'   ,'telefonico','required|trim|numeric');
    $this->form_validation->set_rules('Celular'    ,'Celular'   ,'trim|numeric');
    $this->form_validation->set_rules('txtEmail'   ,'email'     ,'required|valid_email');
        
    if($this->form_validation->run() === FALSE){
          
      redirect("prospectos/editar_prospecto");
        
           
    }else{*/
      #Se actualizaran los datos del prospecto
      #Recibimos los datos a actualizar            
      $datosProspectosModificados = array('nombres'  =>ucwords($this->input->post('txtNombre')),
                                          'apellidos'=>ucwords($this->input->post('txtApell')),
                                          'telefono' =>$this->input->post('Telefono'),
                                          'celular'  =>$this->input->post('Celular'),
                                          'email'    =>$this->input->post('txtEmail'),
                                          'estado'   =>$this->input->post('txtEstado'),
                                          'usuarioCreacion'=> $this->session->userdata('idusuario')                     
                                        );

      $id       = $this->input->post('Idprospecto'); #Captura del dato id que se actualizara
      $actualiza= $this->m_prospectos->actulizarDatosProspecto($id,$datosProspectosModificados);
            
      if($actualiza){

        $this->session->set_flashdata(array('mensaje'=>'<i class="fa fa-check icon-2x"></i> Prospecto Actualizado.','clase'=>'alert bg-green'));       
                                          
        redirect('prospectos/editar_prospecto?Idprospecto='.$id, 'refresh');

      }else{
        
        $this->session->set_flashdata(array('mensaje'=>'<i class="fa fa-exit icon-2x"></i> Error de Actualizacion.','clase'=>'alert alert-danger'));
      }
            
            
  //}
        
  }


  function nombres_Materiales(){

    $idTipomaterial= intval($this->input->post("idMaterial"));
    $nomMaterial   = $this->m_llamados_select->obtener_titulos_materiales($idTipomaterial);

    echo json_encode($nomMaterial);
        
  }


  
}

    
    

