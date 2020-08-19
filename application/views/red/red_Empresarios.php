<!--RED DEL USUARIO-->
<div  class="contedorlist">
    <div class="panel panel-default">
        <div class="panel-body"><br/><br/>

        <!--Mensaje desde el servidor-->
	        <div class="row">
	        	<div class="col-md-4"></div>
	        	<div class="col-md-4" id="msjServ">
	        		<p><img class="imgX img-circle" src=""></p>
	        	</div>	        	
	        	<div class="col-md-4"></div>
	        </div>

        <!--Avatar del usuario-->    
            <div class="row">
	            <div class="text-center">
		            <section>
			            <figure>
			                <a href="<?php echo base_url();?>index.php/mi_red">
			                  <img  id="imgop" class="selecting img-circle img-thumbnail" 
			                  src="<?php echo base_url().$this->session->userdata('avatar');?>" title="Avatar" />
			                  </a>
			            </figure> 
		            </section>                                   
	              </div>                                
	        </div>
	        
	        <!--Nombre del Usuario-->
            <div class="row">
               <div class="text-center">
               	   <label style="font-size:20px"><span class="label label-default" title="Usuario"><?php echo $red['Usuario']->nombres." ".$red['Usuario']->apellidos ?></span></label>

               	     <!--Id del Usuario-->
                    <div class="row"><a id="<?php echo $red['Usuario']->idpersona?>" href="<?php echo base_url('index.php/mi_perfil')?>" class="label label-primary" title="Ver detalles">Id. <?php echo $red['Usuario']->idpersona?></a>
                    </div>
               </div>         	
            </div>               
              <br/>

            <!--VALIDACION SI TIENE O NO RED DE EMPRESARIOS-->
            <?php if($red['listEmpresarios'] == "N" || $red['listEmpresarios'] == "n" || $red['listEmpresarios'] ==""):?>
            	<div class='col-md-6 col-md-push-3 alert alert-info'>
                    <p class="col-md-6 col-md-push-3"><img style="height:40px;" src="<?php echo base_url()?>extra/css/img/user_info.png">NO TIENES RED ASIGNADA</p>
                </div>                
        
            <?php else:?>

	            <div>         
				 	<div>
				     	<?php 
				    	if($red['Nprospectos'] > 0){
				    	    foreach($red['Nprospectos'] as $cantidad)
				    	    	echo "<label style='font-size:11px' class='label label-default'>Total personas: <span class='text-danger'>".$cantidad->Personasred."</span></label>";
				        }?>
				    </div>

					<div class="slider1 respon-img-empresario">					
					
                                                                      
                        <!--Slide de Empresarios-->
				        <?php foreach ($red['listEmpresarios'] as $red['listEmpresarios']) {

					        echo "<div class='slide' style='height:230px'>";				
					        	echo "<div class='fi1' style='margin-top:20px; margin-left:45px'>";		
					        	    echo "<a href='#' id='".$red['listEmpresarios']->idpersona."' class='linkusuario1'>";
							        	echo "<img style='height:150px;width:150px' class='selecting img img-circle img-thumbnail' src='".base_url()."extra/img/usuarios/".$red['listEmpresarios']->avatar."'>";
							        echo"</a>";
						        	                                    
	                                echo "<div style='margin-top:10px' class='row'>";
	                                	echo "<label style='font-size:12px' class='label label-default' title='Aprendiz'>".$red['listEmpresarios']->nombres." ".$red['listEmpresarios']->apellidos."</label>";
							        echo "</div>";
							        echo "<div class='row col-xs-offset-3'>";
										echo "<a class='linkusuario text text-center label label-primary data-target='#mdlDetallEmpre' href='#mdlDetallEmpre/".$red['listEmpresarios']->idpersona."' title='Ver detalles' value='".$red['listEmpresarios']->idpersona."'> Id. ".$red['listEmpresarios']->idpersona;
										echo "</a>";
									echo "</div>";
                                echo "</div>";
                            echo "</div>";
				        
				        }
				        ?>														        
				          						       			      						  
					</div>

                    <!--Carrusel de hijos de los hijos-->  
					<div id="carrusel-hijos">
						
					</div>

				</div>

			<?php endif;?>

        </div>
    </div>
</div>


<!--MDOAL INFORMACION DEL USUARIO-->
<div class="modal fade" aria-labelledby="mdlDetallEmpre" id="mdlDetallEmpre" tabindex="-1" role="dialog" aria-hidden="false">
	<div class="modal-dialog">
		<!--MDOAL CONTENIDO-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="titulo-modal">Información Detallada Id. <span class="spnIdempresario text-success"></span></h4>
			</div>
			<!-- CUERPO DEL MODAL -->
			<div class="modal-body">
				<!--Menu del modal-->
				<ul class="nav nav-tabs nav-justified">
				  <li class="active"><a href="#tabPersona" data-toggle="tab"><img style="height:30px;" src="<?php echo base_url('extra/css/img/personal.png');?>"/> Personal</a></li>			  
				  <li><a href="#tabActividades" data-toggle="tab"><img style="height:30px;" src="<?php echo base_url('extra/css/img/actividad.png');?>"/> Actividades</a></li>
				  <li><a href="#tabObservaciones" data-toggle="tab"><img class="img-circle" style="height:30px;" src="<?php echo base_url('extra/css/img/icon_observation.png');?>"/> Observaciones</a></li>
				</ul>

				<!--/*TABS CONTENT*/-->
				<div id="divTabContent" class="tab-content">
                    <!--TABPERSONAL-->
					<section class="tab-pane fade active in" id="tabPersona">
					<br/><br/>
						<div class="row">
						    <!--Tipo documento-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Tipo Documento<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnTipD"></span></p>
							</div>
							<!--Identificacion-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Identificacion<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnIdn"></span></p>
							</div>
						</div>
                        <div class="row">
                            <!--Estado civil-->
                        	<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Estado Civil<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnEstadoCivil"></span></p>
							</div>
							<!--Fecha nacimiento-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Fecha Nacimiento<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnFecNac"></span></p>
							</div>
                        </div>
                        <div class="row">
                            <!--Nombres-->
                        	<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Nombres<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnNombres"></span></p>
							</div>
							<!--Apellidos-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Apellidos<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnApellidos"></span></p>
							</div>
                        </div>
                        <div class="row">
                            <!--Genero-->
                        	<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Género<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnSexo"></span></p>
							</div>
							<!--Email-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Email<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnEmail"></span></p>
							</div>
                        </div>
                        <div class="row">
                            <!--Pais-->
                        	<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Pais<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnPais"></span></p>
							</div>
							<!--Departamento-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Departamento<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnDpto"></span></p>
							</div>
                        </div>
                        <div class="row">
                            <!--Ciudad-->
                        	<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Ciudad<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnCiudad"></span></p>
							</div>
							<!--Barrio-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Barrio<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnBarrio"></span></p>
							</div>
                        </div>
                        <div class="row">
                            <!--Direccion-->
                        	<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Direccion<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnDireccion"></span></p>
							</div>
							<!--Telefono-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Telefono<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnTelefono"></span></p>
							</div>
						</div>
						<div class="row">
						    <!--Celular-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Celular<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnCelular"></span></p>
							</div>
							<!--Estado-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Estado<span class="text-warning"> :</span>
								<span class="spnPersonas" style="font-style:italic;" id="spnEstado"></span></b></p>
							</div>
						</div>
						<div class="row">
						    <!--Profesion-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Profesión<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnProfesion"></span></p>
							</div>
							<!--Tipo persona-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Tipo persona<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spntipoPerson"></span></p>
							</div>
						</div>
						<div class="row">
						    <!--Fecha registro-->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<p><b>Fecha registro<span class="text-warning"> :</span></b>
								<span class="spnPersonas stylo_letra_modal" id="spnRegistro"></span></p>
							</div>
						</div>

					</section>
					<!--/TABPERSONAL-->

					<!--TABACTIVIDADES-->
					<section class="tab-pane fade active" id="tabActividades">

					</section>
					<!--/TABACTIVIDADES-->

					<!--TABOBSERVACIONES-->
					<section class="tab-pane fade active" id="tabObservaciones">
						
					</section>
					<!--/TABOBSERVACIONES-->

				</div>
				
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>


