<?php

class M_llamados_select extends CI_Model {
    
    
    #Selecciona los tipos de documentos
    public function obtener_tipo_docu() {

        $sql = "SELECT * FROM detalle_combo WHERE idcombo = '2';";
        $consulta = $this->db->query($sql);

        #Verifico que retornemos los resultados encontrados    
        if ($consulta->num_rows > 0) {

            return $consulta->result();
        }
    }

    
    #Selecciona los tipos de sexo
    public function obtener_sexo() {

        $sql = "SELECT * FROM detalle_combo WHERE idcombo = '5'";
        $consulta = $this->db->query($sql);
        return $consulta->result();
        
    }

    
    #Selecciona los estadociviles
    public function obtener_estadocivil() {

        $sql = "SELECT * FROM detalle_combo WHERE idcombo = '7'";
        $consulta = $this->db->query($sql);       
        return $consulta->result();
        
    }

    
    #Selecciona las profesiones
    public function obtener_profesion() {

        $sql = "SELECT * FROM profesiones ORDER BY oficio ASC"; 
        $consulta = $this->db->query($sql);    
        return $consulta->result();
        
    }

    
    #Selecciona los estados del prospecto
    public function obtener_estado() {

        $sql = "SELECT * FROM detalle_combo WHERE idcombo = '8'";
        $consulta = $this->db->query($sql);        
        return $consulta->result();
        
    }

    
    #metodo para cargar los paises
    function obtener_pais() {
        
        $sql = "SELECT paises.codigo, paises.descripcion FROM paises ORDER BY descripcion ASC ";   
        $consulta = $this->db->query($sql);
        return $consulta->result();

    }
    

    #metodo para cargar los departamentos
    function obtener_dpto($id) {

        $sql = "SELECT DISTINCT cod_departamento, nom_departamento FROM paisciudad WHERE cod_pais ='".$id."'";
        $consulta = $this->db->query($sql); 
        return $consulta->result();   

    }
    

    #metodo para cargar los municipios
    function obtener_municipios($id) {
        
        $sql = "SELECT DISTINCT cod_municipio_compuesto_2, nom_departamento, nom_municipio FROM paisciudad WHERE 
        cod_departamento=".$id;
        $consulta = $this->db->query($sql);
        return $consulta->result();

    }

    #metodo para obtener el tipo de persona que se va a registrar
    function obtener_tipo_persona(){

        $sql = "SELECT * FROM detalle_combo WHERE idcombo = '1' ";        
        $consulta = $this->db->query($sql);
        return $consulta->result();

    }

        
    function obtener_materiales(){

        $consulta = $this->db->get('material');
        return $consulta->result();

    }


    public function obtener_titulos_materiales($id){

        $sql = "SELECT * FROM control_material WHERE idmaterial =".$id;
        $consulta = $this->db->query($sql);

        if($consulta->num_rows() > 0){
             
             return $consulta->row();
        }else{
            return "N";
        }

    }



}
