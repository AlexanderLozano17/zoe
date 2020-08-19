<?php

class M_prospectos extends CI_Model {


    public function registra_prospecto($email, $dataUsuRegistro) {
        
        #Metodo donde verifico que el prospecto no este registrado en la base de datos
        $sql = "SELECT * FROM personas WHERE email='" . $email . "'";
        $consulta = $this->db->query($sql);
        if ($consulta->num_rows() > 0) {
            $this->session->set_flashdata(array('mensaje' => '<i class="fa fa-info-circle icon-2x"></i> Ya se encuentra registrado.',
                'clase' => 'alert alert-danger'));


            redirect('prospectos/registrar_prospecto', 'refresh');

        }else {
            #Obtenemos id del usuario que realizara el registro
            $idu = $this->session->userdata('idusuario');

            #Inicio la transaccion para un registro
            $this->db->trans_start();
            
            #Si guarda bien, obtener el id de la nueva persona
            if($this->db->insert("personas", $dataUsuRegistro)){
                
                $idPersonaNueva=$this->db->insert_id();
                
                $datosRed=array(
                            "idpadre"        =>(int) $idu,
                            "idhijo"         =>(int) $idPersonaNueva,
                            "nom_red"        =>"red".$idu,
                            "fecha_ubicacion"=>date("Y-m-d"),
                            "estado"         =>1
                            );

            }
            $this->db->insert("red",$datosRed);
            $this->db->trans_complete();


            if($this->db->trans_status()===FALSE){
                $this->session->set_flashdata(array('mensaje' => '<i class="fa fa-check icon-2x"></i> Error en la transaccion.',
                'clase' => 'alert alert-error'));

            }else{

                $this->session->set_flashdata(array('mensaje' => '<i class="fa fa-check icon-2x"></i> Registrado correctamente.',
                'clase' => 'alert alert-success'));

                return  "S";

            }            

            redirect('prospectos/registrar_prospecto', 'refresh');
        }
        
    }


    #Metodo donde editar los registros de los prospectos
    public function editar_Registro($idprospecto) {

        $id = $idprospecto;
        $sql = "SELECT personas.*, detalle_combo.detalle_item FROM personas
        INNER JOIN detalle_combo ON detalle_combo.valor_item = personas.estado
        WHERE idcombo = 8 AND idpersona = ".$id ;

        $consulta = $this->db->query($sql);
        return $consulta->row();
    }
    

    #Metodo donde actualizo los los datos de los prospectos
    public function actulizarDatosProspecto($id, $data) {
        return $this->db->update('personas', $data, array('idpersona' => intval($id)));
    }


    #Metodo para obtener los datos basicos de un prospecto
    public function obtener_Datos_Prospecto($id){
      
        $sql = "SELECT p.nombres,p.apellidos,p.telefono,p.celular,p.email,p.fec_registro,p.estado
                FROM personas AS p WHERE p.idpersona =".$id;

    }


    #Consulta para conocer la actividad que le corresponde segun el perfil
    public function actividades_perfil(){

        $sql = "SELECT act.idactividad,act.nom_actividad,act.icono, 
        (SELECT perfil_sefiz FROM tabla_perfil WHERE idtablaperfil=frm.idtabla_perfil ) AS rol,
        (SELECT tabla FROM tabla_perfil WHERE idtablaperfil=frm.idtabla_perfil ) AS tabla
        FROM clase_formularios frm
        INNER JOIN actividades act ON act.idactividad=frm.idactividad
        WHERE frm.idtabla_perfil='A'";

        $consulta = $this->db->query($sql);

        if($consulta->num_rows()>0){

            return $consulta->result();
        }else{
            return "N";
            //No teiene actividades
        }

    } 

    #Obtener los temas de cada actividad
    public function actividad_temas(){

        $sql = "SELECT tema_perfil.idperfil,tema_actividad.idactividad,actividades.nom_actividad,temas.cod_tema,temas.tema,temas.descripcion 
            FROM tema_actividad 
            INNER JOIN temas ON temas.idtema = tema_actividad.idtema
            INNER JOIN tema_perfil ON tema_perfil.idtema =  temas.idtema
            INNER JOIN actividades ON actividades.idactividad = tema_actividad.idactividad";

        $consulta = $this->db->query($sql);
        
        return $consulta->result();    
    }

    
    

}
