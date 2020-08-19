<!-- start: content -->
<div id="content">
    <div class="panel">
        <div class="panel-body">
            <div class="col-md-6 col-sm-12">
                <h3 class="animated fadeInLeft"><?php echo $tituloPagina; ?></h3>

                <!-- MENSAJES DE ERROR -->
                <div class="col-sm-12">
                     <div style="color: #fff;" id="error" class="col-sm-8 col-sm-offset-8 <?php echo $this->session->flashdata('clase') ?>">
                        <p class="text-center ">
                            <?php
                            if ($this->session->flashdata('mensaje')):
                                echo $this->session->flashdata('mensaje');
                            endif
                            ?>
                        </p>
                    </div>
                </div>

            </div>
            <div class="col-lg-6 col-md-6">
                <!-- BREADCUMBS -->
                <ul id="miga" class="breadcrumb hidden-xs">
                    <li>Te encuentras en: </li>

                    <?php
                    $ruta_breadcumbs = uri_string();
                    $arrSecciones = explode("/", $ruta_breadcumbs);
                    $con = 0;
                    for ($i = 0; $i < count($arrSecciones); $i++):
                        $con++;
                        $link = $arrSecciones[$i];
                        $texto = str_replace("_", " ", $arrSecciones[$i]);
                        if ($con == count($arrSecciones)):
                            echo "<li> " . ucfirst($texto) . "</li>";
                        else:
                            echo "<li><a href='" . site_url() . "/" . $link . "'> " . ucfirst($texto) . "</a></li>";
                        endif;

                    endfor;
                    ?>	
                </ul>
            </div>     
        </div>
    </div>
</div>			




