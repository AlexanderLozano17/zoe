<!--LISTADO DE PROSPECTOS-->
<div class="contedorlist">
    <div class="panel panel-default ">       
        <div class="panel-body">  

            <!--BUTTON DE ENLACE PARA INGRESAR NUEVO PROSPECTO-->
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-4"></div>  
                <div class="col-md-4 col-sm-4 col-xs-4">         
                    <a  href="<?php echo site_url('prospectos/registro'); ?>"><button style="color: #fff;" type="button" class="btn btn-sm btn-3d btn-primary"><i class="fa fa-plus"></i> Agregar prospecto</button></a> 
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4"></div>
            </div><br/>
            
           <div class="table table-responsive">
                <table id="listadoprospectos" class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text text-center" title="Seguimiento">Id. Seguimiento</th>           
                            <th class="text text-center" title="Nombre">Nombre</th>
                            <th class="text text-center" title="Apellido">Apellido</th>
                            <th class="text text-center" title="Contacto">Contacto</th>         
                            <th class="text text-center" title="Email">Email</th>
                            <th class="text text-center" title="Fecha de registro">Fech. Registro</th>
                            <th class="text text-center" title="Fecha de registro">Estado</th>
                            <th class="text text-center" title="Accion">Accion</th>                            
                        </tr>
                    </thead>
                    <tbody>
                    <div id="ImpriProspect"></div>
                    <?php

                    if (count($datosm_red['listMiRed']) == 0):

                            echo "</tbody>";
                        echo "</table>";
                        echo "<div class='row'>";
                            echo "<div class='col-md-3 col-sm-3 col-xs-3'></div>";
                            echo"<div class='col-md-6 col-sm-6 col-xs-6 alert alert-info'>";                      
                                echo"<p class='text text-center'><img style='height:40px;' src='". base_url('extra/css/img/user_info.png')."'> NO TIENE REGISTRO DE PROSPECTOS INGRESADO</p>";  
                            echo"</div>";
                            echo "<div class='col-md-3 col-sm-3 col-xs-3'></div>";
                        echo"</div>";

                    else:

                        foreach ($datosm_red['listMiRed'] as $prospecto):

                            echo "<tr>";
                            //Button para hacer seguimiento a un prospecto 
                            echo "<td class='text-center'>" .
                            "<a style='width:1em' class='lnkIdProspecto btn btn-xs btn-3d alert-warning ' data-target='#mdlDetallProspecto' href='#mdlDetallProspecto'>" . $prospecto->idhijo . "</a></td>".
                            "</a>";
                            echo "<td>" . $prospecto->nombres . "</td>";
                            echo "<td>" . $prospecto->apellidos . "</td>";                            
                            echo "<td>" . $prospecto->telefono . "  -  " . $prospecto->celular . "</td>";
                            echo "<td>" . $prospecto->email . "</td>";
                            echo "<td>" . $prospecto->fec_registro . "</td>";

                            $estado      = ($prospecto->estado == 'P' ? 'Pendiente' : 'Aplazado' );

                            $claseEstado = ($prospecto->estado == 'P' ? '' : 'text-danger' );

                            echo "<td class='".$claseEstado."'><strong>" .$estado. "</strong></td>";  
                            //Button para editar un prospecto                        
                            echo "<td class='text-center'>" .
                            "<form action='" . site_url('prospectos/editar_prospecto') . "' method='POST'>" .                            
                            "<input name='Idprospecto' id='Idprospecto' type='hidden' value='" . $prospecto->idhijo . "'>" .
                            "<button type='submit' class='btn btn-3d btn-primary btn-xs' title='Editar'>" .
                            "<i class='glyphicon glyphicon-edit'></i>" .
                            "</button>" .
                            "</form>" .
                            "</td>";                            
                            echo "</tr>";

                        endforeach;

                    endif;?>

                    
                    </tbody>
                </table>    
            </div>
        </div>
    </div>
</div>



<!-- MODAL DETALLE DE PROSPECTO-->
<div class="modal fade" aria-labelledby="mdlDetallProspecto" id="mdlDetallProspecto" tabindex="-1" role="dialog" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="titulo-modal">Información Detallada Id. <span class="spnPersonas text-success" id="spnIdp"></span></h4>
            </div>
                <!-- CUERPO DEL MODAL --> 
                <div class="modal-body">
                    <ul class="nav nav-tabs nav-justified">                                    
                      <li  class="active"><a data-toggle="tab" href="#tabActividades"><img style="height:30px;" src="<?php echo base_url('extra/css/img/actividad.png');?>"/> Actividades</a></li>
                      <li><a data-toggle="tab" href="#tabObservaciones"><img class="img-circle" style="height:30px;" src="<?php echo base_url('extra/css/img/icon_observation.png');?>"/> Observaciones</a></li>
                      <li><a data-toggle="tab" href="#tabPago"><img style="height:30px;" src="<?php echo base_url('extra/css/img/pagos.png');?>"/> Pago</a></li>
                    </ul>
                    <br/>                  
                   

                    <!--/*TABS CONTENT*/-->
                    <div id="divTabContent" class="tab-content">                    

                        <!-- ACTIVIDADES -->
                        <section class="tab-pane fade active in" id="tabActividades">
                            <div class="row">
                                <?php

                                if($datosm_red['actividadesPR'] == "N"): ?>



                                    <div class="col-md-9 col-md-offset-1 alert alert-info">
                                    <p><i class="fa fa-info-circle"></i> NO SE ENCONTRARON ACTIVIDADES PARA ESTE PROSPECTO</p>
                                    </div>   

                                   
                                <?php else: ?> 

                                     <!--TABLA DE ACTIVIDADES PROSPECTO-->
                                         
                                    <?php foreach ($datosm_red['actividadesPR'] as $actividad):?>                                         
                                        <div class="col-sm-3">
                                            <div class="col-sm-3">                                                                                          
                                            <a data-toggle="tab" class="nav nav-tabs" href="#<?php echo $actividad->nom_actividad ?>">
                                             <img name="<?php echo $actividad->nom_actividad?>" style="height:65px; weigth:65px" class="linkactividad img img-circle" src="<?php echo base_url().$actividad->icono?>"  title="<?php echo $actividad->nom_actividad?>"/><?php echo $actividad->nom_actividad ?>
                                            </a>
                                                                                               
                                            </div>
                                        </div>                                           

                                    <?php endforeach ; ?>
                                <?php endif; ?>

                            </div>
                        </section>

                        <!--Formulario de prospeccion-->  
                        <section class="lkactividad tab-pane fade" id="">
                            <div>
                                <br/>
                                <hr>
                               <!--mensaje enviado dedes prospectos.js-->
                               <div id="msj" class="text text-center alert"><p></p></div>
                                                 
                               <form class="form-horizontal" role="form">
                                    <!--Fecha-->
                                    <div class="form-group">                                    
                                        <label  class="col-sm-2 control-label" for="txtFec"><b>Fecha </b><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></label>                
                                        <div class="col-sm-3">
                                           <input type="txt" class="form-control" id="txtFec" name="txtFec" value="<?php echo date('Y-m-d');?>" disabled />
                                        </div>
                                    </div>

                                    <!--Jornada-->
                                    <div class="form-group">                                    
                                        <label class="col-sm-2 control-label" for="radMañana" ><b>Jornada </b><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup>
                                        </label>                                       
                                        <div class="col-sm-6">
                                            <input type="radio" name="radJornada" id="radMañana" value="M" /> Mañana
                                            <input type="radio" name="radJornada" id="radTarde" value="T"/> Tarde
                                            <input type="radio" name="radJornada" id="radNoche" value="N"/> Noche
                                        </div>
                                    </div>

                                    <!--Control Tema-->
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="selTema" ><b>Temas </b><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup>
                                        </label>
                                        <div class="col-sm-6">      
                                            <select class="form-control" name="selTema" id="selTema">
                                                <option value="">::Seleccione Tema::</option>
                                               <?php

                                                foreach ($datosm_red['temas'] as $tema ){
                                                    echo "<option value='".$tema->idtema_perfil."'>".$tema->tema."</option>";
                                                }

                                                ?>
                                            </select>
                                        </div>                                                           
                                    </div>

                                    <!--Control Material-->
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="selMaterial" ><b>Material </b><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup>
                                        </label>
                                        <div class="col-sm-4">      
                                            <select class="form-control" name="selMaterial" id="selMaterial">
                                                <option value="0">::Selec Material::</option>
                                               <?php
                                                var_dump($datosm_red['material']);
                                                foreach ($datosm_red['material'] as $material ){
                                                    echo "<option value='".$material->idmaterial."'>".$material->nom_material."</option>";
                                                }

                                                ?>
                                            </select>
                                        </div> 
                                    </div>

                                        <!--Nombre Material-->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="selTema" ><b>Nombre Material</b><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup>
                                        </label>
                                        <div class="col-sm-6">      
                                            <select class="form-control" name="selNomMaterial" id="selNomMaterial">
                                                <option value="0">Seleccione nombre del material</option>
                                            </select>
                                        </div>
                                        <!--Btn adicionar-->
                                        <div class="col-sm-2">      
                                            <button class="btn btn-xs btn-3d btn-success glyphicon glyphicon-plus" type="button" name="btnAdicionarTema" id="btnAdicionarTema" title="Adicionar">
                                            </button>
                                        </div>
                                                                                               
                                    </div>                                

                                    <!--Tabla de control de materiales-->
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <table id="tablaMateriales"z class="table table-hover table-bordered table-responsive">
                                                <thead>
                                                    <th class="text text-center success col-sm-2">Material</th>
                                                    <th class="text text-center success col-sm-5">Titulo</th>
                                                    <th class="text text-center success col-sm-3">Fec. Entrega</th>
                                                    <th class="text text-center success col-sm-2">Accion</th>
                                                </thead>
                                                <tbody id="cuerpotable">
                                                                                                 
                                                </tbody>
                                            </table>
                                        </div>                                    
                                    </div>

                                    <!--Seguimiento-->
                                    <div class="form-group">                                    
                                        <label class="col-sm-2 control-label" for="Rastreo" ><b>Rastreo </b><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup>
                                        </label>                                       
                                        <div class="col-sm-6">
                                            <input type="checkbox" name="checkPresento" id="checkPresento"/> Presento
                                            <input type="checkbox" name="checkLlamada" id="checkLlamada"/> Llamo
                                            <input type="checkbox" name="checkVisita" id="checkVisita"/> Visito
                                        </div>
                                    </div>

                                    <!--Aprobacion-->
                                    <div class="form-group">                                    
                                        <label class="col-sm-2 control-label" for="Aprueba"><b>Aprueba</b><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup>
                                        </label>                                       
                                        <div class="col-sm-6">
                                            <input type="checkbox" name="chkAprueba" id="chkAprueba" value="S" /> Si
                                        </div>
                                    </div>

                                    <!--Botones-->
                                    <div class="form-group">
                                        <div class="text-center">
                                            <button id="btn-enviar" type="button" class="btn btn-gradient btn-round btn-primary">Guardar</button>

                                            <button type="reset" id="btn-limpiar" name="btn-reset-form" class="btn btn-gradient btn-round btn-gradient btn-default ">Limpiar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>                                                       
                        </section>

                        <!-- OBSERVACIONES -->
                        <section class="tab-pane fade" id="tabObservaciones">
                            <!--FORM OBSERVACION-->
                            <div class="form-group"> 
                            <!--Textarea Observaciones-->
                                <form class="">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <textarea  cols="15" rows="3" name="txtObservacio" id="txtObservacio" class="form-control"></textarea>
                                    </div>
                                    <br><br><br><br><br>


                                    <!--butoon Observacion-->
                                    <div class="text-center">
                                        <button type="submit" id="btn_observacion" name="btn_observacion" class="btn btn-3d btn-primary btn-sm"><i class="glyphicon glyphicon-edit"></i> Crear Observacion</button>
                                    </div>                                                                
                                </form>                                                                  
                            </div>
                            <!--/FORM OBSERVACION-->
            
                            <!--TABLA OBSERVACIONES-->
                            <div class="form-group">                            
                                <div class="col-md-12">
                                    <table cellspacing="1" class="table table-bordered tablesorter" id="tblObservaciones">
                                        <thead>
                                            <tr>
                                                <th width="5%">id</th>
                                                <th width="15%">Fecha Observación</th>
                                                <th width="15%">Usuario</th>
                                                <th width="15%">Prospecto</th>
                                                <th width="15%">Observación</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        </tbody>
                                    </table>
                                
                                </div>
                            </div>                                  
                            <!--/TABLA OBSERVACIONES-->
                        </section> 

                        <!--PAGO-->
                        <section class="tab-pane fade" id="tabPago"> 
                        </section>
                        <!--/PAGO-->

                    </div>
                    <!--/*TABS CONTENT*/-->
              </div>
              <!-- /CUERPO DEL MODAL -->    
          
        </div>
  </div>
</div>
    



<!-- MODAL DE REGISTRO DE NUEVO PROSPECTO-->
<div class="modal fade" id="mdlRegistrarPros" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header alert alert-warning">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>                
                <strong><h4 class="modal-title">NOTA:</h4></strong>
                <p class="text">Registrar la persona la cual debera hacer el seguimiento, para poder llevar acabo sus proceso todos los datos del formulario son obligatorios.</p>                
            </div>
            <!-- CUERPO DEL MODAL --> 
            <div class="modal-body">

                <div class="col-sm-12 col-xs-12">
                    <form class="form-horizontal" action="<?php echo site_url('prospectos/registrar_prospecto'); ?>" method="post">                       

                        <!--Nombres-->
                        <div class="form-group">                        
                            <label class="col-sm-3 control-label text-right"><strong>Nombres <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="txtNombre" id="txtNombre" value="<?php echo set_value('txtNombre'); ?>" placeholder="Nombres"/>
                            </div>
                            <div style="height: 40px;" class="col-xs-5">
                                <p><?php echo form_error('txtNombre', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>

                        <!--Apellidos-->
                        <div class="form-group">                        
                            <label class="col-sm-3 control-label text-right"><strong>Apellidos <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="txtApell" id="txtApell" value="<?php echo set_value('txtApell'); ?>" placeholder="Apellidos"/>
                            </div>
                            <div style="height: 40px;" class="col-xs-5">
                                <p><?php echo form_error('txtApell', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>

                         <!--Telefono-->
                        <div class="form-group">                        
                            <label class="col-sm-3 control-label text-right"><strong>Telefono</strong></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="Telefono" id="Telefono" value="<?php echo set_value('Telefono'); ?>" placeholder="Numero telefonico"/>
                            </div>
                            <div style="height: 40px" class="col-xs-5">
                                <p><?php echo form_error('Telefono', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>

                        <!--Celular-->
                        <div class="form-group">                        
                            <label class="col-sm-3 control-label text-right"><strong>Celular <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="Celular" id="Celular" value="<?php echo set_value('Celular'); ?>" placeholder="Numero telefonico"/>
                            </div>
                            <div style="height: 40px" class="col-xs-5">
                                <p><?php echo form_error('Celular', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>

                        <!--Email-->
                        <div class="form-group">                        
                            <label class="col-sm-3 control-label text-right"><strong>Email </strong><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="txtEmail" id="txtEmail" value="<?php echo set_value('txtEmail'); ?>" placeholder="Example@gmail.com"/>
                            </div>
                            <div style="height: 40px" class="col-xs-5">
                                <p><?php echo form_error('txtEmail', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>  

                        <!--btn Registrar-->
                        <div class="col-lg-11 col-xs-offset-3">
                            <button style="color: #fff;" type="submit" class="btn btn-3d btn-success">Registrar</button>
                            <button type="button" class="btn btn-3d btn-primary" data-dismiss="modal">Cancelar</button>  
                        </div>                        
                    </form> 
                </div>                             
            </div>
            <!-- /CUERPO DEL MODAL -->    
            <div class="modal-footer">
                 
            </div>
        </div>
    </div>
</div>
    
    
    
    
    
