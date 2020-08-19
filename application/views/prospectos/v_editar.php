<!--FORMULARIO PARA EDITAR DATOS DEL PROSPECTO-->
<br/>
<div style="margin-left: 20%; width: 70%" class="contedorlist center">  
    <div class="panel panel-default">
        <!--Id prospecto-->
        <div  style="height: 50px;" class="panel-heading">

            <p style="margin-top: 10px;" class=" text-left"> <strong>Informacion Personal - Id.- <?php echo $datoprospecto->idpersona; ?></strong></p>

        </div>
        
        <!--Panel principal-->
        <div class="panel-body">
            <div class="col-lg-12 col-sm-12 col-xs-12">
                <div style="margin-top: 70px; margin-left: 45px" class="col-sm-2">
                    <!--www.123rf.com-->
                    <img src="<?php echo base_url('extra/css/img/user_edit.png'); ?>"/>
                </div>
                <div style="margin-top: -30px" class="col-sm-12 ">
                    <form class="form-horizontal" method="POST" action="<?php echo site_url('prospectos/actualizarRegistroProspecto'); ?>">      

                        <!--Id prospecto hidden-->
                        <input type="hidden" id="Idprospecto" name="Idprospecto" value="<?php echo $datoprospecto->idpersona; ?>"/>

                        <div  style="margin-top: -18%" class="col-sm-offset-3">     

                            <!--Nombres-->
                            <div class="form-group">                        
                                <label class="col-sm-2 control-label text-right"><strong>Nombres <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="txtNombre" id="txtNombre" placeholder="Nombres" value="<?php echo $datoprospecto->nombres; ?>"/>
                                </div>
                                <div class="text-danger">
                                    <p><?php echo form_error('txtNombre') ?></p>
                                </div>
                            </div>

                            <!--Apellidos-->
                            <div class="form-group">                        
                                <label class="col-sm-2 control-label text-right"><strong>Apellidos <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="txtApell" id="txtApell" placeholder="Apellidos" value="<?php echo $datoprospecto->apellidos; ?>"/>
                                </div>
                                <div class="text-danger">
                                    <p><?php echo form_error('txtApell') ?></p>
                                </div>
                            </div>

                            <!--Telefono-->
                            <div class="form-group">                        
                                <label class="col-sm-2 control-label text-right"><strong>Telefono</strong></label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="Telefono" id="Telefono" placeholder="Numero telefonico" value="<?php echo $datoprospecto->telefono; ?>"/>
                                </div>
                                <div class="text-danger">
                                    <p><?php echo form_error('Telefono') ?></p>
                                </div>
                            </div>

                            <!--Celular-->
                            <div class="form-group">                        
                                <label class="col-sm-2 control-label text-right"><strong>Celular <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="Celular" id="Celular" placeholder="Movil" value="<?php echo $datoprospecto->celular; ?>"/>
                                </div>
                                <div class="text-danger">
                                    <p><?php echo form_error('Celular') ?></p>
                                </div>
                            </div>

                            <!--Email-->
                            <div class="form-group">                        
                                <label class="col-sm-2 control-label text-right"><strong>Email </strong><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="txtEmail" id="txtEmail" placeholder="Example@gmail.com" value="<?php echo $datoprospecto->email; ?>"/>
                                </div>
                                <div class="text-danger">
                                    <p><?php echo form_error('txtEmail') ?></p>
                                </div>
                            </div>
                            
                            <!--Estado del cliente-->
                            <div class="form-group">                        
                                <label class="col-sm-2 control-label text-right"><strong>Estado </strong><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></label>
                                <div class="col-sm-4">
                                    <select name="txtEstado" id="txtEstado"> 
                                        
                                    <?php
                                    foreach ($estados as $estado):
                                           //imprimo el la opcion segun el estado que tenga
                                        if( $estado->valor_item !='A' && $estado->valor_item != 'I'){
                                            if($datoprospecto->estado == $estado->valor_item):
                                              $select = "selected";
                                            else:
                                              $select = "";
                                            endif;     
                                            echo "<option value='" . $estado->valor_item . "'".$select."> " . $estado->detalle_item . "</option>";
                                        }
                                    endforeach;
                                        ?>
                                    </select>
                                </div>
                            </div>
                            
                            <!--Btn actualizar-->
                            <div class="col-sm-offset-2">
                                <a href="<?php echo base_url('index.php/prospectos');?>" style="color: #fff;" class="btn btn-3d btn-primary">Regresar</a>
                                <button style="color: #fff;" type="submit" class="btn btn-3d btn-success">Actualizar</button>
                            </div>
                        </div>                               
                    </form>      
                </div>
            </div>
        </div> 
    </div>
</div>