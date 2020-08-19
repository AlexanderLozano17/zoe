<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| Hooks
| -------------------------------------------------------------------------
| This file lets you define "hooks" to extend CI without hacking the core
| files.  Please see the user guide for info:
|
|	http://codeigniter.com/user_guide/general/hooks.html
|

	pre_system
	Llamado muy pronto durante la ejecución del sistema. En este punto, solamente se cargaron las clases de hooks y benchmark. No ocurrió ningún ruteo u otro proceso. 

	pre_controller
	Llamado inmediatamente antes de que cualquiera de sus controladores haya sido llamado. Se hicieron todas las clases base, ruteo y verificaciones de seguridad. 

	post_controller_constructor
	Llamado inmediatamente después que su controlador se instanció, pero antes que haya ocurrido cualquier llamada a un método. 

	post_controller
	Llamado inmediatamente después que su controlador se ejecutó completamente. 

	display_override
	Anula la función _display(), usada para enviar la página finalizada al navegador web al final de la ejecución del sistema. Esto le permite usar su propia metodología de impresión. Advierta que necesitará referenciar al superobjeto CI con $this->CI =& get_instance() y luego los datos finalizados estarán disponibles llamando a $this->CI->output->get_output() 

	cache_override
	Le permite llamar a su propia función en lugar de la función _display_cache() en la clase Output. Esto le permite usar su propio mecanismo de visualización del caché. 

	post_system
	Llamado después que la página final renderizada se envíe al navegador, en el final de la ejecución del sistema y después que los datos finalizados se envían al navegador.
|
*/

//Validar session
$hook['post_controller_constructor'] = array(
												'class'    => 'Sesion',
												'function' => 'check_login',
												'filename' => 'sesion.php',
												'filepath' => 'hooks'
											);

/*
//Verificar acceso a un pagina Pndte. de activar...
$hook['post_controller'] []= array(
												'class'    => 'Acceso',
												'function' => 'verificar_acceso',
												'filename' => 'acceso.php',
												'filepath' => 'hooks'
											);	
									*/



/* End of file hooks.php */
/* Location: ./application/config/hooks.php */