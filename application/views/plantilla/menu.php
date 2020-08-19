
<!-- start:Left Menu -->
<dsiv id="left-menu" >
    <div class="sub-left-menu scroll">
        <ul class="nav nav-list">
            <li><div class="left-bg">
                    <img src="<?php echo base_url('extra/css/img/g3986.png');?>"/>
                </div></li>
            <li class="time">
                <h1 class="animated fadeInLeft"><?php echo date("h:i"); ?></h1>
                <p class="animated fadeInRight"><?php echo date("D, d M Y"); ?></p>
            </li>
            <li class="active ripple">                
                <a class="" href="<?php echo site_url() . '/' ?>inicio"><img style="width:30px;width: 30px;" class="img img-circle" src="<?php echo base_url('extra/css/img/home.png')?>"/>    Inicio</a>
            </li>
    

            <?php
            foreach ($menu as $item):
                echo '<li class="riple"><a href="' . site_url() . $item->url . '"><img style="width:30px;width: 30px;" class="img img-circle" src="'.base_url(). $item->icono.'">   ' . ucfirst($item->nombre) . '</a></li>';
            endforeach;
            ?>
        </ul>
    </div>
</div>
<!-- end: Left Menu -->





<!-- DATOS DE SEGURIDAD - SESION -->
<input type="hidden" id="hdnIdUsuario" value="<?php echo $this->session->userdata('idusuario'); ?>" />
<input type="hidden" id="hdnIdPerfil"  value="<?php echo $this->session->userdata('idperfil'); ?>" />
<input type="hidden" id="hdnBaseUrl"   value="<?php echo site_url(); ?>" />



