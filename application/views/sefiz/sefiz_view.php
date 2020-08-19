<div class="col-sm-10 col-sm-offset-2">
    <?php  $anterior = 0;
    foreach($niveles as $nivel): ?>
        
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 style="color:#fff" class="text-center"><?php echo $nivel['cod_nivel'] ?>. <?php echo  $nivel['titulo']?></h4>
                </div>
                <div class="panel panel-body text text-center">
                    <img style="width:100%" src="<?php echo base_url('extra/img/'.$nivel["imagen"])?>"/>
                    <div class="media-body" align="center" style="padding-bottom:30px;">
                    <br />
                        <?php
                            if($nivel["aprobado"] == false){
                               echo '<a class="btn btn-3d btn-danger disabled"><strong><i class="fa fa-ban"></i> Bloqueado</strong></a>';
                            }else{
                               echo '<a class="btn btn-3d btn-primary" href="sefiz/nivel/'.$nivel['cod_nivel'].'/1"><strong><i class="fa fa-sign-in"></i> Acceder</strong></a>';           
                            }//if
                        ?>
                    
                    </div>    
                </div>            
            </div>
            
        </div>  
    <?php endforeach;//endforeach; ?>
</div>            