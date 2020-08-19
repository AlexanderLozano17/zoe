<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {
    #Método index. Carga el formulario de login, la verificacion de la sesion se hace en el Hook

    function index() {

        $this->load->view('plantilla/headerLogin', array('titulo' => 'SEFIZ'));
        $this->load->view('loginView');
    }

    #Método para comparar el usuario y clave de BD e iniciar Sesion

    function iniciar_sesion() {

        //Cargamos el Modelo
        $this->load->model('m_usuarios', 'usuarios');

        //Obtener datos del Formulario
        $usuario = $this->input->post('txtUsuario');
        $clave   = $this->input->post('txtClave');

        $existe_usuario = $this->usuarios->verificar_usuario($usuario, $clave);

        //Verificar si existe el usuario
        if ($existe_usuario) {

             //Verificar Avatar
              if($existe_usuario->avatar=='N'||$existe_usuario->avatar==null||$existe_usuario->avatar==NULL||$existe_usuario->avatar==''){

              $imagen='extra/img/user.png';
              }else{
              $this->load->helper('url');
              $imagen='extra/img/usuarios/'.$existe_usuario->avatar;
              }


            //Recuperar Perfil
            $consulta = $this->usuarios->obtener_perfil_idusuario($existe_usuario->idUsuario);
            
            //Contar cuantos perfiles tiene el usuario
            if (count($consulta) > 1) {

                $perfiles = array();
                foreach ($consulta as $perfil):
                    $perfiles[] = $perfil->idperfil;
                endforeach;

                $idperfil = implode("-", $perfiles);
            }else {
                $idperfil = $consulta->idperfil;
            }



            //Si existe, creamos los datos de Sesion
            $data = array('is_login' => TRUE,
                          'idusuario'=> $existe_usuario->idUsuario,
                          'idperfil' => $idperfil,
                          'usuario'  => $existe_usuario->user,
                          'avatar'	 =>$imagen
            );


            $this->session->set_userdata($data);
            redirect('inicio');
        }
    }

    #Método para cerrar Sesion

    function cerrar_sesion() {

        $datasession = array('is_login' => FALSE,
                             'idusuario'=> '',
                             'idperfil' => '',
                             'usuario'  => '', 
                             'avatar'   =>''
        );

        # y eliminamos la sesión
        $this->session->sess_destroy($datasession);        
        redirect('login');
    }
    

}

//class
