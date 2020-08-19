<?php if (!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<!--FORMULARIO DE REGISTRO SEFIZ-->
<div  class="contedorlist">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4>Actualizar mis datos</h4>
        </div>
        <div class="panel panel-body">
            <div class="container"><br/><br/>

            <!--MENSAJE DE ERROR DE IMAGEN-->

            <?php  if($this->session->flashdata('errorImg')):?>
                <div id="msjeUpload" class="col-md-4 col-sm-4 col-xs-12 col-md-offset-4 col-sm-offset-4   alert <?php echo $this->session->flashdata('claseImg'); ?> alert-dismissible">
                   <?php 
                        echo $this->session->flashdata('errorImg');
                    ?>
                </div>
            <?php endif ?>    
                         
                <form class="form-horizontal" role="form" method="post" action="<?php echo site_url('mi_perfil/actulizar_mi_perfil') ?>">
                                                            
                    <div class="col-xs-10 col-sm-push-1">

                        <!--Avatar del usuario-->    
                            <div class="row">
                                <div class="col-lg-10 col-xs-offset-4">
                                    <section>
                                        <figure>
                                            <img class="img img-circle img-thumbnail" style="height:150px;width:150px;"
                                            src="<?php echo base_url().$this->session->userdata('avatar');?>" 
                                            alt="Usuario" />
                                        </figure>
                                    </section>                                       
                                </div>                                
                            </div><br>
                                
                            
                            <div class="row">
                                <div class="col-lg-10 col-xs-offset-4">
                                    <a href="#mdlImgPerfil" class="btn btn-3d btn-primary btn-sm"
                                    data-toggle="modal" data-target="#mdlImgPerfil">
                                        <i class="glyphicon glyphicon-picture"></i> Cambiar Imagen
                                    </a>
                                </div>                                
                            </div>   
                            <br/>
                        <!--/Avatar del usuario--> 
                        <hr><br/>
                        <!--Tipo de documento-->
                        <div class="form-group">
                        
                            <label for="selCed" class="col-sm-2 col-xs-offset-2 control-label"><strong>Tipo documento <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label><div class="col-sm-3">
                             <select class="form-control " name="selCed" id="selCed" autofocus>
                                    <option selected value="">::Seleccionar::</option>
                                    <?php
                                    
                                    foreach ($datos_perfil['tipodoc'] as $tipodoc) {

                                        if($misDatos->documento == $tipodoc->valor_item):
                                            $selected="selected";
                                        else:
                                            $selected="";
                                        endif;

                                        echo "<option value='" .$tipodoc->valor_item. "' ".$selected."> " .
                                         $tipodoc->detalle_item . "</option>";
                                    }
                                    ?>                                             
                                </select>   

                            </div>
                            <div style="height: 40px" class="col-sm-4 col-xs-4">
                                <p><?php echo form_error('selCed', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>   


                        <!--Numero del documento de identidad-->
                        <div class="form-group">
                            <label for="Numdoc" class="col-sm-2 col-xs-offset-2 control-label"><strong>Documento <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-3">                                
                                <input type="text" class="form-control" name="Numdoc" id="Numdoc" value="<?php echo $misDatos->identificacion ;?>" placeholder="Numero del documento"/>
                            </div>  
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('Numdoc', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>


                        <!--Nombres-->
                        <div class="form-group">
                            <label for="txtNombre" class="col-sm-2 col-xs-offset-2 control-label"><strong>Nombres <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i>
                            </sup></strong></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="txtNombre" id="txtNombre" value="<?php echo $misDatos->nombres ?>" placeholder="Nombres" />
                            </div> 
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('txtNombre', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>                                


                        <!--Apellidos-->
                        <div class="form-group">
                            <label for="txtApell" class="col-sm-2 col-xs-offset-2 control-label"><strong>Apellidos <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong>
                            </label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="txtApell" id="txtApell" value="<?php echo $misDatos->apellidos; ?>" placeholder="Apellidos" />
                            </div>   
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('txtApell', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>


                        <!--Fecha de nacimiento-->
                        <div class="form-group">
                            <label for="txtfch" class="col-sm-2 col-xs-offset-2 control-label"><strong>F. nacimiento <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-3">
                                <input class="form-control" type="date" name="txtFch" id="txtFch" value="<?php echo $misDatos->fec_nac; ?>" />                                
                            </div>                        
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('txtFch', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>


                        <!--Tipo de sexo-->
                        <div class="form-group">
                            <label for="selsexo" class="col-sm-2 col-xs-offset-2 control-label"><strong>
                            Sexo <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i>
                            </sup></strong></label>
                            <div class="col-sm-3">
                                <select class="form-control " name="selsexo" id="selsexo" autofocus >
                                    <option selected value="">::Seleccionar::</option>
                                    <?php
                                    
                                    foreach ($datos_perfil['sexo'] as $sexo) {

                                        if($misDatos->idsexo == $sexo->valor_item):
                                           $select = "selected";
                                        else:
                                           $select = "";
                                        endif;

                                        echo "<option value='" . $sexo->valor_item . "' ".$select.">" .
                                         $sexo->detalle_item . "</option>";
                                    }
                                    ?> 
                                </select>                                
                            </div>       
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('selsexo', '<div class="alert alert-danger">',
                                 '</div>') ?></p>
                            </div>
                        </div>  


                        <!--Tipo de estado civil-->
                        <div class="form-group">
                            <label for="selestadocivil" class="col-sm-2 col-xs-offset-2 control-label"><strong>Estado civil <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-3">
                                <select class="form-control " name="selestadocivil" id="selestadocivil" autofocus>
                                    <option selected value="">::Seleccionar::</option>
                                    <?php
                                    
                                   foreach ($datos_perfil['estadocivil'] as $estadocivil) {

                                        if($misDatos->idestado_civil == $estadocivil->valor_item):
                                           $select = "selected";
                                        else:
                                           $select = "";
                                        endif;

                                        echo "<option value='" . $estadocivil->valor_item . "' ".$select.">" .
                                         $estadocivil->detalle_item . "</option>";
                                    }
                                    ?> 
                                </select>                                
                            </div>  
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('selestadocivil', '<div class="alert lert-danger">
                                ', '</div>') ?></p>
                            </div>
                        </div>


                        <!--Tipo de profesion-->
                        <div class="form-group">
                            <label for="selProfesion" class="col-sm-2 col-xs-offset-2 control-label"><strong>Profesion <sup>    <i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong>
                            </label>
                            <div class="col-sm-4">
                                <select class="form-control" name="selProfesion" id="selProfesion" autofocus>
                                    <option selected value="">::Seleccionar::</option>
                                    <?php                                    

                                    foreach ($datos_perfil['profesiones'] as $profesiones){

                                        if($misDatos->idprofesion==$profesiones->idprofesion):
                                           $select="selected";
                                        else:
                                           $select="";
                                        endif;   
                                        echo "<option value='" . $profesiones->idprofesion . "'".$select.">" .
                                         $profesiones->oficio . "</option>";
                                    }
                                    ?>                                            
                                </select>                                
                            </div>    
                            <div style="height: 40px" class="col-xs-4">
                              <p><?php echo form_error('selProfesion', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>


                        <!--Pais-->
                        <div class="form-group">
                            <label for="selPais" class="col-sm-2 col-xs-offset-2 control-label"><strong>Pais <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i>
                            </sup></strong>
                            </label>
                            <div class="col-sm-3">
                                <select class="form-control" name="selPais" id="selPais">
                                    <option value="0">::Selecionar::</option>
                                    <?php
                                    
                                    foreach ($datos_perfil['pais'] as $pais) {

                                        if($misDatos->idcodpais==$pais->codigo):
                                           $select="selected";
                                         else:
                                           $select="";
                                         endif;   
                                        echo "<option value='" . $pais->codigo . "'".$select.">" . $pais->descripcion
                                         . "</option>";
                                    }
                                    ?>    

                                </select>                                
                            </div>       
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('selPais', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>


                        <!--Departamento-->
                        <div class="form-group">
                            <label for="selDepartamento" class="col-sm-2 col-xs-offset-2 control-label"><strong>    Departamento <sup><i style="color: #ffcc00;font-size: 10px;" 
                            class="fa fa-star"></i></sup></strong>
                            </label>
                            <div class="col-sm-3">
                                <select class="form-control" name="selDepartamento" id="selDepartamento">
                                    <option value="0">::Selecionar::</option>                                    
                                                                 
                      
                                </select>                                
                            </div>   
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('selDepartamento', '<div class="alert alert-danger">', '</div>') ?></p>
                            </div>
                        </div>


                        <!--ciudad-->
                        <div class="form-group">
                            <label for="selMunicipio" class="col-sm-2 col-xs-offset-2 control-label"><strong>Municipio <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong>
                            </label>
                            <div class="col-sm-3">
                                <select class="form-control" name="selMunicipio" id="selMunicipio">
                                    <option value="0">::Selecionar::.</option>
                                </select>                               
                            </div>     
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('selMunicipio', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>


                        <!--Barrio-->
                        <div class="form-group">
                            <label for="txtBarrio" class="col-sm-2 col-xs-offset-2 control-label"><strong>Barrio<sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-3">   
                                <input class="form-control" type="text" name="txtBarrio" id="txtBarrio" placeholder="Barrio de Residencia" value="<?php echo $misDatos->barrio; ?>" />                               
                            </div> 
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('txtBarrio', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>


                        <!--Direccion-->
                        <div class="form-group">
                            <label for="txtdireccion" class="col-sm-2 col-xs-offset-2 control-label"><strong>Direccion <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong></label>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" name="txtDireccion" id="txtDireccion" value="<?php echo $misDatos->direccion; ?>" placeholder=" Residencia" />                          
                            </div> 
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('txtDireccion', '<div class="alert alert-danger">','</div>') ?></p
                                >
                            </div>
                        </div>


                        <!--Telefono-->
                        <div class="form-group">
                            <label for="Telefono" class="col-sm-2 col-xs-offset-2 control-label"><strong>Telefono <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong> 
                            </label>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" name="Telefono" id="Telefono" value="<?php echo $misDatos->telefono; ?>" placeholder="Telefono"/>

                            </div>  
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('Telefono', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>


                        <!--Celular-->
                        <div class="form-group">
                            <label for="celular" class="col-sm-2 col-xs-offset-2 control-label"><strong>Celular <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong>
                            </label>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" name="celular" id="celular" value="<?php echo $misDatos->celular; ?>" placeholder="Movil"/>

                            </div>  
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('celular', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>


                        <!--Email-->
                        <div class="form-group">
                            <label for="txtEmail" class="col-sm-2 col-xs-offset-2 control-label"><strong>Email <sup><i style="color: #ffcc00;font-size: 10px;" class="fa fa-star"></i></sup></strong>
                            </label>
                            <div class="col-sm-4">
                                <input class="form-control" type="text" name="txtEmail" id="txtEmail" value="<?php echo $misDatos->email; ?>" placeholder="example@gmail.com"/>

                            </div>  
                            <div style="height: 40px" class="col-xs-4">
                                <p><?php echo form_error('txtEmail', '<div class="alert alert-danger">','</div>') ?></p>
                            </div>
                        </div>                     


                        <!--Button actualizar-->
                        <div class="col-lg-10 col-xs-offset-4">
                            <button style="color: #fff;" class="btn btn-3d btn-primary" type="submit" name="btnregistrar" id="btnRegistrar" ><i class="fa fa-save"></i>Actualizar perfil                                    </button>
                        </div>
                    </div>
                </form>                
            </div>
            <br/><br/>
        </div>        
    </div>
</div>


<!--MODAL CAMBIAR IMAGEN USUARIO-->
<div id="mdlImgPerfil" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">            
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="text text-left">Cambiar Imagen del Perfil.</h4>
            </div>
            <div class="modal-body">
            
                <!-- FORMULARIO UPLOAD -->  
                <form action="mi_perfil/subir_img" id="frmImgPerfil" class="form-horizontal" method="post"
                 enctype="multipart/form-data">
                 
                    <p class="text-center"><input type="file" name="userfile" id="userfile" /></p>
                    <p class="text-center">
                        <button type="submit" class="btn btn-3d btn-primary" id="btnUploadImg">
                        <span class="glyphicon glyphicon-upload" aria-hidden="true"></span> 
                            Subir Imagen
                        </button>
                    </p>
                </form><br>
                <!-- /FORMULARIO UPLOAD --> 

                <ul>
                    <li>* La imagen debe ser menor a 300 KB.</li>
                    <li>* Sólo se aceptan los siguientes formatos: <i>.jpg</i>,<i>.jpeg</i> y <i>.png</i></li>
                    <li>*La imagen no debe exceder las siguientes dimensiones: <i>400x200</i></li>
                </ul>
            
            </div>           
            
        </div>
    </div>
</div>