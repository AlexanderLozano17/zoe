<?php if (!defined("BASEPATH")) exit("No direct script access allowed"); ?>
<!-- CONTENIDO PRINCIPAL  TEMPLATE EXAMEN-->
<div class="col-sm-10 col-md-10">
	
    <!-- Box -->
    <div class="box col-sm-12 col-md-12">
        
        <!-- HEADER-BOX -->
        <div class="box-header well">
          <!-- Este dato $codigo proviene de la vista principal sefiz -->
    	  <h2 style="display:inline">EXAMEN - <strong style="text-transform:uppercase">NIVEL <?=$codigo ?> </strong></h2>
            <div class="box-icon">
                <i class="fa fa-list-alt"></i>
             </div>
        </div>
        
        <!-- BODY-BOX -->
        <div class="box-content" id="contenidoExamen">
             <ol>
			    <?php  foreach ($enunciado["indices_preguntas"] as $i=>$pregunta){ ?>
              	<li><?= $enunciado["desc_preguntas"][$pregunta]?>
              		<ul style="list-style:none;">
					<?php foreach($enunciado["respuestas"][$pregunta]["indice_respuestas"] as $j=>$respuesta){ 
					 $cod_res=$respuesta;
					 $respuesta=$enunciado["respuestas"][$pregunta]["respuestas"][$respuesta];
					 ?>
				      <li>
                      <input type="radio" value="<?=$pregunta."-".$cod_res ?>" id="rdoRes<?=$i.$j?>" name="rdoRes<?=$i?>" data-cod-pregunta="<?=$pregunta?>" />
					  <?=$respuesta ?>
                      </li>
					<?php }?>
				  	</ul>
              	</li> 
              <?php } ?>
            </ol>
			<button id="btnEnviarExamen" class="col-md-offset-3 btn btn-info">Enviar ex&aacute;men</button>
            <input id="hdnIdNivel" type="hidden" value="<?=$codigo ?>" />
			<div id="rta"><div>
        </div>
        
    </div>
    <!-- End Box -->

    
  <!-- MODAL DE LA RESPUESTA DEL USUARIO -->  
  <div class="modal fade" id="modalResultados" style="display:none" data-target=".bs-modal-sm">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">RESULTADOS - Nivel <?=$codigo?></h4>
      </div>
      <div class="modal-body">
      	<p id="msje"></p>
        <p>Acertadas: 		<span class="label label-success" id="spnAcertadas"></span></p>
        <p>Err&oacute;neas: <span class="label label-danger"  id="spnErroneas"></span></p>
        <p>Calificacion: <span class="label label-info" id="spnCalificacion"></span>%</p>
        <p>Estado: <span id="spnEstado"></span></p>
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</div>