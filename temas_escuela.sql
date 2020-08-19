/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.17 : Database - temas_escuela
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `sefiz_comentario` */

DROP TABLE IF EXISTS `sefiz_comentario`;

CREATE TABLE `sefiz_comentario` (
  `cod_comentario` int(10) NOT NULL AUTO_INCREMENT,
  `cod_tema` int(10) NOT NULL,
  `cod_nivel` int(10) NOT NULL,
  `cod_usuario` int(10) NOT NULL,
  `descripcion` text,
  `fecha` datetime DEFAULT NULL,
  `visible` int(1) DEFAULT '0',
  PRIMARY KEY (`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

/*Data for the table `sefiz_comentario` */

insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (1,7,2,3990,'en dias pasados hice pago de 20 puntos ya me llego el producto gracias y a la vez no se si por error mi hice otra recompra pensando que era la que estaba pidiendo y n me aperece como si estubiera pendiente pero creo que me equivoque en el pedido les agradeceria me retirarran ese pedido gracias de nuevo por su colaboracion exitos Armando Beltran J.\n','2014-07-26 08:58:18',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (2,2,2,3709,'Gracias Alejandro es excelente as&amp;iacute; es en este mundo convulsionado se quiere salir solo pero en equipo se llega m&amp;aacute;s lejos, pido todos los d&amp;iacute;as ser la l&amp;iacute;der que mi equipo desea. Am&amp;eacute;n.','2014-07-26 11:12:32',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (3,1,1,4127,'Excelente , es lo que quiero , es lo mio y siempre he so&amp;ntilde;ado con esta oportunidad de un cambio en mi vida y  en la vida de las personas que estimo . vamos con buena actitud.','2014-07-26 15:27:53',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (4,1,1,4042,'Tener la oportunidad de ingresar a este grandioso equipo me llena de mucho orgullo. Agradezco principalmente a Dios por darme esta linda bendici&amp;oacute;n y poner en mi camino a mi Mentor Aicardo Rivera.... esta es la mejor oportunidad de mi vida..... all&amp;aacute; voy con toda.','2014-07-26 18:00:13',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (5,0,2,2753,'totalmente de acuerdo hace ya 4 a&amp;ntilde;os que vengo estudiando esta forma tan interesante de mercadeo y cada d&amp;iacute;a me gusta mas la industria del Network marketing  y ahora que encontr&amp;eacute; zoe estoy convencido que alcanzare mis sue&amp;ntilde;os , pues no conozco otra plataforma mas generosa con sus distribuidores .... y cr&amp;eacute;anme que he estudiado muchas mas.','2014-07-28 08:02:16',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (6,1,2,2753,'gracias l&amp;iacute;der por tu apoyo, por siempre estar gui&amp;aacute;ndonos y orient&amp;aacute;ndonos,  aprendemos mucho de ti ... esto es ser un verdadero l&amp;iacute;der....  lo mas importante es visualizar tu futuro .  porque no debemos vivir en la realidad sino en la verdad y la verdad es que nacimos para se pr&amp;oacute;speros.','2014-07-28 08:14:06',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (7,8,1,4084,'HOLA\nQUIERO DESCARGAR LOS VIDEOS Y NO ME SALE NADA SOBRE TODO ESTE GRACIAS\n','2014-07-28 12:15:28',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (8,8,1,1,'M&amp;oacute;nica buenas tardes, estas capacitaciones no se pueden descargar, solamente se pueden visualizar desde la oficina virtual. Un saludo','2014-07-28 14:35:35',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (9,1,1,3856,'Nunca es tarde para que tus sue&amp;ntilde;os se hagan realidad. Gracias papito Dios por darme la oportunidad de conocer personas tan maravillosas en este programa guiado primeramente, por ti y por gente tan capaz como mi mentor y l&amp;iacute;der Alejandro Facundo y Cesar Jimenez. Dios me los bendiga.','2014-07-31 12:46:06',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (10,0,2,1589,'Muy cierto la oportunidad es para todo el mundo si queremos estar en la cima simplemente dejemonos guiar de personas q ya tienen su trayectoria ,y en la compa&amp;ntilde;ia cada vez se esfuerzan mas para limpiarnos el camino al exito ,logico esta q pongamos nuestra parte','2014-07-31 21:41:33',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (11,2,2,2950,'Excelente millonario, yo estoy aqui para entrenarme y poder duplicarme y consolidar un equipo fuera de lo com&amp;uacute;n y s&amp;eacute; que de la mano de Dios, de t&amp;iacute; y todos nuestros l&amp;iacute;deres mentores lo voy a lograr. Gracias','2014-08-05 20:02:47',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (12,1,2,2950,'Excelente l&amp;iacute;der, y de la mano de mentores como t&amp;uacute; y nuestra escuela sefiz, vamos a lograr el &amp;eacute;xito de manera m&amp;aacute;s r&amp;aacute;pida, aqu&amp;iacute; siempre estoy dispuesta aprender d&amp;iacute;a a d&amp;iacute;a hasta alcanzarlo, mil gracias','2014-08-05 20:05:27',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (13,12,1,3967,'Hay v&amp;iacute;deos incompletos','2014-08-07 21:38:45',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (14,12,1,1,'Se&amp;ntilde;or &amp;Aacute;ngel Var&amp;oacute;n, tenga usted un excelente d&amp;iacute;a. Por favor informemos cuales son los v&amp;iacute;deos incompletos para realizar las respectivas correcciones. Env&amp;iacute;enos su comentario al correo sistemas@zoevita.com.co, agradecemos su colaboraci&amp;oacute;n. Equipo Zoe International.','2014-08-08 07:57:49',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (15,1,1,4227,'excelente me parece una oportunidad grandiosa y en la vida se pierde mas por miedo que por intentar,el plan de Dios siempre es el mejor esto es lo que esperaba para mi vida y asi poder cumplir mis sue&amp;ntilde;os mis metas...gracias DIOS por tus grandes bendiciones y gracias ami mentor y gran lider javier perez, voy con toda','2014-08-08 13:39:58',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (16,0,2,3644,'Considero que el mercadeo en redes, se convierte en una opci&amp;oacute;n de construcci&amp;oacute;n de ganancia para todas las personas, que  utilizando al herramienta del Internet permite una mayor eficiencia del proceso. El Network Marketing se convierte en un mecanismo de &quot;Distribuci&amp;oacute;n de la riqueza  a manera de econom&amp;iacute;a solidaria&quot; , pero es importante tener en cuenta  que esta opci&amp;oacute;n de negocio no es un tipo de negocio tradicional, pues el tradicional es aquel que necesita de  locales, un numero inmenso de insumos , procesos de proveedores,  publicidad, nomina y otros, el Multinacional es una negocio no tradicional, que , entendido as&amp;iacute;   es todo lo contrario a los negocios tradicionales, y llevado desde lo mas simple  permite que toda persona, sin importar su &amp;iacute;ndole  social,educativo,  cultural y econ&amp;oacute;mico desarrolle la el Negocio. Ha esta labor hay que sumarle un proceso  Educativo y as&amp;iacute; se llega ser un profesional en el Mercadeo por redes, teniendo &amp;eacute;xito en el , pero mas aun, llevando al &amp;eacute;xito en quienes creyeron en ti para lograr su &amp;eacute;xito. considero que es un &amp;eacute;xito compartido, un proceso de trabajo en equipo, de sinergia.','2014-08-09 12:58:54',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (17,1,2,3644,'Trabajo,disciplina, sue&amp;ntilde;os, y mas trabajo, concentraci&amp;oacute;n,  enfoque , reinversion y liderazgo.\nEstar dispuesta a darlo todo, a cambiarlo todo, desaprender - volver a aprender y desaprender - volver a aprender.\nExcelente c&amp;oacute;digos para alcanzar el &amp;eacute;xito hay que pasar del deseo a la voluntad.','2014-08-09 13:48:56',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (18,1,2,4227,'excelente siempre dispuesta a aprender con disciplina retomar los sue&amp;ntilde;os,luchando por lo que queremos.por que volver a empezar es concederse una nueva oportunidad y lo mio no es suerte &amp;iexcl;son puras bendiciones!gracias lider por tu apoyo y acompa&amp;ntilde;amiento','2014-08-09 14:44:23',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (19,2,2,3644,'Buen&amp;iacute;simo, excelente porque, no importa quien sea ahora, donde estoy, de donde vengo, lo que importa es quien quiero ser, a donde  quiero llegar, a donde quiero que mi negocio y mi equipo este. Solo hay un camino formaci&amp;oacute;n y reflexi&amp;oacute;n y mas formaci&amp;oacute;n, sum&amp;aacute;ndole ejemplo y enfoqu&amp;eacute;.  Muy buenos c&amp;oacute;digos. ','2014-08-09 14:55:27',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (20,0,2,4227,'excelente el mundo esta lleno de oportunidades solo es abrir la mente al cambio, a aprender mas creo que,El Networ Marketing es la mejor alternativa empresarial para el aumento de la productividad y para lograr el exito.vienen tiempos de agua viva,que regaran nuestra tierra de bendicion ','2014-08-09 16:15:46',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (21,2,2,4227,'excelente ..gracias escuchando los concejos de los demas,dejandonos guiar se consolida un equipo y asi procurando despertar cada dia con la idea de que algo maravilloso esta a punto de suceder ,,por que para Dios nada es imposible','2014-08-09 16:26:40',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (22,1,1,3138,'especial y nos vamos a cartagena\n','2014-08-09 21:33:21',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (23,6,2,3709,'La verdad cuando uno esta enfocado nada ni nadie lo saca del estadio, por eso somos aguilas. Gracias Lider Jhony Arteaga, tendremos muy en cuenta al aguila, para volar tan alto como el Se&amp;ntilde;or nos quiera elevar. Am&amp;eacute;n.','2014-08-10 09:45:37',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (24,8,2,3709,'As&amp;iacute; es,  quien sigue la gu&amp;iacute;a de un mentor  encontraremos el camino m&amp;aacute;s r&amp;aacute;pido al sue&amp;ntilde;o. El ejemplo dignifica, Busquemos siempre el conocimiento. Gracias l&amp;iacute;der dejaremos de ser cabras locas.','2014-08-10 11:15:38',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (25,1,2,3826,'SIMPLEMENTE LO MEJOR A NUESTRA DISPOSICI&amp;Oacute;N.','2014-08-11 13:45:00',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (26,10,1,4066,'Escriba aqui su comentario..si todo esto es muy cierto porque uno siempre debe estar en miras de crecer y aprender todo lo que se  pueda  para poder lograr la excelencia.','2014-08-12 09:49:23',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (27,3,2,3986,'un l&amp;iacute;der debe tener actitud de auto desarrollo y ser l&amp;iacute;der en potencia y seguir el sistema ','2014-08-12 17:50:05',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (28,0,2,3986,'considerablemente excelente pues en la vida los que aprendemos a escuchar nunca tendremos el fracasos pues tenemos muchas puertas abiertas  gracias a lo que NUESTRO DIOS nos da dia a dia ','2014-08-14 15:34:37',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (29,1,1,4085,'Si esto es la introducci&amp;oacute;n, c&amp;oacute;mo ser&amp;aacute; el resto de lecciones. Gracias zoe y mentores de esta espectacular empresa. Con toda seguridad en un a&amp;ntilde;o ser&amp;eacute; un gran profesional en esta industria del mercadeo de multinivel\n','2014-08-18 08:41:07',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (30,3,2,4157,'EL VERDADERO LIDER DEBE INTERIORIZAR Y CAMBIAR  A ACTITUDES POSITIVAS Y  NO REACTIVAS TRABAJAR CON ELEQUIPO EN LAVISION Y TRASMITIR SEGURIDAD Y MOTIVACION','2014-08-18 17:12:36',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (31,9,2,4157,'EXCELENTE CAPACITACI&amp;Oacute;N ENFOCADO EN EL SER Y LOS PRINCIPIOS DIVINOS DE JESUS','2014-08-18 20:28:14',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (32,1,1,4265,'EXCELENTE YO SE Q ESTO ES LO MIO Y CON LA AYUDA DE DIOS Y MI MENTOR SERE UNA MUJER EXITOSA POR MI Y POR LAS PERSONAS Q QUIERO! VAMOS PARA ADELANTE CON TODA!','2014-08-21 17:59:28',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (33,1,2,4157,'Increible informe de capacitacion , siempre enfocando con entusiasmo y con bendiciones','2014-08-24 21:05:46',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (34,10,1,4111,'En realidad para alcanzar el &amp;eacute;xito y lograr nuestros sue&amp;ntilde;os debemos cambiar de actitud, permitirnos aprender cosas nuevas y dejarnos guiar por las personas que van m&amp;aacute;s adelante y en este camino. Pero sobretodo tener una mente positiva, confiar en la ayuda Divina ya que &amp;Eacute;l Dios nos muestra las herramientas para salir adelante y que no nos pase como el se&amp;ntilde;or que de una tragedia y falleci&amp;oacute; le reclamaba a Dios el porqu&amp;eacute; no le hab&amp;iacute;a ayudado pero Dios le dec&amp;iacute;a te las env&amp;iacute;e pero no las aceptaste. Moraleja debemos aprovechar las buenas oportunidades ya que pueden ser la respuesta a nuestras dificultades.','2014-08-28 22:28:25',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (35,1,2,4111,'Excelente introducci&amp;oacute;n. Ahora a sacudirnos, levantarnos y a cumplir nuestras metas con la ayuda de Jehov&amp;aacute; Dios y la gu&amp;iacute;a de estos excelentes l&amp;iacute;deres =)\n','2014-08-28 23:08:47',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (36,3,2,3709,'Hola muy buenas tardes no me aparece este modulo muchas gracias si alguien puede ayudarme mil gracias','2014-08-31 15:39:06',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (37,6,2,3709,'Gracias L&amp;iacute;der Jhony Arteaga, a pesar de las tormentas, de las dificultades, tenemos que convertirnos en AGUILAS CALVAS, el reto es PASAR LA NUBE OSCURA, PARA ENCONTRAR EL SOL, CON LA BENDICI&amp;Oacute;N DEL SE&amp;Ntilde;OR.MIIIIIIIIIIIIIIILLLLLLLLLL GRACIAS POR SUS HERMOSAS PALABRAS.\n','2014-08-31 16:38:42',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (38,5,2,3709,'HUYYYYYYYYYYYYYY LIDER QUE TARDE TAN PRECIOSA Y EDIFICANTE GRACIAS POR LA MADUREZ QUE ADQUIRIMOS DIA A DIA CON CADA UNA DE SUS ENSE&amp;Ntilde;ANZAS, EL SE&amp;Ntilde;OR SIGA DERRAMANDO BENDICIONES SOBRE USTED, PARA SEGUIR SIENDO  PARTE DE SU MENTOREO MIL Y MIL GRACIAS.','2014-08-31 17:22:16',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (39,7,2,3709,'LIDER JHONY ARTEAGA MIL BENDICIONES Y PRONTO NS VOLVAMOS ESOS PROTEGIDOS PRODUCTIVOS, QUE PODAMOS SER RETROSPECTIVOS Y CON LA MADUREZ DEL PROCESO SEAMOS ESOS SERES QUE TENEMOS CLARO COMO VOLVERNOS PRODUCTIVOS NO SOLO EN EL NEGOCIO SINO EN NUESTRAS VIDAS, CON LA FAMILIA, CON LAS PERSONAS QUE HAN CREIDO EN NOSOTROS Y LOS SEPAMOS VOLVER ESOS PROTEGIDOS FRUCTIFEROS EN LA VIDA DE CADA UNO DE ELLOS.AMEN.','2014-08-31 17:46:42',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (40,8,2,3709,'GRACIAS PODEROSOS MENTORES CESAR JIMENEZ, ALEJANDRO FACUNDO, JHONY ARTEAGA , JHON PORTILLO SON LO MAXIMO.','2014-08-31 18:23:11',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (41,9,2,3709,'GRACIAS L&amp;Iacute;DERES UN D&amp;Iacute;A MUY EDIFICANTE CON CADA UNA DE SUS ENSE&amp;Ntilde;ANZAS, SOLO DEBEMOS APRENDER A SER HUMILDES Y VIVIR DE LA LEALTAD. MIL BENDICIONES PARA CADA UNO DE USTEDES, PARA CONTINUAR SIENDO PROCESADOS DE MANERA TAN CLARA Y SENCILLA. MUCHOS EXITOS.','2014-08-31 19:04:26',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (42,0,2,3709,'ESTAMOS EN EL MEJOR MOMENTO, CON LA MEJOR EMPRESA Y CON LA MEJOR DECISI&amp;Oacute;N DE NUESTRAS VIDAS. ADELANTE L&amp;Iacute;DERES A NO DESFALLECER EN LAS METAS PERSONALES.','2014-08-31 19:07:14',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (43,1,2,3709,'ASI ES L&amp;Iacute;DER CESAR JIMENES ANDAR SIEMPRE CON EL PENSAMIENTO POSITIVO. TU ERES EL AROMA DE TU PIEL.ATRAES LO QUE PIENSAS ,YA SE DONDE QUIERO LLEGAR. GRACIAS POR SER EL LIDER Y MOTIVADOR EXCELENTE QUE ERES. DIOS TE BENDIGA SIEMPRE.','2014-08-31 20:18:56',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (44,2,2,3709,'GRACIAS LIDER CON LA CAMISETA PUESTA, NUESTRAS CICATRICES NOS HACE CADA VEZ MAS FUERTES PARA LLEGAR A LA META BENDICIONES.','2014-08-31 20:44:35',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (45,1,1,4318,'un video excelente, motiva a las personas q no creen en si mismos de salir adelante .. es una gran oportunidad para poder explotar nuestras capacidades q llevamos ocultas.     con  la actitud positiva alta muy alta.','2014-09-02 20:10:40',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (46,1,1,4274,'DIOS es hermoso y muyyy grande al darle a estas personas tanta inteligencia y sabiduria, para que por medio de ellos, muchos otros alcancen el exito anhelado .gracias por esta oportunidad ','2014-09-05 19:12:34',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (47,1,1,4243,'Excelente, es una gran oportunidad que Dios nos ha brindando para salir adelente y lograr nuestras metas.','2014-09-06 14:36:12',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (48,1,1,4306,'muy bueno esta es una oportunidad diferente zoe es una bendicion de DIOS\n','2014-09-06 14:55:38',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (49,2,1,4306,'ME GUSTAN LAS CAPACITACIONES, POR QUE SON MUY COMPLETAS','2014-09-06 15:01:19',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (50,1,1,4325,'Excelente,  gracias Dios por esta oportunidad tan grande que me Brindas a trav&amp;eacute;s de ZOE y por todas las personas que nos brindan sus conocimientos para salir adelante, bendiciones.','2014-09-06 18:29:40',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (51,1,1,4115,'Es de alta calidad intelectual y sicologico, para lograr encontrarnos con nosotros mismosa, alcaznzar nuestros suenos y ayudar a la familia y a otras personas a lograrlo. Doy gracias a Dios por encontrar en mi camino personas como Alejandro y todo el equipo de Zoe.\n','2014-09-07 21:41:28',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (52,9,2,4306,'QUE BENDICION ESTAS CAPACITACIONES, PODEROSAS','2014-09-08 11:45:56',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (53,5,2,4227,'PODEROSO LIDER CADA DIA QUERIENDO APRENDER MAS DE USTEDES  SON LOS MEJORES ,GRACIAS POR EDIFICAR CADA DIA EN MI VIDA  MI BENDICION MAS GRANDE ES HACER PARTE DE ESTA GRAN FAMILIA,,,LA FAMILIA ZOE MIL BENDICIONES','2014-09-12 16:15:44',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (54,6,2,4227,'excelenteeeee lider jhony tenemos que ser como las aguilas para asi poder volar alto y muy lejos, gracias por tus grandes conocimientos ,hay que saber bailar bajo la lluvia, porque para DIOS no hay nada imposibleeee ..','2014-09-12 16:22:27',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (55,7,2,4227,'quiero ser un protejido fuera de lo comun y asi honrar a mi mentor gracias lider te bendigo en el nombre de jesus,,','2014-09-12 16:30:33',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (56,8,2,4227,'AMEN LIDER EXCELENTE SIEMPRE DE LA MANO DE LOS GRANDES LO LOGRAREMOS ,,HOY TU PUEDES SER LA EXTENCION DEL FAVOR DE DIOS PARA LA VIDA DE ALGUIEN MAS,,MIL BENDICIONES A  TODOS MIS GRANDES MENTORES Y LIDERES ','2014-09-12 16:38:53',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (57,9,2,4227,'PODEROSISIMAAAAAAA ME ENCANTO ESTA CAPACITACION GRACIAS LIDER ,,A TODO ESTO ES NECESARIO A&amp;Ntilde;ADIR QUE LOS LIDERES SE HACEN NO NACEN Y TENEMOS QUE SEGUIR EL CAMINO DE LA MANERA MAS CORRECTA,,SER LEAL','2014-09-12 16:49:18',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (58,1,1,4348,'me gusto mucho la idea de capacitarme  y lograr mis sue&amp;ntilde;os con mi familia y poder darle la oportunidad a mis amigos  y conocidos como me dieron ami la oportunidad .  gracias zoe','2014-09-15 12:03:42',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (59,4,1,3803,'amigos Zoe buenas noches he abierto esta noche algunos temas del primer nivel que aunque ya los estudi&amp;eacute; y present&amp;eacute; e3l examen  con el 100% quise repasar un poco pero hay algunos videos que se est&amp;aacute;n  quedando quietos no avanzan y luego hablan otro poquito y vuelven y paran.\nSocorro Mar&amp;iacute;n \nCali\n\n','2014-09-16 20:25:29',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (60,4,1,1337,'L&amp;iacute;der, la calidad de reproducci&amp;oacute;n es relativo a la calidad del Internet y al estado de los componentes para reproducci&amp;oacute;n instalados de su navegador.\nYa que esto esta en linea, es como cuando reproduces un v&amp;iacute;deo en You Tube. ','2014-09-17 08:11:19',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (61,1,1,4199,'Me parece muy buena la idea de capacitarme y saber como sacar adelante mi negocio que lo tengo estancado en este momento. ','2014-09-17 08:45:54',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (62,1,1,1589,'','2014-09-19 17:41:02',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (63,3,1,4119,'INDICACIONES DE ESTE TEMA SON MUY CLAROS, FIJANDONOS EN ESTOS PASOS SON EFECTIVOS\n','2014-09-22 04:12:32',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (64,3,2,4227,'Un buen l&amp;iacute;der tiene claras sus  metas y sabe compartir sus conocimientos con sus seguidores, acepta opiniones de personas externas as&amp;iacute; como cr&amp;iacute;ticas  logrando as&amp;iacute; el poder ense&amp;ntilde;ar el trabajo en equipo y no en grupo.\n','2014-09-22 14:43:20',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (65,4,2,4227,'Un l&amp;iacute;der es aquella persona que tiene la capacidad de contagiar sus ideas y pensamientos a un grupo de personas sin perder el objetivo inicial  y fomentando valores que los distingan de las dem&amp;aacute;s personas.ZOE tiene los mejores lideres gracias,,','2014-09-22 14:48:43',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (66,6,2,4111,' Vamos a volar tan alto como las &amp;aacute;guilas, vamos en busca de la excelencia, no nos cansaremos ni nos dejaremos contaminar de la carro&amp;ntilde;a del mundo y sobretodo con la gu&amp;iacute;a de Dios todo ser&amp;aacute; posible.gracias a nuestros mentores','2014-10-07 15:15:52',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (67,7,2,4111,'De verdad debemos seguir, valorar, reconocer y dejarnos guiar x nuestros mentores ya que es la &amp;uacute;nica manera de convertirnis en protegidos productivo. Bendiciones a los mentores','2014-10-07 16:51:38',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (68,9,2,4111,'Ser leales con nuestros mentores nuestro negocio y con todas las personas que tienen sue&amp;ntilde;os y llegan a nuestro equipo.','2014-10-07 17:11:59',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (69,1,1,4437,'Me parece super interesante logra que personas principiantes en el negocio como yo aprendamos hacer exitosos en la vida por este medio gracias por permitirnos ser parte de este proyecto y m&amp;aacute;s por brindarnos tanta  sabiduria','2014-10-09 12:20:12',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (70,11,1,3765,'tengo mucha fe   de tener &amp;eacute;xitos  en la compa&amp;ntilde;&amp;iacute;a Zoe','2014-10-14 18:06:32',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (71,3,1,4359,'Gracias por lo que hace. por aquel que quiere iniciar de nuevo .quiero llegar lejos con la ayuda de m,i padre y de quien nos ense&amp;ntilde;a o gu&amp;iacute;a .gracias  don Alejandro mil bendiciones.\n','2014-10-17 13:42:14',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (72,1,1,4413,'excelente campe&amp;oacute;n  lo felicito vamos con toda\n','2014-10-17 18:46:52',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (73,9,2,3967,'Porque no tengo permlso para presentar examen?\n','2014-10-19 20:49:06',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (74,1,1,4471,'Excelente con la ayuda de Dios vamos a lograrlo ','2014-10-21 00:53:50',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (75,1,2,3750,'Espcpriba aqui su comentario..por eso eres exitoso porque por tus venas corre el &amp;eacute;xito de zoe pero en poco tiempo estare en el mismo lugar que tu estas','2014-10-25 20:54:18',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (76,1,1,4526,'Todo muy bien planteado!','2014-10-30 13:01:29',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (77,10,1,4413,'excelente \n','2014-10-30 17:36:52',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (78,0,2,4413,'me p&amp;aacute;rese muy bueno e interesante \n','2014-10-30 18:06:34',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (79,1,1,4524,'','2014-11-02 06:39:04',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (80,1,1,4348,'Gracias Alejandro muy buena introducci&amp;oacute;n','2014-11-06 08:13:13',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (81,4,1,4348,'Muy bueno cesar','2014-11-06 08:41:55',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (82,7,1,4348,'Es muy importante este tema','2014-11-06 09:20:17',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (83,8,1,4348,'Gracias l&amp;iacute;der por estas asesor&amp;iacute;as excelentes','2014-11-06 09:27:51',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (84,11,1,4348,'Definitivamente tenemos muchas  cosas q aprender gracias lider','2014-11-06 10:06:27',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (85,5,1,4496,'es corecto las aguilas miran desde las nuves mas altas el suelo \n\npero las gallinas miran las nubes muy altas desde el suelo','2014-11-07 20:51:27',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (86,1,1,4537,'EL PREAMBULO ES EXCELENTE','2014-11-07 21:50:42',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (87,10,1,4396,'buena. pienso que  debemos aprovechar las oportunidades que nos da la vida para crecer como ser humano. creer y pensar los cambios que nos DIOS tiene para nosotros poder  triunfar por el mundo y cumplir nuestros sue&amp;ntilde;os.','2014-11-08 15:31:16',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (88,3,1,4533,'gracias por compartir tus conocimientos me siento una ganadora.','2014-11-08 21:45:37',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (89,1,1,4533,'gracias por la oportunidad de guiarnos, empiezo una gran etapa en mi vida','2014-11-08 23:22:50',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (90,10,1,4496,'el exito no es para los nesecitados es para lo meresedores\n','2014-11-09 17:48:32',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (91,0,2,4496,'QUE DUCUMENTO EXELETE INNFORMASI\n','2014-11-11 19:47:01',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (92,9,2,4496,'que buen modulo grasias\n','2014-11-12 21:05:14',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (93,5,2,4219,'mucho poder en sus palabras mentor !! ','2014-11-14 11:11:08',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (94,1,2,4269,'ZOE, LA VIDA DE DIOS, MI VIDA.','2014-11-14 13:57:11',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (95,1,2,4413,'buenas noches porque no tengo permiso para presentar el examen del segundo nivel','2014-11-16 17:50:45',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (96,9,2,4413,'excelente paquete de temas gracias zoe por estas capacitaciones los bendigo en el nombre de JESUCRISTO q cada d&amp;iacute;a se abran nuevas puertas y brille la iluminaci&amp;oacute;n divina en sus mentores...................','2014-11-16 18:15:34',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (97,5,1,4546,'Escriba aqui su comentario..','2014-11-18 12:36:05',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (98,5,1,4546,'Escriba aqui su comentario..','2014-11-18 12:36:05',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (99,5,1,4546,'Escriba aqui su comentario..','2014-11-18 12:36:06',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (100,1,1,3495,'LES RECOMIENDO VER Y VER ESTA INTRODUCCI&amp;Oacute;N TODOS LOS D&amp;Iacute;AS PARA NO DESENFOCARNOS. Estamos en el mejor momento y somos parte del equipo garantiza futuro. Dios est&amp;aacute; con nosotros ','2014-11-19 03:37:23',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (101,3,1,3495,'Recuerda debemos alimentar todos los d&amp;iacute;as nuestra lista (materia prima) ','2014-11-19 03:57:52',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (102,1,1,3923,' DEFINITIVAMENTE EXCELENTE SON NUESTROS PRIMEROS PASOS PARA EL EXITO','2014-11-26 20:42:53',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (103,1,1,2346,'DEFINITIVAMENTE   !!!!!!!!   EL  EXITO  DE  ESTE  NEGOCIO  ,  SE BASA   EN   LA  CAPACITACION  ..   Hector Hernandez O.\n','2014-12-05 12:54:22',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (104,0,2,3832,'excelente \n','2014-12-27 07:53:39',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (105,2,2,4269,'Gracias PS, eres el mejor&amp;iexcl;','2015-01-04 21:23:36',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (106,8,1,4615,'Gracias Lider por ense&amp;ntilde;arnos a romper esos Paradigmas.','2015-01-07 08:51:53',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (107,3,1,4612,'','2015-01-08 10:36:14',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (108,3,1,4612,'Muchas gracias,seguir&amp;eacute; paso a paso  todo para llegar a mis sue&amp;ntilde;os y metas, de nuevo gracias darnos tus conocimientos','2015-01-08 10:40:53',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (109,2,1,4617,'me gustan  por d&amp;iacute;a a d&amp;iacute;a aprendo nuevas cosas personas y laborales  y sobre todo me estoy capacitando ','2015-01-09 16:45:10',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (110,1,1,210,'definitivamente capacitarnos es lo mas importante...','2015-01-14 16:39:17',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (111,1,2,4382,'Excelente quiero ser un &amp;Aacute;guila!!','2015-01-21 15:04:42',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (112,4,1,4111,'Excelente','2015-01-22 15:01:28',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (113,1,1,4699,'Es bien claro el mensaje.','2015-01-23 13:48:33',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (114,3,1,4699,'Excelente... se podria emplear un termino distinto a &quot;embarazar&quot; que alcance  igualmente el objetivo de motivar.','2015-01-23 14:05:08',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (115,1,1,4724,'BUENA PRESENTACION,  EXCELENTE OPORTUNIDAD DE APRENDER PARA ENSE&amp;Ntilde;AR. GRACIAS!!\n','2015-01-26 09:04:59',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (116,5,1,4699,'Gracias por cambiar vidas...','2015-01-31 14:50:42',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (117,9,1,4699,'La disciplina esta por encima de la inteligencia.','2015-01-31 15:34:16',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (118,10,1,4699,'Alejandro es usted muy claro e inspira confianza plena.','2015-01-31 15:40:31',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (119,1,1,4740,'HAY QUE PREPARARSE D&amp;Iacute;A A D&amp;Iacute;A... BIEN, EXCELENTE.','2015-02-04 17:18:15',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (120,4,2,3832,'muy buenos los videos por nuestros grandes lideres y mentores, gracias por estar ahi apoyandonos y aprendiendo para ser mas grandes cada dia\n','2015-02-05 08:08:08',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (121,7,1,4615,'Excelente!!','2015-02-05 09:45:25',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (122,1,1,4778,'La capacitaci&amp;oacute;n es lo m&amp;aacute;s importante cuando se emprende un proyecto!','2015-02-08 10:29:38',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (123,1,1,4804,'','2015-02-09 15:42:19',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (124,4,1,4780,'Quiero saber como poder ver el video ya que me aparece bloqueado por vimeo','2015-02-09 18:57:33',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (125,4,1,3315,'Hay una cantidad de videos que estan bloqueados, nuestros lideres necesitan educarse, por favor revisar. gracias.','2015-02-10 10:56:21',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (126,4,1,4812,'Excelente presentaci&amp;oacute;n del negocio','2015-02-11 18:45:17',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (127,5,1,4753,'estupenda capacitaci&amp;oacute;n, llena de mucha motivacion y puntos claves para hacer realidad nuestros sue&amp;ntilde;os...','2015-02-13 14:19:48',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (128,1,1,4835,'EXCELENTE LA CAPACITACI&amp;Oacute;N....CREO QUE ES EL CAMINO A SER UN PROFESIONAL DE ESTA GRAN OPORTUNIDAD DE NEGOCIO','2015-02-15 12:34:03',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (129,1,1,4588,'Excelente capacitaci&amp;oacute;n, esto es lo que nos llevar&amp;aacute; al camino del &amp;eacute;xito!!! ','2015-02-18 07:48:34',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (130,1,1,4783,'Gracias lider por esta informacion, yo se que ZOE con su sistema de capacitacion y con los lideres que tiene van hacer mi vehiculo para cambiar mi vida y la de mi familia al 100% y mas. Bendiciones familia Zoe.','2015-02-19 17:33:18',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (131,10,1,4599,'Una pregunta; &amp;iquest;cu&amp;aacute;ndo estar&amp;aacute; disponible el ex&amp;aacute;men para pasar al segundo nivel?','2015-02-20 08:40:11',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (132,8,1,4778,'Lider agradezco todos los conocimientos que me brindas!','2015-02-21 08:23:36',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (133,3,1,4709,'exelente informacion para crecer mas y mas en nuestro negocio y salir a buscar a nuestros tiburonesss','2015-02-22 13:55:45',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (134,8,1,4812,'excelente','2015-02-24 14:12:44',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (135,10,1,4874,'muy buena pregunta por parte de Allan Ismael .\npor otro lado me gustar&amp;iacute;a saber donde quedaron los audios inspirados en la vida de Jes&amp;uacute;s que hablan de liderazgo ?','2015-03-01 20:44:19',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (136,10,1,4574,'me hago la misma pregunta del socio Luis Alberto &amp;iexcl;\n','2015-03-01 20:48:05',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (137,0,2,3750,'excelente estam0s en el mejor momento, etapa de fundacion. donde se hacen l0s millonarios','2015-03-02 12:57:01',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (138,10,1,4586,'','2015-03-03 18:40:22',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (139,10,1,4586,'si  cuando pasar para el otro nivel ','2015-03-03 18:40:55',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (140,7,1,4936,'excelemte totalmente nesesario tener esto claro','2015-03-14 23:36:25',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (141,1,1,4936,'Bien gracias','2015-03-15 00:58:30',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (142,2,1,4936,'Bien gracias','2015-03-15 00:59:11',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (143,3,1,4936,'Bien muchas gracias','2015-03-15 01:01:41',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (144,3,1,4936,'Bien muchas gracias','2015-03-15 01:13:13',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (145,3,1,4936,'Bien muchas gracias','2015-03-15 01:13:13',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (146,5,1,4936,'Bien muchas gracias','2015-03-15 01:44:59',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (147,6,1,4936,'Gracias','2015-03-15 01:46:38',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (148,8,1,4936,'Exselente','2015-03-15 02:01:46',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (149,9,1,4936,'','2015-03-15 02:25:03',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (150,10,1,4936,'','2015-03-15 02:37:58',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (151,1,1,4745,'Veeeenga muy bueno!! As&amp;iacute; es que se arranca, con full energ&amp;iacute;a y compromiso! ','2015-04-02 18:21:58',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (152,1,1,4921,'Muy bueno, quiero llegar a ser capacitador de otros en todo el mundo. ','2015-04-03 20:20:14',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (153,3,1,4921,'Est&amp;aacute; muy clara la informaci&amp;oacute;n, excelente. ','2015-04-03 20:37:10',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (154,4,1,4921,'Muy bueno, claro y &amp;uacute;til. Gracias. ','2015-04-03 20:48:04',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (155,5,1,4921,'Muy buena clasificaci&amp;oacute;n, creo que ahora ver&amp;eacute; mejores resultados. ','2015-04-03 21:01:46',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (156,1,1,5033,'exelente, muchas gracias por abrir las puertas del exito','2015-05-01 15:56:42',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (157,1,1,5036,'Hi, everybody this is the opportunity that I had been looking for. Thanks GOD for Zoe.','2015-05-08 23:26:49',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (158,1,1,4564,'definitivamente la mejor plataforma generacional que nos catapultar&amp;aacute; al &amp;eacute;xito... obviamente con pasi&amp;oacute;n, convicci&amp;oacute;n y capacitaci&amp;oacute;n. ','2015-05-14 16:41:27',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (159,2,1,4564,'Gracias Mentor','2015-05-14 16:46:18',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (160,3,1,4564,'Gracias..excelente','2015-05-14 17:03:02',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (161,4,1,4564,'Excelente , muchas gracias','2015-05-14 17:15:53',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (162,6,1,4564,'muy bien excelente','2015-05-14 17:23:21',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (163,8,1,4564,'Muy buena info!!!!','2015-05-14 17:27:35',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (164,9,1,4564,'trabajar disciplinadamente para desarrollar habilidades esenciales de un lider','2015-05-14 17:33:01',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (165,10,1,4564,'GRACIAS MENTOR','2015-05-14 17:45:28',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (166,1,1,5075,'excelente','2015-06-01 23:42:14',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (167,4,1,5025,'Excelente capacitacion','2015-06-05 06:50:07',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (168,9,1,4937,'NO BASTA CON SER LOS MEJORES UN DIA TENEMOS QUE SER SUPERIORES CADA DIA','2015-06-11 16:00:19',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (169,1,1,5091,'definitivamente es el camino correcto...excentemente el mejor','2015-06-14 23:04:40',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (170,2,1,5091,'gracias Mentor, muy interesante','2015-06-14 23:09:21',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (171,3,1,5091,'Muy bien la informaci&amp;oacute;n, clara y precisa.','2015-06-14 23:21:16',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (172,6,1,5091,'Gracias. el mensaje claro','2015-06-14 23:42:10',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (173,9,1,5091,'Disciplina y perseverancia as&amp;iacute; llegaremos a ser los mejores','2015-06-14 23:46:35',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (174,10,1,5203,'Gracias a Dios que nos presento esta gran oportunidad de cumplir nuestros sue&amp;ntilde;o y &amp;Eacute;xito,  porque esta escuela de capacitaci&amp;oacute;n esta realmente espectacular, y eso que solo estamos empezando, Gracias Alejandro Facundo por mostrarnos este tren de sue&amp;ntilde;o que son realidad.','2015-07-13 11:00:58',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (175,1,1,5239,'HERMOSOS TEMA ME ENCANTO EL VIDEO HOGAR DULCE HOGAR\n  ','2015-07-14 19:00:56',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (176,9,2,3644,'ME GUSTO MUCHO ESTA SEGUNDA TEMPORADA,  PODEROSO PRINCIPIO PARA CONSTRUIR UN EQUIPO  COMPROMETIDO Y TRABAJADOR\n','2015-07-23 11:42:24',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (177,1,1,5268,'excelente ','2015-08-07 15:24:51',1);
insert  into `sefiz_comentario`(`cod_comentario`,`cod_tema`,`cod_nivel`,`cod_usuario`,`descripcion`,`fecha`,`visible`) values (178,4,1,5268,'este negocio es espectacular que gran oportunidad','2015-08-16 09:30:14',1);

/*Table structure for table `sefiz_examen` */

DROP TABLE IF EXISTS `sefiz_examen`;

CREATE TABLE `sefiz_examen` (
  `cod_examen` int(10) NOT NULL AUTO_INCREMENT,
  `cod_nivel` int(10) NOT NULL,
  `cod_usuario` int(10) NOT NULL,
  `calificacion` decimal(15,2) DEFAULT NULL,
  `capacitacion` int(1) DEFAULT '0',
  `fecha_presentacion` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_examen`,`cod_nivel`,`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sefiz_examen` */

/*Table structure for table `sefiz_nivel` */

DROP TABLE IF EXISTS `sefiz_nivel`;

CREATE TABLE `sefiz_nivel` (
  `cod_nivel` int(10) NOT NULL AUTO_INCREMENT,
  `orden` int(10) DEFAULT NULL,
  `titulo_nivel` text,
  `descripcion` text,
  `imagen` text,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `visible` int(11) DEFAULT '1',
  PRIMARY KEY (`cod_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sefiz_nivel` */

/*Table structure for table `sefiz_nivel_pregunta` */

DROP TABLE IF EXISTS `sefiz_nivel_pregunta`;

CREATE TABLE `sefiz_nivel_pregunta` (
  `cod_pregunta` int(10) NOT NULL AUTO_INCREMENT,
  `cod_nivel` int(10) DEFAULT NULL,
  `desc_pregunta` text,
  `visible` int(1) DEFAULT NULL,
  PRIMARY KEY (`cod_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sefiz_nivel_pregunta` */

/*Table structure for table `sefiz_nivel_respuesta` */

DROP TABLE IF EXISTS `sefiz_nivel_respuesta`;

CREATE TABLE `sefiz_nivel_respuesta` (
  `cod_respuesta` int(10) NOT NULL AUTO_INCREMENT,
  `cod_pregunta` int(10) DEFAULT NULL,
  `descripcion` text,
  `es_correcta` char(1) DEFAULT NULL,
  `visible` int(1) DEFAULT NULL,
  PRIMARY KEY (`cod_respuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sefiz_nivel_respuesta` */

/*Table structure for table `sefiz_tema` */

DROP TABLE IF EXISTS `sefiz_tema`;

CREATE TABLE `sefiz_tema` (
  `cod_tema` int(10) NOT NULL AUTO_INCREMENT,
  `cod_nivel` int(10) DEFAULT NULL,
  `orden` int(10) DEFAULT NULL,
  `titulo_tema` text,
  `descripcion` text,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`cod_tema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sefiz_tema` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
