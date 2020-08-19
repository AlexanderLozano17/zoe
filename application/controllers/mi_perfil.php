<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Mi_perfil extends CI_Controller {

  public function __construct() {
        
    parent::__construct();
        
    $this->load->library('form_validation');
    $this->load->model('m_llamados_select');
    $this->load->model('m_prospectos');
    $this->load->model('m_miperfil');
        
  }

  #Vista de los datos del usuario
  public function index() {
        
   $data = array('titulo'      => "::Mi_perfil::",
                 'rutaVista'   => "usuario/v_mi_perfil",
                 'tituloPagina'=> "Mi perfil Sefiz",
                 #Array donde se cargaran los datos para las cajas de seleccion  
                 'datos_perfil'=> array('tipodoc'  => $this->m_llamados_select->obtener_tipo_docu(),
                                     'sexo'        => $this->m_llamados_select->obtener_sexo(),
                                     'estadocivil' => $this->m_llamados_select->obtener_estadocivil(),
                                     'profesiones' => $this->m_llamados_select->obtener_profesion(),
                                     'pais'        => $this->m_llamados_select->obtener_pais()
                                    ),
                 'misDatos'    => $this->m_miperfil->obtener_Datos_Usuario(),
                 'scripts'     => array('scriptPais.js'),
                 'menu'        => $this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
                  );
           
                          
                      
    $this->load->view("plantilla/template", $data);

  }

  
  #Metodo para actualizar los datos del usuario
  public function actulizar_mi_perfil() {
    #Reglas para la validacion del formulario de los datos del usuario
    $this->form_validation->set_rules('selCed'         ,'tipo documento'      ,'');
    $this->form_validation->set_rules('Numdoc'         ,'Numero de documento' ,'numeric|max_length[15]');
    $this->form_validation->set_rules('txtNombre'      ,'Nombres'             ,'required|max_length[48]');
    $this->form_validation->set_rules('txtApell'       ,'Apellidos'           ,'required|max_length[45]');
    $this->form_validation->set_rules('txtFch'         ,'Fecha de nacimiento' ,''); 
    $this->form_validation->set_rules('selsexo'        ,'sexo'                ,''); 
    $this->form_validation->set_rules('selestadocivil' ,'estadocivil'         ,'');
    $this->form_validation->set_rules('selProfesion'   ,'Profesion'           ,'');
    $this->form_validation->set_rules('selPais'        ,'Pais'                ,'');
    $this->form_validation->set_rules('selDepartamento','Departamento'        ,'');
    $this->form_validation->set_rules('selestadocivil' ,'estadocivil'         ,'');
    $this->form_validation->set_rules('selCiudad'      ,'Ciudad'              ,'');
    $this->form_validation->set_rules('txtDireccion'   ,'Direccion residencia','max_length[45]');
    $this->form_validation->set_rules('Telefono'       ,'Numero telefonico'   ,'trim|numeric|max_length[10]'); 
    $this->form_validation->set_rules('celular'        ,'Celular'             ,'required|numeric|max_length[10]');
    $this->form_validation->set_rules('txtEmail'       ,'email'               ,'required|valid_email|max_length[100]');
      
    #Sino se cumple la validacion recargamos de nuevo la pagina    
    if($this->form_validation->run() === FALSE){ 
      
      #Id persona
      $idu=$this->session->userdata('idusuario'); 
        
      $data = array('titulo'   => "::Mi_perfil::",
                 'rutaVista'   => "usuario/v_mi_perfil",
                 'tituloPagina'=> "Mi perfil Sefiz",
                 #Array donde se cargaran los datos para las cajas de seleccion  
                 'datos_perfil'=> array('tipodoc'  => $this->m_llamados_select->obtener_tipo_docu(),
                                     'sexo'        => $this->m_llamados_select->obtener_sexo(),
                                     'estadocivil' => $this->m_llamados_select->obtener_estadocivil(),
                                     'profesiones' => $this->m_llamados_select->obtener_profesion(),
                                     'pais'        => $this->m_llamados_select->obtener_pais()
                                    ),
                 'misDatos'    => $this->m_miperfil->obtener_Datos_Usuario(),
                 'scripts'     => array('scriptPais.js','perfil.js' ),
                 'menu'        => $this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
                  );
           
                          
                      
    $this->load->view("plantilla/template", $data);         
            
    }else{
            
      #Capturamos los datos enviados por la vista
      $dataMiperfil = array('idtipodocu'     => $this->input->post("selCed"),
                            'identificacion' => $this->input->post("Numdoc"),
                            'nombres'        => ucwords($this->input->post("txtNombre")),
                            'apellidos'      => ucwords($this->input->post("txtApell")),
                            'fec_nac'        => $this->input->post("txtFch"),
                            'idsexo'         => $this->input->post("selsexo"),
                            'idestado_civil' => $this->input->post("selestadocivil"),
                            'idprofesion'    => $this->input->post("selProfesion"),
                            'idcodpais'      => $this->input->post("selPais"),
                            'idDpto'         => $this->input->post("selDepartamento"),
                            'idCiudad'       => $this->input->post("selMunicipio"),
                            'barrio'         => $this->input->post("txtBarrio"),
                            'direccion'      => $this->input->post("txtDireccion"),
                            'telefono'       => $this->input->post("Telefono"),
                            'celular'        => $this->input->post("celular"),
                            'email'          => $this->input->post("txtEmail"),
                            'fec_registro'   => $this->input->post("txtFecharegistro")                            
                            );

      $idu     = $this->session->userdata('idusuario');              
      $consulta= $this->m_miperfil->actulizar_perfil($idu,$dataMiperfil);

      if($consulta):

        $this->session->set_flashdata(array('errorImg'=>'<i class="fa fa-check icon-2x"></i> Actualizado correctamente.','claseImg'=>'alert alert-success')); 
        redirect('Mi_perfil','refresh');  

      else:
        
        $this->session->set_flashdata(array('errorImg'=>'<i class="fa fa-exit icon-2x"></i> Error de Actualizacion.','claseImg'=>'alert alert-danger'));
       redirect('Mi_perfil','refresh');

      endif;
           
    }

  }


  public function subir_img() {
     
      /*$config['file_name'] = 'user'.$this->session->userdata("idusuario");*/
    $config['upload_path']  = './extra/img/usuarios/';
    $config['allowed_types']= 'jpeg|jpg|png';
    $config['max_size']     = '300';
    $config['max_width']    = '400';
    $config['max_height']   = '200';
    $config['overwrite']    = TRUE;
    
     $this->load->library('upload',$config);
  
     $pagina_cargar='Mi_perfil';

     if (isset($_FILES['userfile']) && !empty($_FILES['userfile']['name'])){

        //Subimos la imagen @return Boolean
        if($this->upload->do_upload()){
         
            /*
              VARIABLES A USAR SI SUBIO :)

          [file_name]  => mi_pic.jpg
          [file_type]  => image/jpeg
          [file_path]  => /ruta/a/su/subida/
          [full_path]  => /ruta/a/su/subida/jpg.jpg
          [raw_name]   => mi_pic
          [orig_name]  => mi_pic.jpg
          [client_name]=> mi_pic.jpg
          [file_ext]   => .jpg
          [file_size]  => 22.2
          [is_image]   => 1
          [image_width]=> 800
          [image_height]=> 600
          [image_type]  => jpeg
          [image_size_str]=> width="800" height="200"
           */

           $archivo =$this->upload->data();/*Esta es una función helper que devuelve un array tiene 
                                        todos los datos relacionados al archivo que subió.Este es el prototipo del array*/

           //Redimensionamos la imagen
           $this->redimensionar_imagen($archivo["file_name"]);

           //Insertamos la ruta de la imagen a la base de datos
           $ruta_imagen = $archivo['file_name'];
           $this->m_miperfil->subir_imagen($ruta_imagen);
         

           //Modificar variable session de la imagen
           $this->session->set_userdata('avatar','extra/img/usuarios/'.$ruta_imagen);
           $this->session->set_flashdata(array('errorImg'=>'<img src="'.base_url().'/extra/img/success.gif" width="20" /> Imagen nueva de perfil.','claseImg'=>'alert-success'));

             
           }else{
            //Cargo el Mensaje de error
              $this->session->set_flashdata(array('errorImg'=>$this->upload->display_errors("<p><img src='".base_url()."/extra/img/error.png' width='20' /> ","</p>"),'claseImg'=>'alert-danger'));
         }


     }else{
         $this->session->set_flashdata(array('errorImg'=>'<img src="'.base_url().'/extra/img/error.png" width="20" />selecciona una imagen de perfil.','claseImg'=>'alert-danger'));
     }//files
     
       redirect($pagina_cargar,"refresh");
    
  } 

  public function redimensionar_imagen($filename)
  {
    //Carpeta donde esta la imagen original 
    $config['source_image']  = 'extra/img/usuarios/'.$filename;
    $config['image_library'] = 'gd2';
    $config['new_image']     ='extra/img/usuarios';
    $config['create_thumb']  = TRUE;
    $config['maintain_ratio']= TRUE;
    $config['width']         = 160;
    $config['height']        = 130;  

    $this->load->library('image_lib', $config); 
    $this->image_lib->resize();

  }
  


  public function cargar_Departamentos(){

    $codpais = $this->input->post("codPais");

    $consulta = $this->m_llamados_select->obtener_dpto($codpais);
    echo json_encode($consulta);

  }


  public function cargar_Municipios(){

    $idDPto = intval($this->input->post("idDPto"));

    $consulta = $this->m_llamados_select->obtener_municipios($idDPto);
    echo json_encode($consulta);

  }

}
