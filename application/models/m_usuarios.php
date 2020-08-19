<?php

class m_usuarios extends CI_Model {

    function __construct() {
        parent::__construct();
        
        $this->load->helper('security');
    }


    function verificar_usuario($usuario, $clave) {

        #Encriptar Clave primero, antes de comparar
        $claveEncriptada = do_hash($clave, 'md5');

        $sql = "SELECT DISTINCT idUsuario,user,password,avatar,estado FROM usuario WHERE user='" . $usuario . "' && password='" . $claveEncriptada . "'";

        #Buscamos en la base de datos
        $query = $this->db->query($sql);

        #Verificar si coinciden y enviamos los campos seleccionados en forma de objeto
        if ($query->num_rows() > 0) {

            #Preguntamos si el usuario se encuentra ACTIVO
            $fila = $query->row();
            if ($fila->estado == "I"):
                $this->session->set_flashdata('mensaje', 'Tu cuenta está inactiva.');
                redirect('login', 'refresh');
            else:
                return $fila;
            endif;
        }else {
            #Sino existe el usuario; creamos el error y almacenamos en flashdata
            
            $this->session->set_flashdata('mensaje', 'Los datos introducidos son incorrectos.');
            redirect('login', 'refresh');
        }
    }


    #Obtener el idperfil de un usuario especifico
    
    function obtener_perfil_idusuario($idu) {

        $idu = intval($idu);
        $query = $this->db->query('select idperfil from usuarioperfil where idusuario=' . $idu);

        if ($query->num_rows() > 1) {
            return $query->result();
        } else {
            return $query->row();
        }
    }    
   

    #Obtener el recurso por idperfil - Menu Principal

    function crear_menu($idperfil) {
        $idperfil = intval($idperfil);

        $sql = "SELECT rp.idRecurso,r.url,r.nombre,r.icono,r.icono2 from perfilrecurso as rp inner join recurso as r on rp.idRecurso=r.idrecurso where rp.idPerfil=" . $idperfil . " and rp.acceso='1'";

        $consulta = $this->db->query($sql);

        return $consulta->result();
    }

}
