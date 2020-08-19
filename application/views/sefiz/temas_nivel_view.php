<div class="col-sm-10 col-sm-offset-2">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="row">
            <div class="col-sm-8">
                <div class="col-xs-12">
                    <div class="tile">	
                        <h2 class="tile-title"><?php $data_nivel["titulo_nivel"]." - ".$data_tema["titulo_tema"] ?></h2>
                        <div class="listview narrow">
                            <div class="media p-l-5">
                                <div id="contenidoTema"><?php $data_tema["descripcion"] ?></div>
                            </div><!--class="media p-l-5"-->
                        </div><!--class="listview narrow"-->
                    </div><!--class="tile"-->
                </div><!--class="col-xs-12"-->                        
          	</div><!--class="col-sm-8"-->
            <div class="col-sm-4">
            	<div class="tile">	
                    <h2 class="tile-title"><i class="fa fa-book"></i> Listado de Temas</h2>
                    <div class="listview narrow">
                        <div class="media p-l-5">
                            <?php  foreach($temas_nivel as $i => $tema){ ?>
                          	<li>
                              	<a href="<?= base_url() ?>index.php/sefiz/nivel/<?= $cod_nivel ?>/<?= $tema['orden']?>">
                              		<?= $tema['orden'].". ".$tema['titulo']?>
                              	</a>
                          	</li>
                          	<?php }//FOREACH ?>
                        </div><!--class="media p-l-5"-->
                    </div><!--class="listview narrow"-->
                </div><!--class="tile"-->
            </div><!--class="col-sm-4"-->
            <div class="col-sm-12">
                <div class="tile">	
                    <h2 class="tile-title">¿Que Opinas?</h2>
                    <div class="listview narrow">
                        <div class="media p-l-5">
                            <div class="col-sm-1">
                            <!--
                                <img src='<?php $data_tercero//["img_200"] ?>' style="max-width:100%;max-height:200px;" />
                            </div>-->
                            <div class="col-sm-11">
                                <form action="<?php echo base_url('index.php/sefiz/guardar_comentario');?>" method="post">
                                    <input type="hidden" name="cod_nivel" value="<?= $cod_nivel ?>" />
                                    <input type="hidden" name="cod_tema" value="<?= $cod_tema ?>" />
                                    <textarea class="form-control m-b-10" placeholder="Escriba aqui su comentario..." name="desc_comentario"></textarea>
                                    <div style="margin-top:5px">
                                        <button class="pull-right btn btn-default btn-alt" type="submit"><strong><i class="fa fa-comments-o"></i> Comentar!</strong></button>
                                    </div>
                                </form>
                            </div><!--class="col-sm-11"-->
                            <hr style="width: 100%; margin: 10px;">
							<?php
                                foreach($comentarios as $comentario){
                                    echo "	<div class='row'>
                                                <div class='col-sm-1'>
                                                    <img src='".$comentario["foto_usuario"]."' style='max-width:100%;max-height:150px;' />
                                                </div>
                                                <div class='col-sm-11'>
                                                    <span style='font-weight:700;font-size:1.2em'><a href='".base_url()."index.php/perfil/ver_perfil/".$comentario["cod_usuario"]."'>".$comentario["nom_usuario"]."</a></span> <span style='font-size:0.85em;font-style:italic;'>El ".$comentario["fecha"]."</span><br>
                                                    <div style='margin-top:0.4em;'>".$comentario["comentario"]."</div>
                                                </div>
                                            </div>
                                            <hr style='width:100%;margin:4px;'>
                                        ";
                                }//foreach
                            ?>
                        </div><!--class="media p-l-5"-->
                    </div><!--class="listview narrow"-->
                </div><!--class="tile"-->
            </div><!--class="col-sm-12"-->
       	</div><!--class="row"-->
  	</div><!--class="col-sm-10 col-sm-offset-1"-->
</div><!--class="row"-->
      	