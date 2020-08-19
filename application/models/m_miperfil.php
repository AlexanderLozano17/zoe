<?php

class M_miperfil extends CI_Model {

    public function __construct() {

        parent::__construct();

    }


    #Modelo para obtener los datos del perfil de usuario
    public function obtener_Datos_Usuario() {
 
       $id = $this->session->userdata('idusuario');

        $sql = "SELECT personas.*,usuario.user,usuario.email,usuario.avatar,usuario.estado FROM personas 
        INNER JOIN usuario  ON usuario.idUsuario = ".$id."  AND personas.idpersona = ".$id;

        $consulta = $this->db->query($sql);

        return $consulta->row();
    }


    #Modelo donde actualizo mi perfil
    public function actulizar_perfil($idu, $dataMiperfil) {

        return $this->db->update('personas', $dataMiperfil, array('idpersona' => intval($idu)));
    }
    

    public function subir_imagen($ruta){

        $data = array('avatar' => $ruta);

        $idu=intval($this->session->userdata("idusuario"));

        return $this->db->update('usuario', $data,array("idUsuario"=>$idu ));
        }
       
}
