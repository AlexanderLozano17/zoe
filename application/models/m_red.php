<?php

class M_red extends CI_Model {
    
    public function __construct() {
        parent::__construct();
        
        $this->load->database();
        
    }


    #Modelo para obtener la red de prospectos del usuario de la session         
    function obtener_Red_Prospectos() {
        #cargo el id del usuario de session
        $idu = $this->session->userdata('idusuario');
        
        #Consulta para obtener los prospectos dentro de un red
        $sql = "SELECT personas.idpersona,personas.nombres, personas.apellidos, personas.telefono,
        personas.celular,personas.email, personas.fec_registro,red.idpadre,red.idhijo,personas.estado
        FROM personas
        INNER JOIN detalle_combo ON personas.idtipo_persona = 1 AND detalle_combo.iddetalle_combo = 1
        INNER JOIN red ON red.idpadre = '".$idu."' AND red.idhijo = personas.idpersona 
        ORDER BY personas.idpersona ASC";

        $consulta = $this->db->query($sql);
        
        if ($consulta->num_rows() > 0) {

            return $consulta->result();

        } else {
            /*$this->session->set_flashdata(array('mensaje' => '<i class="fa fa-check icon-2x"></i>Red de Prospectos vacia.',
                'clase' => 'alert alert-info'));*/
        }
    

    }  


    #Modelo para obtener la cantidad de empresarios a cargo de la red del usuario
    public function cantidad_red_empresario(){

        $idu = $this->session->userdata('idusuario');
        $sql = "SELECT COUNT(idUsuario) AS Personasred FROM usuario WHERE usuarioCreacion = ".$idu;
        $consulta = $this->db->query($sql);

        if($consulta->num_rows() > 0){

            return $consulta->result();
        }

    }  


    #Modelo para obtener la red de aprendizes del usuario de la session         
    public function obtener_Red_Empresarios() {
        #cargo el id del usuario de session
        $idu = $this->session->userdata('idusuario');
        #Consulta para obtener los Empresarios dentro de un red
        $sql = "SELECT personas.idpersona,detalle_combo.detalle_item, personas.nombres,personas.apellidos,usuario.avatar
                FROM personas
                INNER JOIN usuario ON idusuario = personas.idpersona 
                INNER JOIN detalle_combo ON personas.idtipo_persona = 2 AND detalle_combo.iddetalle_combo = 2
                INNER JOIN red ON red.idpadre = '".$idu."' AND red.idhijo = personas.idpersona 
                ORDER BY personas.idpersona ASC";

        $consulta = $this->db->query($sql);
        
        if($consulta->num_rows() > 0 ){

            return $consulta->result();
        
        }else{
            return "N";
        }              

    }


    #Modelo para obtener los descendientes de los empresarios
    function obtener_descendientes($ide){
       #Consulta para obtener los descendientes dentro de una red
       $sql = "SELECT personas.idpersona,detalle_combo.detalle_item, personas.nombres,personas.apellidos,usuario.avatar
                FROM personas
                INNER JOIN usuario ON idusuario = personas.idpersona 
                INNER JOIN detalle_combo ON personas.idtipo_persona = 2 AND detalle_combo.iddetalle_combo = 2
                INNER JOIN red ON red.idpadre = '".$ide."' AND red.idhijo = personas.idpersona 
                ORDER BY personas.idpersona ASC";

        $consulta = $this->db->query($sql); 

        if($consulta->num_rows() > 0){

            return $consulta->result();

        }else{
            return "N";
        }      
        

    }

    #Modelo para buscamos los datos completos del empresario deseado
    public function buscar_datos_empresario($ide){
        #cargo el id del usuario de session
        $idu = $this->session->userdata('idusuario');
        #Consulta para obtener los datos del Empresarios dentro de la red
        $sql = "SELECT p.idpersona,tp.detalle_item AS tipo_persona,p.nombres,p.apellidos,id.detalle_item AS documento,p.identificacion,p.fec_nac,sx.detalle_item AS sexo,ec.detalle_item AS estado_civil,pr.oficio,ps.descripcion,pc.nom_municipio,p.barrio,p.direccion,p.telefono,p.celular,p.email,p.fec_registro,et.detalle_item AS estado,u.avatar
        FROM personas  p
        INNER JOIN usuario u ON u.idusuario = p.idpersona
        INNER JOIN profesiones pr ON pr.idprofesion = p.idprofesion 
        INNER JOIN detalle_combo tp ON p.idtipo_persona = 2 AND tp.iddetalle_combo = 2
        INNER JOIN detalle_combo id ON id.valor_item = p.idtipodocu
        INNER JOIN detalle_combo sx ON sx.valor_item = p.idsexo
        INNER JOIN detalle_combo ec ON ec.valor_item = p.idestado_civil
        INNER JOIN detalle_combo et ON et.valor_item = p.estado
        INNER JOIN paises ps ON ps.codigo = p.idcodpais
        INNER JOIN paisciudad pc ON pc.cod_municipio_compuesto_2 = p.idCiudad
        INNER JOIN red  r ON r.idpadre ='".$idu."' AND r.idhijo = '".$ide."' AND p.idpersona='".$ide."' ORDER BY p.idpersona ASC";

        $consulta = $this->db->query($sql);
        
        if($consulta->num_rows() > 0){
            return $consulta->row_array();  
        }else{
            return "N";
        }        

    }



    #0btener las actividades echas y aprobadas por el prospecto
    public function actividades_aprobadas_prospecto($id){

        $sql = "SELECT p.idpersona, a.idactividad,a.nom_actividad,frm.idtitulo_actividad
        FROM personas AS p
        INNER JOIN frm_prospectos  frm ON frm.idpersona = p.idpersona
        INNER JOIN actividades a ON a.idactividad = frm.idtitulo_actividad ";

        $consulta = $this->db->query($sql);
    }

}
