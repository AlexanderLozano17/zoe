<div class="col-md-10 col-xs-10">
    <table id="container_sefiz_niveles"></table>
    <div id="pager_container"></div>
    
    
    
    <form class="modal fade" id="DivFormNivel" tabindex="-1" role="dialog" aria-hidden="true" method="post" action="<?= base_url() ?>index.php/sefiz/ajax_crear_nivel">
    	<div class="modal-dialog" style="width:800px">
    		<div class="modal-content">
    			<div class="modal-header">
    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    				<h4 class="modal-title">Configuración de Nivel</h4>
    			</div>
    			<div class="modal-body">
                	<div class="form-horizontal" role="form">
                    	<div class="form-group">
                        	<label for="txtNombreNivel" class="col-sm-2 control-label">Nombre</label>
                        	<div class="col-sm-10">
                            	<input type="hidden" id="HddnCodNivel" name="HddnCodNivel" />
                          		<input type="text" class="form-control" id="txtNombreNivel" name="txtNombreNivel">
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<label for="txtNombreNivel" class="col-sm-2 control-label">Orden</label>
                        	<div class="col-sm-10">
                          		<input type="text" class="form-control" id="txtOrdenNivel" name="txtOrdenNivel">
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<label for="txtImagenNivel" class="col-sm-2 control-label">Imagen</label>
                        	<div class="col-sm-10">
                            	<img id="ImgNivel" style="width:100%" />
                          		<input type="file" id="txtImagenNivel" name="txtImagenNivel">
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<label for="txtDescripcionNivel" class="col-sm-2 control-label">Descripcion</label>
                        	<div class="col-sm-10">
                            	<input type="hidden" name="hddnDescripcionNivel" id="hddnDescripcionNivel" />
                            	<textarea id="txtDescripcionNivel" name="txtDescripcionNivel" rows="5" rows="3" style="height:100px;"></textarea>
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<label for="txtFechaCreacion" class="col-sm-2 control-label">Creacion</label>
                        	<div class="col-sm-10">
                            	<input type="text" class="form-control" id="txtFechaCreacion">
                        	</div>
                      	</div>
                        <div class="form-group">
                            <label for="txtFechaActualizacion" class="col-sm-2 control-label">Actualizacion</label>
                        	<div class="col-sm-10">
                            	<input type="text" class="form-control" id="txtFechaActualizacion">
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<div class="col-sm-12">
                            	<button type="button" class="btn btn-primary pull-right" id="BtnRegistrarNivel"><strong><i class="fa fa-check fa-fw"></i> Registrar</strong></button>
                                <button type="button" class="btn btn-default pull-right" data-dismiss="modal"><strong><i class="fa fa-times fa-fw"></i> Cancelar</strong></button>
                        	</div>
                      	</div>
                    </div>
                </div>
           	</div>
      	</div>
    </form>
    
    
    <form class="modal fade" id="DivFormTema" tabindex="-1" role="dialog" aria-hidden="true" method="post" action="<?= base_url() ?>index.php/sefiz/ajax_crear_tema">
    	<div class="modal-dialog" style="width:800px">
    		<div class="modal-content">
    			<div class="modal-header">
    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    				<h4 class="modal-title">Configuración de Tema</h4>
    			</div>
    			<div class="modal-body">
                	<div class="form-horizontal" role="form">
                    	<div class="form-group">
                        	<label for="txtNombreTema" class="col-sm-2 control-label">Nombre</label>
                        	<div class="col-sm-10">
                            	<input type="hidden" id="HddnCodTema" name="HddnCodTema" />
                                <input type="hidden" id="HddnCodNivelTema" name="HddnCodNivelTema" />
                          		<input type="text" class="form-control" id="txtNombreTema" name="txtNombreTema">
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<label for="txtOrdenTema" class="col-sm-2 control-label">Orden</label>
                        	<div class="col-sm-10">
                          		<input type="text" class="form-control" id="txtOrdenTema" name="txtOrdenTema">
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<label for="txtDescripcionTema" class="col-sm-2 control-label">Descripcion</label>
                        	<div class="col-sm-10">
                            	<input type="hidden" name="hddnDescripcionTema" id="hddnDescripcionTema" />
                            	<textarea id="txtDescripcionTema" name="txtDescripcionTema" rows="5" rows="3" style="height:100px;"></textarea>
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<label for="txtFechaCreacionTema" class="col-sm-2 control-label">Creacion</label>
                        	<div class="col-sm-10">
                            	<input type="text" class="form-control" id="txtFechaCreacionTema">
                        	</div>
                      	</div>
                        <div class="form-group">
                            <label for="txtFechaActualizacionTema" class="col-sm-2 control-label">Actualizacion</label>
                        	<div class="col-sm-10">
                            	<input type="text" class="form-control" id="txtFechaActualizacionTema">
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<div class="col-sm-12">
                            	<button type="button" class="btn btn-primary pull-right" id="BtnRegistrarTema"><strong><i class="fa fa-check fa-fw"></i> Registrar</strong></button>
                                <button type="button" class="btn btn-default pull-right" data-dismiss="modal"><strong><i class="fa fa-times fa-fw"></i> Cancelar</strong></button>
                        	</div>
                      	</div>
                    </div>
                </div>
           	</div>
      	</div>
    </form>
    
    <div id="DivFormExamen" style="display:none;" title="Configuración de Preguntas">
    	<div class="form-horizontal" role="form">
            <div class="form-group pull-left" style="margin-bottom:0px;">
                <label class="col-sm-12 control-label"><h3 id="txtNombreNivelExamen"></h3></label>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <table id="container_sefiz_niveles_preguntas"></table>
                    <div id="pager_container_preguntas"></div>
                </div>
            </div>
        </div>
    </div>
</div>