<?php
  class model_sefiz extends CI_Model{
  
  		function __construct(){
			parent::__construct();
			//Cargo Clase Database por defecto
			$this->load->database();
				
		}	
		
		#Metodo para actualizar el estado de la capacitación
		function actualiza_capacitacion_usuario($cod_nivel,$cod_usuario){
			//Datos a actualizar
			$data=array("capacitacion"=>1);
			//Ejecutamos la actualización
			$this->db->where(array("cod_nivel" => $cod_nivel,"cod_usuario"=>$cod_usuario) )->update("sefiz_examen", $data);
			
			return true;
			
		}/*actualiza_capacitacion_usuario*/
		
		
		function cargar_nivel($cod_nivel){
			$query_nivel = $this->db->get_where("sefiz_nivel", array("cod_nivel" => $cod_nivel) );
			$response = array(	"cod_nivel" 	=> $query_nivel->row()->cod_nivel, 
								"orden"			=> $query_nivel->row()->orden, 
								"titulo_nivel"	=> $query_nivel->row()->titulo_nivel
								);
			return $response;
		}/*function cargar_nivel*/
		
		
		function cargar_tema($cod_nivel, $cod_tema){
			$query_tema = $this->db->get_where("sefiz_tema", array("cod_nivel" => $cod_nivel, "orden" => $cod_tema, "visible" => 1) );
			$response = array(	"cod_tema"		=> $query_tema->row()->cod_tema, 
								"cod_nivel"		=> $query_tema->row()->cod_nivel, 
								"orden"			=> $query_tema->row()->orden, 
								"titulo_tema"	=> $query_tema->row()->titulo_tema,
								"descripcion"	=> html_entity_decode(htmlspecialchars_decode($query_tema->row()->descripcion))
								);
			return $response;
		}/*function cargar_tema*/
		
		
		/*Aprobado para version 4*/
		function comentarios_nivel($cod_nivel, $cod_tema){
			//$this->load->model("model_general");
			//$this->load->model("model_tercero");
			$response = array();
			$this->db->select("cod_usuario, descripcion, fecha");
			$this->db->order_by("fecha DESC");
			$query_comentarios = $this->db->get_where("sefiz_comentario", array("cod_tema" => $cod_tema, "cod_nivel" => $cod_nivel, "visible" => 1) );
			$array_comentarios = array();
			/*foreach($query_comentarios->result() as $comentario){
				$temp_usuario = $this->model_tercero->datos_personales($comentario->cod_usuario);
				$array_comentarios[] = array(	"cod_usuario"	=> $comentario->cod_usuario,
												"nom_usuario"	=> $temp_usuario["nom_usuario"], 
												"foto_usuario"	=> $temp_usuario["img_200"], 
												"comentario"	=> html_entity_decode($comentario->descripcion), 
												"fecha"			=> $this->model_general->formato_fecha_especial_1($comentario->fecha)
												);
			}//FOREACH*/
			return $array_comentarios;
		}//function comentarios_nivel
		
		
		function consulta_detalle_nivel($cod_nivel){
			$query_nivel = $this->db->get_where("sefiz_nivel", array("cod_nivel" => $cod_nivel) );
			$response = array(	"cod_nivel" 			=> $query_nivel->row()->cod_nivel, 
								"titulo_nivel"			=> $query_nivel->row()->titulo_nivel, 
								"orden" 				=> (int)$query_nivel->row()->orden, 
								"descripcion"			=> html_entity_decode($query_nivel->row()->descripcion), 
								"imagen"				=> $query_nivel->row()->imagen, 
								"fecha_creacion"		=> $query_nivel->row()->fecha_creacion, 	
								"fecha_modificacion"	=> $query_nivel->row()->fecha_modificacion, 
								);
			return $response;
		}/*function consulta_detalle_nivel()*/
		
		#Metodo para consultar el examen del usuario, si es true no lo debe presentar nuevamente
		function consultar_examen_usuario($idNivel,$cod_usuario){
			$consulta = $this->db->select("calificacion, fecha_presentacion")->get_where('sefiz_examen', array("cod_nivel" => $idNivel,"cod_usuario"=>$cod_usuario) );
			
			//Consulto si hay registros con ese cod_usuario
			if($consulta->num_rows()>0){
			$respuesta=array(
							 "calificacion" 	  =>$consulta->row()->calificacion,
							 "fecha_presentacion" =>$consulta->row()->fecha_presentacion
							 );
			}else {
				
				$respuesta=0;
			}//end if else	
			
			return $respuesta;			 
		}/* consultar examen usuario */
		
		//Consulto si el usuario presento capacitacion
		function consulta_capacitacion_usuario($cod_usuario,$nivel){
		$consulta = $this->db->query("SELECT capacitacion FROM sefiz_examen WHERE cod_usuario=".$cod_usuario." AND cod_nivel=".$nivel);
		if($consulta->num_rows() == 0)
			return 0;
		else
			return $consulta->row()->capacitacion;
		}/*function consulta_capacitacion_usuario*/
				
		
		/*Aprobado para version 4*/
		function consulta_detalle_tema($cod_tema){
			$query_nivel = $this->db->get_where("sefiz_tema", array("cod_tema" => $cod_tema) );
			$response = array(	"cod_tema" 				=> $query_nivel->row()->cod_tema, 
								"titulo_tema"			=> $query_nivel->row()->titulo_tema, 
								"orden" 				=> (int)$query_nivel->row()->orden, 
								"descripcion"			=> html_entity_decode($query_nivel->row()->descripcion), 
								"fecha_creacion"		=> $query_nivel->row()->fecha_creacion, 	
								"fecha_modificacion"	=> $query_nivel->row()->fecha_modificacion, 
								);
			return $response;
		}/*function consulta_detalle_tema()*/
		
		
		/*Aprobado para version 4*/
		function consulta_niveles($idusuario){

			$respuesta = array();
			$sql = "SELECT * FROM sefiz_nivel WHERE visible = 1 ORDER BY(orden) ASC ";
			$niveles = $this->db->query($sql);
			$ultimo_nivel = 1;

			foreach($niveles->result() as $nivel){	

				$desc = htmlspecialchars_decode($nivel->descripcion);
				#Valido que el usuario haya aprobado este nivel
				$sql_activo = 'SELECT * FROM sefiz_examen WHERE cod_usuario ="'.$idusuario.'" AND cod_nivel ='.$nivel->cod_nivel;
                #Ejecuto la consulta
				$query_activo = $this->db->query($sql_activo);

				if($query_activo->num_rows() != 0){
					$aprobado = true;

				}else{
					#Consulto la respuesta del ultimo nivel
					$sql_calificacion = 'SELECT * FROM sefiz_examen WHERE cod_usuario ="'.$idusuario.'" AND cod_nivel ='.$ultimo_nivel;
					#Ejecuto la consulta
					$query_calificacion = $this->db->query($sql_calificacion);

					if($query_calificacion->num_rows() == 0):
						$aprobado = false;

					else:

						$aprobado = ((int)$query_calificacion->row()->calificacion < 75)?false:true;						
					endif;//IF

					if($nivel->cod_nivel == 1)
						$aprobado = true;
				}//IF

				$respuesta[] = array(	"cod_nivel"	  	=> $nivel->cod_nivel,
										"titulo"	  	=> $nivel->titulo_nivel,
										"descripcion" 	=> html_entity_decode($desc),
										"imagen"	  	=> $nivel->imagen,
										"aprobado"		=> $aprobado
								  		);
				$ultimo_nivel = $nivel->cod_nivel;
			 }//FOREACH
			return $respuesta;	
		}/*function consulta_niveles()*/
		
		
		#Metodo que consulta todas las preguntas del nivel correspondiente
		function consultar_preguntas($idNivel){
			#Creo la variable que devolverà los datos de la consulta
			$array_cod_preguntas = array();
			$array_desc_pregunta = array();
			$array_respuestas = array();
			$respuesta = array();
			$respuesta2= array();
			#Consulto todas las preguntas del nivel $idNivel
			$preguntas = $this->db->select("cod_pregunta, desc_pregunta")->get_where('sefiz_nivel_pregunta', array("visible" => 1,"cod_nivel"=>$idNivel) );

			foreach($preguntas->result() as $pregunta){

				$array_cod_preguntas[] = $pregunta->cod_pregunta;
				$array_desc_pregunta[$pregunta->cod_pregunta] = $pregunta->desc_pregunta;
				//Consulto las respuesta de cada pregunta del nivel $idNivel
				$respuestas = $this->db->select("cod_respuesta, descripcion")->get_where('sefiz_nivel_respuesta', array("cod_pregunta"=> $pregunta->cod_pregunta, 
					        "visible"     => 1) );

				$temp_array_respuestas      = array();
				$temp_array_desc_respuestas = array();

				foreach($respuestas->result() as $respuesta){

					$temp_array_respuestas[] = $respuesta->cod_respuesta;
					$temp_array_desc_respuestas[$respuesta->cod_respuesta] = $respuesta->descripcion;

				}/*foreach*/

				shuffle($temp_array_respuestas);
				$array_respuestas[$pregunta->cod_pregunta] = array("indice_respuestas" => $temp_array_respuestas, "respuestas" => $temp_array_desc_respuestas);

			 }/*foreach*/
			 shuffle($array_cod_preguntas);
			 $response = array(	"indices_preguntas"=> $array_cod_preguntas, 
			 					"desc_preguntas"   => $array_desc_pregunta, 
								"respuestas"       => $array_respuestas
								);
			return $response;	

		}/*consultar_preguntas*/

		
		#Metodo para consultar respuestas correctas de acuerdo el codigo de pregunta
		function consultar_respuestas_correctas($cod_pregunta,$cod_respuesta){

			//Consulto las respuestas correctas segun array del usuario
			$consulta = $this->db->select("es_correcta")->get_where('sefiz_nivel_respuesta', array("visible" => 1,"cod_pregunta"=>$cod_pregunta,"cod_respuesta"=>$cod_respuesta));

			$fila=$consulta->row();

			return $fila->es_correcta;

		}/*Consultar_respuestas correctas*/
		
		
		/*Aprobado para version 4*/
		function consultar_temas($cod_nivel){

			$response = array();
			$consulta = $this->db->order_by("orden")->select("orden, titulo_tema")->get_where("sefiz_tema", array("visible" => 1, "cod_nivel" => $cod_nivel));

			foreach($consulta->result() as $tema){

				$response[] = array("orden"  => $tema->orden,
									"titulo" => $tema->titulo_tema
									 );
			 }//FOREACH

			return $response;	
		}/*function consultar_temas()*/
		
		
		#Metodo que guarda el examen
		function guardar_examen($idNivel,$cod_usuario,$calificacion,$fechaExamen){
		    $data=array(
		  			  'cod_nivel'	 =>$idNivel,
					  'cod_usuario'	 =>$cod_usuario,
					  'calificacion' =>$calificacion,
					  'fecha_presentacion' =>$fechaExamen
					  );

			$query_existe = $this->db->get_where("sefiz_examen", array("cod_nivel" => $data["cod_nivel"], "cod_usuario" => $data["cod_usuario"]) );

			if($query_existe->num_rows() == 0){// inserta
				$this->db->insert("sefiz_examen", $data);

			}else{//actualiza
				$this->db->where(array("cod_examen" => $query_existe->row()->cod_examen) )->update("sefiz_examen", $data);
			}
			
				
			return true;	
		}
		
		
		#Metodo que consulta si el estudiante aprobo o no el examen que se le indique
		function valida_examen_nivel_usuario_sefiz($cod_usuario,$nivel){
				$consulta = $this->db->select("calificacion")->get_where('sefiz_examen', array("cod_nivel" => $nivel,"cod_usuario"=>$cod_usuario) );
				
				//Consulto si hay registros con ese cod_usuario y nivel
				if($consulta->num_rows()>0){
					$respuesta=(int)$consulta->row()->calificacion;
					//Pregunto si el examen es aprobado o no.
					if($respuesta>=70){
						$aprobado='S';
					}else{
						$aprobado='N';
					}					
				}else {
					$aprobado=0;
				}//end if else	
				
				return $aprobado;
		}/* valida_examen_nivel_usuario_sefiz*/
		
  
  }/*class model_sefiz*/


?>