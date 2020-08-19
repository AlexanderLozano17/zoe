$(document).ready(function (){

	var url = $("#url").val();	

  /*---------------------------
  * Link para abrir el modal
  ----------------------------*/
  $(".lnkIdProspecto").click(function(){

    //Limpiar    
  	$("#spnIdp").empty();
   	var idProspecto = $(this).text();

    //Cargar Id prospecto
  	$("#spnIdp").html(idProspecto);

    //Abrir modal
  	$("#mdlDetallProspecto").modal("show");  	 	

  });

    //Focus 1st Tab modal
	$('#mdlDetallProspecto').on('shown.bs.modal', function () {		
	   $('.nav-tabs li:first a').show();
	}); 



  /*---------------------------
  * Button para abrir el modal
  ----------------------------*/
  $("#btnSeguimietoPros").click(function(){

    //Limpiar    
   	$("#spnIdp").empty();
   	var idProspecto = $(this).text();

    //Cargar Id prospecto
   	$("#spnIdp").html(idProspecto);

    //Abrir modal
   	$("#mdlDetallProspecto").modal("show"); 

  });

  /*---------------------------------------------------
  * Abrir los formularios dinamicamente segun actividad
  -----------------------------------------------------*/
    //Limpiar el id
    $(".lkactividad").attr("id","");

    $(".linkactividad").click(function(){  
      //Obtnemos el Id del la actividad
      var nomActividad = $(this).attr("name");
      
      //Cargamos el Id del la actividad
      $(".lkactividad").attr("id",nomActividad);
      

    });


  /*---------------------------------------------------
  * Obtener el libro y habilitar el select nombreMaterial
  -----------------------------------------------------*/
  $('#selNomMaterial').attr('disabled','disabled');

  $("#selMaterial").change(function(){
    //obtengo el id del tipo material
  	var idMaterial = this.value;

    if(idMaterial == 0 || idMaterial == 4 ){	
      $('#selNomMaterial option[value="0"]').attr('selected', 'selected');
    	$('#selNomMaterial').attr('disabled','disabled');
  	            
  	}else{
  		$.ajax({
  	     	type:"POST",
  	   		url: url+"prospectos/nombres_Materiales",
  				data:{idMaterial:idMaterial},
  				dataType:"json",
  				beforeSend:function(){
  					$("#selNomMaterial option:gt(0)").remove()					
  				},
  				success:function(nomMaterial){
  				  //habilito el select
  				  $("#selNomMaterial").removeAttr("disabled");

  			    $(nomMaterial).each(function(i,nomM){
  				 	  $("#selNomMaterial").append("<option value="+nomM.idcontrol_material+">"+nomM.descripcion+"</option>");					   
  				 	});
  		    }
              
      });
  	}
  
	});


	/*----------------------------------------------------
  * Cargar los datos del control de materiales a la tabla
  ------------------------------------------------------*/
  $("#msj").hide();
  var msj;
  var cont = 0;

  $("#btnAdicionarTema").click(function(){

   	//obtengo id y texto de los valores seleccionados        
    var idMaterial    = $("#selMaterial").val();
    var txtMaterial   = $("#selMaterial option:selected").html();
    var idNomMaterial = $("#selNomMaterial").val();
    var txtNomMaterial= $("#selNomMaterial option:selected").html();

    //guardo los datos anteriores en un array
    var materiales = [idMaterial,
	      				     txtMaterial,
				      	     idNomMaterial,
					           txtNomMaterial 
		];   

    if(idMaterial == 0 || idMaterial == 4){

      msj ="Seleccionar un Tipo de Material";
      $("#msj").html(msj);
      $("#msj").addClass("alert-danger");
      $("#msj").show();
      setTimeout(function() {
        		$("#msj").fadeOut(1500);
    	},3000);			

    }else if(idNomMaterial == 0){

      msj ="Seleccionar el Nombre del material";
      $("#msj").html(msj);
      $("#msj").addClass("alert-danger");
      $("#msj").show();
      setTimeout(function() {
     		$("#msj").fadeOut(1500);
    	},3000);

    }else{
	    //creo una fila
      cont++;
	    var fila = '<tr class="seleccion" id="fila'+cont+'" name="fila'+cont+'">'+
	               '<td class="text text-center"><input type="hidden" class="form-control" type="hidden" value="'+materiales[0]+'"/>'+materiales[1]+'</td>'+
	               '<td class="text text-left"><input type="hidden" class="form-control" value="'+materiales[2]+'"/>'+materiales[3]+'</td>'+
	               '<td class="text text-center"><input type="date" class="form-control" id="fecha_material" /></td>'+
	               '<td class="text text-center"><button type="button" id="buton_eliminar'+cont+'" name="buton_eliminar'+cont+'" class="elimi btn btn-xs btn-3d btn-danger glyphicon glyphicon-trash" title="Editar"></button>'+
                 '</tr>';
      //Adiciono la fila ala tabla con los datos seleccionados
	    $("#cuerpotable").append(fila);

    }
    eliminar_fila();
    
  });
   
  limpiar();

  validar_form_prospecto();
    
});

/*--------------------------------------------------------
 * funcion para eliminar una fila seleccionada en la tabla
--------------------------------------------------------*/
   function eliminar_fila(){

    $(".elimi").on("click", function(){
      $(this).parents("tr").remove();   
    });

  }

/*----------------------------------------------------
* Limpiar todo el formulario de actividades
------------------------------------------------------*/
  function limpiar(){
    $("#btn-reset-form").click(function(){
      $("#cuerpotable > tr").remove();
    });
    
  }


/*----------------------------------------------------
* Recibir datos del fomulario prospecto
------------------------------------------------------*/
function validar_form_prospecto(){

  $("#btn-enviar").click(function(){

    var fecha   = $("#txtFec").val();
    var jornada = $(" input[name='radJornada']:radio").is(':checked');
    var tema    = $("#txtTema").val();
    var presento= $("input:checkbox[name=checkPresento]:checked").val();
    var llamo   = $("input:checkbox[name=checkLlamada]:checked").val();
    var visito  = $("input:checkbox[name=checkVisita]:checked").val();
    var aprobado= $("input:checkbox[name=chkAprueba]:checked").val();

    alert(fecha,"",jornada,"",tema,"",presento,"",llamo,"",visito,"",aprobado);


  });

  
}
