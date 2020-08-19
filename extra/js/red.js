$(document).ready(function () {
    //Varible global para obtener la ruta principal URL
	var url = $("#url").val();

    //Ejecuto la funcion  
    slide_empresario();  
	datos_empresario();	
	//cargar_hijos_de_hijos()

});

/*----------------------------------------------
 * SLIDE
-----------------------------------------------*/
function slide_empresario(){
    $('.slider1').bxSlider({
    slideWidth: 280,
    minSlides: 1,
    maxSlides: 4,
    slideMargin: -20
  });

}



/*-------------------------------------------------------------------------------------
 *Funcion para Mostrar los datos del empresario que se encuentran en el slide al modal
--------------------------------------------------------------------------------------*/
function datos_empresario(){

	$(".linkusuario").click(function(){
        //Captura el Id del empresario
		var idempresario = $(this).attr("value");		
		//Parseamos lo 	Obtenido a un numero entero
		var id = parseInt(idempresario);

		$.ajax({
			type:"POST",
			url:"mi_red/buscar_empresario_datos",
			data:{id:id},
			dataType:"json",
			beforeSend:function(){
				//Limpiar
				$(".spnIdempresario").empty();
				//Decimos que los campos se ponga vacio
				$("#spnTipD").val("");      	$("#spnIdn").val("");
				$("#spnEstadoCivil").val("");	$("#spnFecNac").val("");
				$("#spnNombres").val("");		$("#spnApellidos").val("");
				$("#spnSexo").val("");  		$("#spnEmail").val("");
				$("#spnPais").val("");			$("#spnDpto").val("");
				$("#spnCiudad").val("");		$("#spnBarrio").val("");
				$("#spnDireccion").val("");		$("#spnTelefono").val("");
				$("#spnCelular").val("");		$("#spnEstado").val("");
				$("#spnProfesion").val("");		$("#spnEstado").removeClass("text-success");
				$("#spnEstado").removeClass("text-danger");

			},
			success:function(respuesta){
             
	            if(respuesta != "N" | respuesta != "n" | respuesta != "" | respuesta != "null"){            	

		         	//cargar id del empresario en red
					$(".spnIdempresario").html(respuesta.idpersona);

					//LLenamos los campos con los datos correspondientes a cada empresario
					$("#spnTipD").html(respuesta.documento);      	
					$("#spnIdn").html(respuesta.identificacion);
					$("#spnEstadoCivil").html(respuesta.estado_civil);	
					$("#spnFecNac").html(respuesta.fec_nac);
					$("#spnNombres").html(respuesta.nombres);		
					$("#spnApellidos").html(respuesta.apellidos);
					$("#spnSexo").html(respuesta.sexo);  		
					$("#spnEmail").html(respuesta.email);
					$("#spnPais").html(respuesta.descripcion);			
					$("#spnDpto").html();
					$("#spnCiudad").html(respuesta.nom_municipio);		
					$("#spnBarrio").html(respuesta.barrio);
					$("#spnDireccion").html(respuesta.direccion);		
					$("#spnTelefono").html(respuesta.telefono);
					$("#spnCelular").html(respuesta.celular);
                    //Segun el resultado devuelto por el controlador hacemos la siguiente condicion
					if(respuesta.estado === "Activo" ){
						$("#spnEstado").addClass("text-success");
						$("#spnEstado").html(respuesta.estado);
					}else{
						$("#spnEstado").addClass("text-danger");
						$("#spnEstado").html(respuesta.estado);
					}

					$("#spnProfesion").html(respuesta.oficio);
		            $("#spntipoPerson").html(respuesta.tipo_persona);
		            $("#spnRegistro").html(respuesta.fec_registro);	

		            //Abrir modal
  	    			$("#mdlDetallEmpre").modal("show");

	            }else{

	            	//Escondemos el modal
  	                $("#mdlDetallEmpre").modal("hide"); 

	            	
	            	$("#msjServ").addClass("alert alert-danger");
	            	$("#msjServ p").text("Error de consulta vuelvalo a intentar");
	            	//Despues de un tiempo guarddar el mensaje
	            	setTimeout(function() {
	        		$("#msjServ").fadeOut(1500);
	    			},3000);
	            }


			}
		});


	});

}

/*-----------------------------------------------------------------------------
Funcion para cargar en un nuevo slide con los descendientes de los empresarios
------------------------------------------------------------------------------*/
function cargar_hijos_de_hijos(){

	$(".linkusuario1").click(function(){
		var idhijo= $(this).attr("id");
		var idEm  = parseInt(idhijo);
		
		$.ajax({
			type:"POST",
			url:"mi_red/lista_red_descendiente",
			data:{idEm:idEm},
			dataType:"json",
			beforeSend:function(){
                $(".carrusel-hijos").empty();
			},
			success:function(respuesta){			
				
				var lista="";


				if(respuesta != "N"){
					$.each(respuesta, function(i,item){
					/*	lista ="<div class='slider2 respon-img-empresario'>" ;
							lista="<div class='slide' style='height:230px'>";
								lista="<div class='fi1' style='margin-top:20px; margin-left:45px'>";
									lista="<a href='#' id='".$red['listEmpresarios']->idperson"' class='linkusuario1'>";
										lista="<img style='height:150px;width:150px' class='selecting img img-circle img-thumbnail' src='".base_url()."extra/img/usuarios/".$red['listEmpresarios']->avatar."'>";
									lista="</a>";
									lista="<div style='margin-top:10px' class='row'>";
										lista="<label style='font-size:12px' class='label label-default' title='Aprendiz'>".$red['listEmpresarios']->nombres." ".$red['listEmpresarios']->apellidos."</label>";
									lista="</div>";
									lista="<div class='row col-xs-offset-3'>";
										lista="<a class='linkusuario text text-center label label-primary' data-target='#mdlDetallEmpre' href='#mdlDetallEmpre/".$red['listEmpresarios']->idpersona."' title='Ver detalles' value='".$red['listEmpresarios']->idpersona."'>Id. ".$red['listEmpresarios']->idpersona;
										lista="</a>";
									lista="</div>";
								lista="</div>";
							lista="</div>";
						lista ="</div>";*/
					})					
				}else{
					alert("Este empresario no tiene hijos");
				}

			}
		});


	});

}











/*------------------------------------------
 * Cargar los Empresario de la red destinada con ajax Pendiente
------------------------------------------*/

function mostrar_red_Empresarios(){

    $.ajax({
       type:"POST",
 	   url:$url+"/mi_red/red_Empresarios",     	      	  
 	   success:function(listEmpresarios){
 	   	    //variable donde guardare lo que deseo mostrar en un texto html
     	  	var html;
            //convierto el JSON recibido en un arreglo Objeto
            var $listEmpreObjeto = JSON.parse(listEmpresarios);            
             //recorro el arreglo $listEmpreObjeto 
           /* html = "<table class='table table-responsive table-bordered'>";
            html = "<thead>";
 			html +="<tr><th>#</th><th>Nombres</th><th>Apellidos</th><th>Telefono</th><th>Email</th></tr>";
			html +="</thead>";
			html ="<tbody>";   */  

            for(i in $listEmpreObjeto){
 
                html = ""+$listEmpreObjeto[i].nombres+"";
                       
                $("#listEmpresario").html(html);
            }            

 	    }

    });     
}

/*------------------------------------------
 * Cargar los prospectos de la red destinada con ajax Pendiente
 ------------------------------------------*/

function mostrar_red_Prospectos(){

	$.ajax({
		type:"POST",
		url:$url+"/mi_red/red_Prospectos",
		success:function(listProspectos){
			var html;

			var $listProspObjeto = JSON.parse(listProspectos);

			for(i in $listProspObjeto){

    			/*if($listProspObjeto[i] < 0) {
                    
                    html +="<div class='alert alert-info'>";
                    html = "<p class='text text-center'><i class='fa fa-info'></i> NO existen Clientes registrados</p>";
                    html = "</div>";

                    $("#mostrarpros").html(html);

    			}else{

    				html += "<tr>";
    				html = "<td class='text text-center'>"+$listProspObjeto[i].idpersona+"</td>";
    				html = "<td class='text text-center'>"+$listProspObjeto[i].nombres+"</td>";
    				html = "<td class='text text-center'>"+$listProspObjeto[i].apellidos+"</td>";
    				html = "<td class='text text-center'>"+$listProspObjeto[i].telefono+"_"+$listProspObjeto[i].celular+"</td>";
    				html = "<td class='text text-center'>"+$listProspObjeto[i].fec_registro+"</td>";
    				/*html = "<td class='text text-center'>";
    				html = "<form action='"+site_url('prospectos/editar_prospecto')+"' method='POST'>";                           
                    html = "<input name='Idprospecto' id='Idprospecto' type='hidden' value='"+$listProspObjeto[i].idpersona+"'>";
                    html = "<button type='submit' class='btn btn-3d btn-primary btn-xs' title='Editar'>";
                    html = "<i class='fa fa-edit'></i>";
                    html = "</button>"; 
                    html = "</form></td>";
    				html = "<td class='text text-center'></td>";
    				html = "</tr>";


    				$("#ImpriProspect").html(html);
    			}*/
			}
            
		}

	});
}

    






