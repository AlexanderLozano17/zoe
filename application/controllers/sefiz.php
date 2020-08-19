<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	class Sefiz extends CI_Controller {
		
		function __construct(){
			parent::__construct();

			$this->load->model('model_sefiz');
			$this->load->model('m_miperfil');
		}/*function __construct()*/
		
		
		function index(){
			
		$data = array('titulo'      => "::Sefiz::",
                      'rutaVista'   => "sefiz/sefiz_view",
                      'tituloPagina'=> "Escuela de Entrenamiento",
                      'niveles'     => $this->model_sefiz->consulta_niveles($this->session->userdata("idusuario")),
                      'menu'        => $this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
       );

        $this->load->view('plantilla/template', $data);
    	
		}/*function index*/


		public function Escuela_sefiz(){

			$data = array('titulo'      =>'::Escuela::',
						  'rutaVista'   =>'sefiz/temas_nivel_view',
						  'tituloPagina'=>'Escuela Sefiz',
						  'niveles'     => $this->model_sefiz->consulta_niveles($this->session->userdata("idUsuario")),
                          'menu'        => $this->m_usuarios->crear_menu($this->session->userdata('idperfil')));

			$this->load->view('plantilla/template',$data);
		}


		
		
		#Método para habilitar el siguiente nivel del usuario sefiz
		public function ajax_actualiza_nivel_usuario_sefiz($cod_usuario){

			//Capturo El nivel donde se encuentra el usuario actualmente.
			$nivel		  =$this->sefiz->consulta_nivel_actual_usuario($cod_usuario);
			//Consulto ahora si el usuario aprobo el examen del nivel a consultar
			$apruebaExamen=$this->sefiz->valida_examen_nivel_usuario_sefiz($cod_usuario,$nivel);
			
			//Preguntamos si el usuario NO ha presentado el examen virtual
			if($apruebaExamen==0){
			$msje="El usuario no ha presentado el ex&aacute;men virtual del nivel ".$nivel;
			$estado=0;
			}else{
				if($apruebaExamen=='N'){
					$msje="El usuario, no ha aprobado el ex&aacute;men del nivel ".$nivel;	
					$estado=0;
				}else{
					//Si aprobo el examen, actualizamos el examen del usuario en el campo capacitacion a 1
					$result=actualiza_capacitacion_usuario($cod_nivel,$cod_usuario);
						
						if($result){
							$msje="Nivel actualizado correctamente.";
							$estado=1;
						}else{
							$msje="Error al actualizar";
							$estado=1;
						}
						
				}//else
				
				$respuesta=array("0"=>$estado,"1"=>$msje);
				
				echo json_encode($respuesta);
			
			}
			
				
		}/* ajax_actualiza_nivel_usuario_sefiz*/
		
			
		public function ajax_crear_nivel(){

			$this->load->library("firephp");
			//$this->load->model("model_sefiz");
			//$this->load->model("model_general");
			$this->load->helper("string");
			/*if($this->model_general->permiso_usuario("9901") == false){
				echo 3;
				return false;
			}/*if*/
			$allowed = array('jpg', 'jpeg', 'png');
			if($_POST["HddnCodNivel"] == ""){//Nuevo
				if(isset($_FILES['txtImagenNivel']) && $_FILES['txtImagenNivel']['error'] == 0)
					$estado_imagen = true;
				else
					$estado_imagen = false;
			}else{//Edita
				if(isset($_FILES['txtImagenNivel'])){
					if($_FILES['txtImagenNivel']['error'] == 0)
						$estado_imagen = true;
					else
						$estado_imagen = false;
				}else
					$estado_imagen = true;
			}/*if*/
			if($estado_imagen == true){
				if(isset($_FILES['txtImagenNivel'])){
					$extension = pathinfo($_FILES['txtImagenNivel']['name'], PATHINFO_EXTENSION);
					if(!in_array(strtolower($extension), $allowed)){
						echo 4;
						exit;
					}/*if*/
					#### Construimos el nombre logico del archivo
					$nombre_logico = "nivel_sefiz_".strtolower(random_string('alnum', 5)).".".strtolower($extension);
					#### Movemos el archivo del directorio temporal al directorio final
					$fp = fopen($_FILES["txtImagenNivel"]["tmp_name"], 'r');
					$contenido_archivo = fread($fp, filesize($_FILES["txtImagenNivel"]["tmp_name"]));
					fclose($fp);
				}/*if*/
				#### Construyo el arreglo de insersion
				//$descripcion = $this->model_general->purgar_texto(trim($_POST["hddnDescripcionNivel"]));
				$descripcion = htmlentities($descripcion, ENT_COMPAT, "UTF-8");
				$fecha = date("Y-m-d H:i:s");
				$data_insert = array(
										"titulo_nivel" 			=> $_POST["txtNombreNivel"],
										"orden" 				=> (int)$_POST["txtOrdenNivel"],
										"descripcion" 			=> $descripcion, 
										"fecha_modificacion" 	=> $fecha
										);
				if(isset($_FILES['txtImagenNivel'])){
					//$ruta_temporal = $this->model_general->get_route_to_attachment()."sefiz/".$nombre_logico;
					$fp = fopen($ruta_temporal, 'w');
					fwrite($fp, $contenido_archivo);
					fclose($fp);
				}/*if*/
				if($_POST["HddnCodNivel"] == ""){
					$data_insert["imagen"] = $nombre_logico;
					$data_insert["fecha_creacion"] = $fecha;
					$this->db->insert("sefiz_nivel", $data_insert);
				}else{
					if(isset($_FILES['txtImagenNivel'])){
						$data_insert["imagen"] = $nombre_logico;
						$query_nivel = $this->db->get_where("sefiz_nivel", array("cod_nivel" => $_POST["HddnCodNivel"]) );
						//@unlink($this->model_general->get_route_to_attachment()."sefiz/".$query_nivel->row()->imagen);
					}/*if*/
					$this->db->where(array("cod_nivel" => $_POST["HddnCodNivel"]) )->update("sefiz_nivel", $data_insert);
				}/*if*/
				echo 1;
			}else{
				echo 2;
			}/*if*/
		}/*ajax_crear_nivel*/

		
		
		public function ajax_crear_tema(){

			$this->load->library("firephp");
			/*$this->load->model("model_general");
			if($this->model_general->permiso_usuario("9901") == false){
				echo 3;
				return false;
			}/*if*/
			#### Construyo el arreglo de insersion
			//$descripcion = $this->model_general->purgar_texto(trim($_POST["hddnDescripcionTema"]));
			$descripcion = htmlentities($descripcion, ENT_COMPAT, "UTF-8");
			$fecha = date("Y-m-d H:i:s");
			$data_insert = array(
									"titulo_tema" 			=> $_POST["txtNombreTema"],
									"orden" 				=> (int)$_POST["txtOrdenTema"],
									"descripcion" 			=> $descripcion, 
									"fecha_modificacion" 	=> $fecha
									);

			if($_POST["HddnCodTema"] == ""){

				$data_insert["cod_nivel"]     = (int)$_POST["HddnCodNivelTema"];
				$data_insert["fecha_creacion"]= $fecha;
				$this->db->insert("sefiz_tema", $data_insert);

			}else{

				$this->db->where(array("cod_tema" => $_POST["HddnCodTema"]) )->update("sefiz_tema", $data_insert);
			}/*if*/
			echo 1;
		}/*function ajax_crear_tema*/
		
		
		public function ajax_detalle_tema(){

			//$this->load->model("model_general");
			/*if($this->model_general->permiso_usuario("9901") == false){
				return false;
			}/*if*/
			$cod_tema = $_POST["cod_tema"];
			$response = $this->model_sefiz->consulta_detalle_tema($cod_tema);
			echo json_encode($response);
		}/*function ajax_detalle_nivel*/
		
		
		public function ajax_detalle_nivel(){
			
			//$this->load->model("model_general");
			/*if($this->model_general->permiso_usuario("9901") == false){
				return false;
			}/*if*/
			$cod_nivel= $_POST["cod_nivel"];
			$response = $this->model_sefiz->consulta_detalle_nivel($cod_nivel);
			echo json_encode($response);
		}/*function ajax_detalle_nivel*/
		
		
		public function configuracion_sefiz(){
			
			$data =  array('titulo'       => "::Configuración SEFIZ::",
	                        'rutaVista'   => "sefiz/sefiz_configuraciones_view",
	                        'tituloPagina'=> "Configuración SEFIZ",
							'usuario'     => $this->m_miperfil->obtener_Datos_Usuario(),
                            'menu'        => $this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
							);

			/*
			$data_header["nom_usuario"] = $data_usuario["nom_usuario"];
			$data_header["opcion_menu"] = "administradores";
			$data_header["title"] = "Configuración SEFIZ";
			*/
			$this->load->view('plantilla/template', $data);

			/*
			if($this->model_librerias->permiso_usuario("sefiz") == true){

				$this->load->view('SEFIZ/sefiz_configuraciones_view', $data_header);

			}else{

				$data = array("nom_opcion_menu" => "CONFIGURACIÓN SEFIZ");
				$this->load->view("wlcm_no_privilegios_view", $data);

			}//IF
			$data_footer["librerias"][] = base_url()."extra/jqgrid4.6.0/jquery.jqGrid.min.js";
			$data_footer["librerias"][] = base_url()."extra/jqgrid4.6.0/i18n/grid.locale-es.js";
			$data_footer["librerias"][] = base_url()."extra/js/jquery.form.js";
			$data_footer["librerias"][] = base_url()."extra/tiny_mce/tiny_mce.js";
			$data_footer["librerias"][] = base_url()."extra/js/bootstrap.chosen.js";
			$data_footer["librerias"][] = base_url()."extra/js/js_sefiz_gestion_niveles.js";
			$data_footer["jquery_version"] = "1_8_1";
			$this->load->view('wlcm_footer_view', $data_footer);
			*/
		}//function configuracion_sefiz()
		
		
		public function examen($idNivel=""){
			##CABECERA

			$data =  array('titulo'       => "::Escuela SEFIZ::",
	                        'rutaVista'   => "sefiz/sefiz_configuraciones_view",
	                        'tituloPagina'=> "Configuración SEFIZ",
							'usuario'     => $this->m_miperfil->obtener_Datos_Usuario(),
                            'menu'        => $this->m_usuarios->crear_menu($this->session->userdata('idperfil'))
							);
			/*
			$valida_ingreso_sefiz = $this->model_sefiz->valida_aplica_sefiz();
			$data_header["nom_usuario"] = $data_usuario["nom_usuario"];
			$data_header["opcion_menu"] = "sefiz";
			$data_header["title"] = "Escuela SEFIZ";
			$this->load->view('wlcm_header_view', $data_header);
			*/
			##CUERPO
			if($valida_ingreso_sefiz == false){
				$data = array("nom_opcion_menu" => "SEFIZ","msje"=>"Debes adquirir la escuela educativa para acceder a esta opci&oacute;n.");
				$this->load->view("wlcm_no_privilegios_view", $data);
				return;

			}else{
				
				//Si el usuario no coloco la url Completa examen/$idNivel
				if(empty($idNivel)){
					$data = array("nom_opcion_menu" => "SEFIZ","msje"=>"La url indicada es incorrecta.");
					$this->load->view("wlcm_no_privilegios_view", $data);
					return false;
				}
					

				//Cargamos las preguntas del examen
				$data['enunciado'] = $this->model_sefiz->consultar_preguntas($idNivel);
				//Cargamos las respuestas del examen
				$data['codigo']    =$idNivel;
				
				//Consultamos si el estudiante tiene acceso por URL a la seccion de examen///////
				date_default_timezone_set('America/Bogota');
				$cod_usuario = $this->session->userdata("Id_Usuario");
				$examenUsuario= $this->sefiz->consultar_examen_usuario($idNivel,$cod_usuario);
				if($examenUsuario!=0){
						
								
					
						if($examenUsuario["calificacion"]>=70){
							$data = array("nom_opcion_menu" => "SEFIZ","msje"=>"Ha aprobado su examen de este nivel.");
							$this->load->view("wlcm_no_privilegios_view", $data);
							return false;
						}else{
							$hoy=date("d");
							//FECHA DE LA BASE DE DATOS	////////////////////////////
				           	list($fechaExamenBD,$horaExamenBD)=explode(" ", $examenUsuario['fecha_presentacion']);  
							//Separo la fecha en dias, mes y año de la BD de $fechaExamenBD
							list($anioBD,$mesBD,$diaBD)=explode("-",$fechaExamenBD); 
							$hoy=intval($hoy);
							$diaBD=intval($diaBD); 
							//Verificamos si ya el usuario puede prensetar el examen nuevamente 
							if($hoy>$diaBD){
								$this->load->view('sefiz_examen_view',$data);
							}else{
								$data = array("nom_opcion_menu" => "SEFIZ","msje"=>"No ha expirado su tiempo para presentar su examen de nuevo.");
								$this->load->view("wlcm_no_privilegios_view", $data);
								
							}/**if hoy> diaBD*/
						}/* if calificacion >70**/
					
				}else{
					//Verificar si el examen no existe pero si es diferente del primer nivel
					if($examenUsuario==0&&$idNivel!=1){
						$data = array("nom_opcion_menu" => "SEFIZ","msje"=>"No tienes acceso a este ex&aacute;men por el momento.");
						$this->load->view("wlcm_no_privilegios_view", $data);
						return false;
					}
				$this->load->view('sefiz_examen_view',$data);	
				}
					
					
				
				/////////////////////////////////////////////////////////////////////////////////7
				
			}/*if*/
			##PIE DE PAGINA
			$data_footer["librerias"][] = base_url()."extra/js/js_sefiz.js";
			$this->load->view('wlcm_footer_view', $data_footer);
		
		}
		
		
		
		
		
		function guardar_comentario(){
			#Purgo los caracteres especiales del comentario
			$this->load->library("caracteres_especiales");
			$comentario = $_POST["desc_comentario"];
			$comentario = $this->caracteres_especiales->purgar_texto($comentario);
			$comentario = htmlentities($comentario, ENT_COMPAT, "UTF-8");
			#Procedo con la recepcion de las variables
			$fecha = date("Y-m-d H:i:s");
			$data_insert = array(	"cod_nivel"		=> $_POST["cod_nivel"], 
									"cod_tema"		=> $_POST["cod_tema"], 
									"IdUsuario"	=> $this->session->userdata("IdUsuario"),
									"descripcion"	=> $comentario,
									"fecha"			=> $fecha, 
									"visible"		=> 1
									);
			#Construyo el link de redireccionamiento
			$link = base_url()."index.php/sefiz/nivel/".$data_insert["cod_nivel"]."/".$data_insert["cod_tema"];
			#Inserto el comentario el la tabla de comentarios
			$this->db->insert("sefiz_comentario", $data_insert);
			#Inserto el correo para el administrador
			$mensaje = "'".$comentario."'<br><br><hr> Puede seguir este comentario en el siguiente hipervinculo:<br><br>".$link;
			$data_email = array("email_tipo"			=> "comunicado_gerencia", 
								"email_remitente"		=> "sistemas@barakvita.com.co", 
								"email_destinatario"	=> "sistemas@barakvita.com.co", 
								"email_asunto" 			=> "Sefiz: Nuevo Comentario en Tema", 
								"email_mensaje" 		=> $mensaje, 
								"preparado"	=> 1
								);
			$this->db->insert("dge_envio_email", $data_email);
			redirect($link);
		}/*function guardar_pregunta*/
		
		public function gestion_niveles(){
			//$this->load->model("model_general");
			
			$data_usuario = $this->m_miperfil->obtener_Datos_Usuario();
			$data_header["nom_usuario"] = $data_usuario["nom_usuario"];
			$data_header["opcion_menu"] = "administradores";
			$data_header["title"] = "Administradores";
			$data_header["estilos"][] = base_url()."extra/css/bootstrap.chosen.css";
			$data_header["estilos"][] = $this->model_librerias->url_jqgrid_css;
			$this->load->view('wlcm_header_view', $data_header);
			/*if($this->model_general->permiso_usuario("9901") == false){
				$data = array("nom_opcion_menu" => "GESTIÓN NIVELES");
				$this->load->view("wlcm_no_privilegios_view", $data);
			}else{
				$this->load->view('wlcm_sefiz_gestion_niveles_view');
			}/*if*/
			$data_footer["librerias"][] = base_url()."extra/tiny_mce/tiny_mce.js";
			$data_footer["librerias"][] = base_url()."extra/js/bootstrap.chosen.js";
			$data_footer["librerias"][] = base_url()."extra/jqgrid4.4.1/grid.locale-es.js";
			$data_footer["librerias"][] = $this->model_librerias->url_jqgrid_js;
			$data_footer["librerias"][] = base_url()."extra/js/js_sefiz_gestion_niveles.js";
			$data_footer["jquery_version"] = "1_8_1";
			$this->load->view('wlcm_footer_view', $data_footer);
		}/*function gestion_niveles*/
		
		
		#Metodo para guardar los examenes
		function guardar_examen(){
			
			//Llamamos el modelo SEFIZ
			$this->load->model("model_sefiz","sefiz");
			
			//Capturo el id Usuario
			$cod_usuario = $this->session->userdata("Id_Usuario");
			//Capturo el codigo del nivel
			$idNivel=$_POST['idNivel'];
			//Recupero los datos de js, en Array ["1-2","2-1"] etc
			$respuestasUsuario=$_POST['respuestas'];
			//Creo la fecha de presentacion del examen
			$fechaExamen = date("Y-m-d H:i:s");
			
			//Creo una variable contador de las respuestas correctas
			$contador=0;
			
			for($i=0;$i<count($respuestasUsuario);$i++){
				//Guardo las respuestas una a una ej: "1_2"
				$respuesta=$respuestasUsuario[$i];
				//Separo la respuesta ej: 1_2 = 1   2
				list($cod_pregunta,$cod_respuesta)=explode("-",$respuesta);
				//Consulto si la respuesta es correcta enviando 2 parametros separados ej: 1 (pregunta) 2(respuesta)
				$estado=$this->sefiz->consultar_respuestas_correctas($cod_pregunta,$cod_respuesta);
				
				if($estado=='s'){
				$contador++;
				}
				
			}//end for
			
			//Hallo el porcentaje de respuestas acertadas
			$totalPreguntas=count($respuestasUsuario);
			$calificacion=($contador/$totalPreguntas)*100;
			$calificacion=number_format($calificacion,2);
			
			$result=$this->sefiz->guardar_examen($idNivel,$cod_usuario,$calificacion,$fechaExamen);
			
			if($result==0){
			$msje="Error al guardar examen.";
			}else{
			$msje="Examen guardado satisfactoriamente.";
			 
						
			}//if result
			
			$rta=array(
						"msje"		    =>$msje,
						"acertadas"    =>$contador,
						"calificacion" =>$calificacion,
						);
			
			
			echo json_encode($rta);
								
		}//guardar examen
		
		
		
		
		public function jqgrid_gestion_niveles(){
			//$this->load->model("model_general");
			/*if($this->model_general->permiso_usuario("9901") == false){
				return;
			}/*if*/
			############################################
			################ Parametros de la grilla
			$page = $_POST['page'];
			$limit = $_POST['rows'];
			$sidx = (!$_POST['sidx'])?1:$_POST['sidx']; //if we not pass at first time index use the first column for the index or what you want
			$sord = $_POST['sord'];
			############################################
			################ Primera Query de la consulta, se usa para calcular el numero de registros			
			$query = $this->db->get_where("sefiz_nivel", array("visible" => 1) );
			################ Numero Total de Registros
			$count = $query->num_rows();		
			################ Calculamos el total de paginas de la consulta
			$total_pages = ($count > 0 && $limit > 0)?ceil($count/$limit):0;
			################ if for some reasons the requested page is greater than the total, set the requested page to total page 
			$page = ($page > $total_pages)?$total_pages:$page;
			################ calculate the starting position of the rows 
			$start = $limit*$page - $limit;
			$start = ($start <0)?0:$start; // if for some reasons start position is negative set it to 0, typical case is that the user type 0 for the requested page 
			$responce->page = $page; 
			$responce->total = $total_pages; 
			$responce->records = $count;
			################ Extrameos los campos de filtro de la busqueda
			$fields = $query->list_fields();
			foreach($fields as $field){
				if(isset($_POST[$field]))
					$this->db->like($field, $_POST[$field]);
			}/*foreach*/
			############################################
			################ Segunda Query de la consulta, se usa para generar los registros
			$this->db->order_by("$sidx", "$sord");
			$this->db->limit($limit, $start);
			$query = $this->db->get_where("sefiz_nivel", array("visible" => 1) );
			$i = 0;			
			foreach ($query->result() as $row){	
				$responce->rows[$i]['id'] = $row->cod_nivel;			
				$responce->rows[$i]["cell"] = array($row->titulo_nivel, (int)$row->orden, $row->fecha_creacion, $row->fecha_modificacion);
				$i++;
			}/*foreach*/		
			echo json_encode($responce);
		}/*function jqgrid_gestion_niveles*/
		
		
		public function jqgrid_gestion_temas($cod_nivel){
			/*$this->load->model("model_general");
			if($this->model_general->permiso_usuario("9901") == false){
				return;
			}/*if*/
			############################################
			################ Parametros de la grilla
			$page = $_POST['page'];
			$limit = $_POST['rows'];
			$sidx = (!$_POST['sidx'])?1:$_POST['sidx']; //if we not pass at first time index use the first column for the index or what you want
			$sord = $_POST['sord'];
			############################################
			################ Primera Query de la consulta, se usa para calcular el numero de registros			
			$query = $this->db->get_where("sefiz_tema", array("visible" => 1, "cod_nivel" => $cod_nivel) );
			################ Numero Total de Registros
			$count = $query->num_rows();		
			################ Calculamos el total de paginas de la consulta
			$total_pages = ($count > 0 && $limit > 0)?ceil($count/$limit):0;
			################ if for some reasons the requested page is greater than the total, set the requested page to total page 
			$page = ($page > $total_pages)?$total_pages:$page;
			################ calculate the starting position of the rows 
			$start = $limit*$page - $limit;
			$start = ($start <0)?0:$start; // if for some reasons start position is negative set it to 0, typical case is that the user type 0 for the requested page 
			$responce->page = $page; 
			$responce->total = $total_pages; 
			$responce->records = $count;
			################ Extrameos los campos de filtro de la busqueda
			$fields = $query->list_fields();
			foreach($fields as $field){
				if(isset($_POST[$field]))
					$this->db->like($field, $_POST[$field]);
			}/*foreach*/
			############################################
			################ Segunda Query de la consulta, se usa para generar los registros
			$this->db->order_by("$sidx", "$sord");
			$this->db->limit($limit, $start);
			$query = $this->db->get_where("sefiz_tema", array("visible" => 1, "cod_nivel" => $cod_nivel) );
			$i = 0;			
			foreach ($query->result() as $row){	
				$responce->rows[$i]['id'] = $row->cod_tema;			
				$responce->rows[$i]["cell"] = array($row->titulo_tema, (int)$row->orden, $row->fecha_creacion, $row->fecha_modificacion);
				$i++;
			}/*foreach*/		
			echo json_encode($responce);
		}/*function jqgrid_gestion_niveles*/
		
		
		public function jqgrid_gestion_niveles_edit(){
			/*$this->load->model("model_general");
			if($this->model_general->permiso_usuario("9901") == false){
				echo json_encode(array(0 => false, 1 => "No tiene permisos para GESTIÓN DE NIVELES"));
				return;
			}/*if*/
			$cod_nivel = $_POST["id"];
			$this->db->where(array("cod_nivel" => $cod_nivel) )->update("sefiz_nivel", array("visible" => 0) );
			echo json_encode(array(0 => true, 1 => "Cambio realizado exitosamente"));
		}/*function jqgrid_gestion_niveles_edit()*/
		
		
		public function jqgrid_gestion_temas_edit(){
			/*$this->load->model("model_general");
			if($this->model_general->permiso_usuario("9901") == false){
				echo json_encode(array(0 => false, 1 => "No tiene permisos para GESTIÓN DE NIVELES"));
				return;
			}/*if*/
			$cod_nivel = $_POST["id"];
			$this->db->where(array("cod_tema" => $cod_nivel) )->update("sefiz_tema", array("visible" => 0) );
			echo json_encode(array(0 => true, 1 => "Cambio realizado exitosamente"));
		}/*function jqgrid_gestion_niveles_edit()*/
		
		
		public function jqgrid_niveles_preguntas($cod_nivel = ""){
			if($cod_nivel == "")
				return false;
			if($this->model_librerias->permiso_usuario("sefiz") == false){
				return false;
			}/*if*/
			############################################
			################ Parametros de la grilla
			$page = $_POST['page'];
			$limit = $_POST['rows'];
			$sidx = (!$_POST['sidx'])?1:$_POST['sidx']; //if we not pass at first time index use the first column for the index or what you want
			$sord = $_POST['sord'];
			############################################
			################ Primera Query de la consulta, se usa para calcular el numero de registros			
			$query = $this->db->get_where("sefiz_nivel_pregunta", array("visible" => 1, "cod_nivel" => $cod_nivel) );
			################ Numero Total de Registros
			$count = $query->num_rows();		
			################ Calculamos el total de paginas de la consulta
			$total_pages = ($count > 0 && $limit > 0)?ceil($count/$limit):0;
			################ if for some reasons the requested page is greater than the total, set the requested page to total page 
			$page = ($page > $total_pages)?$total_pages:$page;
			################ calculate the starting position of the rows 
			$start = $limit*$page - $limit;
			$start = ($start <0)?0:$start; // if for some reasons start position is negative set it to 0, typical case is that the user type 0 for the requested page 
			$responce->page = $page; 
			$responce->total = $total_pages; 
			$responce->records = $count;
			################ Extrameos los campos de filtro de la busqueda
			$fields = $query->list_fields();
			foreach($fields as $field){
				if(isset($_POST[$field]))
					$this->db->like($field, $_POST[$field]);
			}/*foreach*/
			############################################
			################ Segunda Query de la consulta, se usa para generar los registros
			$this->db->order_by("$sidx", "$sord");
			$this->db->limit($limit, $start);
			$query = $this->db->get_where("sefiz_nivel_pregunta", array("visible" => 1, "cod_nivel" => $cod_nivel) );
			$i = 0;			
			foreach ($query->result() as $row){	
				#### Validamos que sea una subopcion
					$responce->rows[$i]['id'] = $row->cod_pregunta;			
					$responce->rows[$i]["cell"] = array($row->desc_pregunta);
					$i++;
			}/*foreach*/		
			echo json_encode($responce);
		}/*function jqgrid_niveles_preguntas*/
		
		
		public function jqgrid_niveles_preguntas_edit($cod_nivel = ""){
			if($cod_nivel == "")
				return false;
			if($this->model_librerias->permiso_usuario("sefiz") == false){
				return false;
			}/*if*/
			$cod_pregunta = $_POST["id"];
			$oper = $_POST["oper"];
			switch($oper){
				case "add":
					$this->db->insert("sefiz_nivel_pregunta", array("desc_pregunta" => $_POST["desc_pregunta"], "cod_nivel" => $cod_nivel, "visible" => 1) );
				break;
				case "edit":
					$this->db->where(array("cod_pregunta" => $cod_pregunta) )->update("sefiz_nivel_pregunta", array("desc_pregunta" => $_POST["desc_pregunta"]) );
				break;
				case "del":
					$this->db->where(array("cod_pregunta" => $cod_pregunta) )->update("sefiz_nivel_pregunta", array("visible" => 0) );
				break;
			}/*siwtch*/
			echo json_encode(array(0 => true, 1 => "Cambio realizado exitosamente"));	
		}/*function jqgrid_niveles_preguntas_edit*/
		
		
		public function jqgrid_sefiz_respuestas($cod_pregunta){
			if($cod_pregunta == "")
				return false;
			if($this->model_librerias->permiso_usuario("sefiz") == false){
				return false;
			}/*if*/
			############################################
			################ Parametros de la grilla
			$page = $_POST['page'];
			$limit = $_POST['rows'];
			$sidx = (!$_POST['sidx'])?1:$_POST['sidx']; //if we not pass at first time index use the first column for the index or what you want
			$sord = $_POST['sord'];
			############################################
			################ Primera Query de la consulta, se usa para calcular el numero de registros			
			$query = $this->db->get_where("sefiz_nivel_respuesta", array("visible" => 1, "cod_pregunta" => $cod_pregunta) );
			################ Numero Total de Registros
			$count = $query->num_rows();		
			################ Calculamos el total de paginas de la consulta
			$total_pages = ($count > 0 && $limit > 0)?ceil($count/$limit):0;
			################ if for some reasons the requested page is greater than the total, set the requested page to total page 
			$page = ($page > $total_pages)?$total_pages:$page;
			################ calculate the starting position of the rows 
			$start = $limit*$page - $limit;
			$start = ($start <0)?0:$start; // if for some reasons start position is negative set it to 0, typical case is that the user type 0 for the requested page 
			$responce->page = $page; 
			$responce->total = $total_pages; 
			$responce->records = $count;
			################ Extrameos los campos de filtro de la busqueda
			$fields = $query->list_fields();
			foreach($fields as $field){
				if(isset($_POST[$field]))
					$this->db->like($field, $_POST[$field]);
			}/*foreach*/
			############################################
			################ Segunda Query de la consulta, se usa para generar los registros
			$this->db->order_by("$sidx", "$sord");
			$this->db->limit($limit, $start);
			$query = $this->db->get_where("sefiz_nivel_respuesta", array("visible" => 1, "cod_pregunta" => $cod_pregunta) );
			$i = 0;			
			foreach ($query->result() as $row){	
				#### Validamos que sea una subopcion
					$responce->rows[$i]['id'] = $row->cod_respuesta;			
					$responce->rows[$i]["cell"] = array($row->descripcion, $row->es_correcta);
					$i++;
			}/*foreach*/		
			echo json_encode($responce);
		}/*function jqgrid_sefiz_respuestas*/
		
		
		public function jqgrid_sefiz_respuestas_edit($cod_pregunta){
			#Valido el tipo de operacion
			$oper = $_POST["oper"];
			#Recibo los parametros
			if($oper != "del"){
				$data = array(	"descripcion" 	=> $_POST["descripcion"], 
								"es_correcta" 	=> $_POST["es_correcta"],
								"cod_pregunta" 	=> $cod_pregunta
								);
			}//if
			switch($oper){
				case "add": // ADICIONA REGISTRO
					$data["visible"] = 1;
					$this->db->insert("sefiz_nivel_respuesta", $data);
				break;
				case "edit": // EDITA EL REGISTRO
					$llave = $_POST["id"];
					$this->db->where(array("cod_respuesta" => $llave) )->update("sefiz_nivel_respuesta", $data);
				break;
				case "del": // ELIMINA EL REGISTRO
					$llave = $_POST["id"];
					$this->db->where(array("cod_respuesta" => $llave) )->update("sefiz_nivel_respuesta", array("visible" => 0) );
				break;
			}//switch
			echo $this->db->last_query();
			echo json_encode(array("0" => true) );
		}/*function jqgrid_sefiz_respuestas_edit*/
		
		
		
		function nivel($cod_nivel = "", $cod_tema = 1){
			$cod_usuario = $this->session->userdata("idUsuario");
			$data_body = array();
			
			$data_header["title"] = "Escuela SEFIZ";;
			//$this->load->view('wlcm_header_view', $data_header);
			#Valido que el nivel ingresado exista
			$query_nivel = $this->db->get_where("sefiz_nivel", array("cod_nivel" => $cod_nivel, "visible" => 1) );
			if($query_nivel->num_rows() == 0)
				redirect("sefiz");
			#Valido que el tema ingresado exista
			$query_tema = $this->db->get_where("sefiz_tema", array("cod_nivel" => $cod_nivel, "orden" => $cod_tema, "visible" => 1) );
			if($query_tema->num_rows() == 0){
				$query_tema = $this->db->limit(1)->order_by("orden ASC")->get_where("sefiz_tema", array("cod_nivel" => $cod_nivel, "visible" => 1) );
				redirect("sefiz/nivel/".$cod_nivel."/".$query_tema->row()->orden);
			}//IF
			#Cargamos la vista completa
			$data = array(  "cod_nivel"	  	=> $cod_nivel,
							"data_nivel"	=> $this->model_sefiz->cargar_nivel($cod_nivel),
							"cod_tema"		=> $cod_tema,
							"data_tema"		=> $this->model_sefiz->cargar_tema($cod_nivel, $cod_tema),
							"data_tercero"	=> $this->m_miperfil->obtener_Datos_Usuario(),
							"data_examen"	=> $this->model_sefiz->consultar_examen_usuario($cod_nivel,$cod_usuario),
							"orden_tema"	=> $query_tema->row()->orden,
							"temas_nivel"	=> $this->model_sefiz->consultar_temas($cod_nivel),
							"comentarios"	=> $this->model_sefiz->comentarios_nivel($cod_nivel, $cod_tema)
							);
			$this->load->view("sefiz/temas_nivel_view", $data);
			//$this->load->view("wlcm_footer_view");
		}/*function nivel*/
		
			
	
}/*class sefiz*/