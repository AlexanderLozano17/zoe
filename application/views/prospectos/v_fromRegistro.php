<!--Formulario de registro-->
<div style="margin-left: 20%; width: 70%"  class="contedorlist center"><br/>    

    <!--PANEL-->
    <div class="panel panel-default">
        <div  style="height: 50px;" class="panel-heading">
            <h4 style="">Registro de Nuevo Prospecto</h4>
        </div>
        <!--HEADER DEL PANEL-->
        <div class="panel-header">
            <div class="panel-heading alert alert-warning">
                <h4>NOTA:</h4>
                <p class="">Registrar la persona la cual debera hacer el seguimiento, para poder llevar acabo sus procesos
                    todos los datos del formulario son obligatorios.</p>
            </div>
        </div>

        <!--BODY DEL PANEL-->
        <div class="panel-body ">  
            <div class="col-lg-12 col-sm-12 col-xs-12">
                        
                <form class="form-horizontal" action="<?php echo site_url('prospectos/registrar_prospecto'); ?>" method="post">

                    <div class="col-sm-offset-3">

                        <!--Nombres-->
                        <div class="form-group">                        
                            <label class="col-sm-2 control-label text-right"><strong>Nombres <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="txtNombre" id="txtNombre" value="<?php echo set_value('txtNombre'); ?>" placeholder="Nombres"/>
                            </div>
                            <div style="height: 40px;" class="col-xs-5">
                                <p><?php echo form_error('txtNombre', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>

                        <!--Apellidos-->
                        <div class="form-group">                        
                            <label class="col-sm-2 control-label text-right"><strong>Apellidos <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="txtApell" id="txtApell" value="<?php echo set_value('txtApell'); ?>" placeholder="Apellidos"/>
                            </div>
                            <div style="height: 40px;" class="col-xs-5">
                                <p><?php echo form_error('txtApell', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>

                        <!--Telefono-->
                        <div class="form-group">                        
                            <label class="col-sm-2 control-label text-right"><strong>Telefono</strong></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="Telefono" id="Telefono" value="<?php echo set_value('Telefono'); ?>" placeholder="Numero telefonico"/>
                            </div>
                            <div style="height: 40px" class="col-xs-5">
                                <p><?php echo form_error('Telefono', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>

                        <!--Celular-->
                        <div class="form-group">                        
                            <label class="col-sm-2 control-label text-right"><strong>Celular <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="Celular" id="Celular" value="<?php echo set_value('Celular'); ?>" placeholder="Numero telefonico"/>
                            </div>
                            <div style="height: 40px" class="col-xs-5">
                                <p><?php echo form_error('Celular', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>

                        <!--Email-->
                        <div class="form-group">                        
                            <label class="col-sm-2 control-label text-right"><strong>Email </strong><sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="txtEmail" id="txtEmail" value="<?php echo set_value('txtEmail'); ?>" placeholder="Example@gmail.com"/>
                            </div>
                            <div style="height: 40px" class="col-xs-5">
                                <p><?php echo form_error('txtEmail', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>  

                        <!--btn Registrar-->
                        <div class="col-sm-offset-2">
                            <button style="color: #fff;" type="submit" class="btn btn-3d btn-success">Registrar</button>
                            <a href="<?php echo site_url('prospectos/registro'); ?>"><button id="reset" style="color: #fff;" type="button" class="btn btn-3d btn-primary">Cancelar</button></a>
                        </div>
                    </div>
                </form>      
            </div>
        </div>
    </div>
</div>
