
<div class=" center-block" style="width: 300px;" id="divLogin">
    <div class="panel panel-default">
        <div class="panel-heading"><img src="<?php echo base_url(); ?>extra/img/logo_sefiz .png" alt="ZOE" width="100" /> 
            <strong class="pull-right" style="margin:10px">Iniciar Sesión</strong>
        </div>
        <div class="panel-body">

            <form action="login/iniciar_sesion" method="post" class="form-horizontal">

                <!-- FORMULARIO -->
                <div class="input-group">
                    <span class="input-group-addon icons icon-user"></span>
                    <input type="text" id="txtUsuario" name="txtUsuario" class="form-control" placeholder="Usuario">
                </div>
                <br />
                <br />
                <div class="input-group">
                    <span class="input-group-addon icons icon-key"></span>
                    <input type="password" id="txtClave" name="txtClave" class="form-control" placeholder="Clave">
                </div>
                <br />

                <span><a href="#" class="text-center">¿Olvidó su contraseña?</a></span>
                <button class="btn btn-primary pull-right" type="submit">INGRESAR</button>

                <!-- MENSAJE ERROR DEL LOGIN -->
                <div id="error" class="col-md-12">
                    <p class="text-danger text-center">
                        <?php
                        if ($this->session->flashdata('mensaje')):
                            echo $this->session->flashdata('mensaje');
                        endif
                        ?>
                    </p>
                </div>

            </form>
        </div>
    </div>

</div><!-- Col-md-4 -->


<!-- Row -->


<!-- Pié de Página -->
<div id="footer" class="row">
    <div class="col-md-12 col-xs-12">
        <p class="text-center">Todos los derechos reservados, <strong>&copy; <?php echo date('Y'); ?></strong></p>
        <p class="text-center"><?php echo site_url(); ?></p>
    </div>  
</div>

<!-- Container -->