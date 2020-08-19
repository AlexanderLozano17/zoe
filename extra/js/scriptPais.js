$(document).ready(function(){  

    var url = $("#url").val();	

   /*------------------------------------------
	* Cargar los departamentos por pais
	------------------------------------------*/	
	$("#selPais").change(function(){

		var codPais = this.value;        

		$.ajax({
			type:"POST",
			url: "mi_perfil/cargar_Departamentos",
			data:{codPais:codPais},
			dataType:"json",
			beforeSend:function(){
				$("#selDepartamento option:gt(0)").remove();
				$("#selMunicipio option:gt(0)").remove();
			},
			success:function(departamentos){
				
				var lista="";

				$.each(departamentos,function(i){
					lista+="<option value="+departamentos[i].cod_departamento+">"+departamentos[i].nom_departamento+"</option>";
				});
				
				$("#selDepartamento").append(lista);
			}

		});//ajax
	});


    /*------------------------------------------
	 * Cargar los municipios por Departamentos
	 ------------------------------------------*/	
	$("#selDepartamento").on("change",function(){
		
		var idDPto = this.value;

		$.ajax({
			type:"POST",
			url: "mi_perfil/cargar_Municipios",
			data:{idDPto:idDPto},
			dataType:"json",
			beforeSend:function(){
				$("#selMunicipio option:gt(0)").remove();
			},
			success:function(municipios){
				
				var listaMunicipios="";

				$.each(municipios,function(i){
					listaMunicipios+="<option value="+municipios[i].cod_municipio_compuesto_2+">"+municipios[i].nom_municipio+"</option>";
				});
				
				$("#selMunicipio").append(listaMunicipios);
			}

		});//ajax
	});


});