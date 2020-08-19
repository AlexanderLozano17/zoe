/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.17 : Database - zoe
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `actividad_perfil` */

DROP TABLE IF EXISTS `actividad_perfil`;

CREATE TABLE `actividad_perfil` (
  `idactividad_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `idclase_formulario` int(11) DEFAULT NULL,
  `idfrm_actividades` int(11) DEFAULT NULL,
  `aprobo` char(1) DEFAULT 'N',
  PRIMARY KEY (`idactividad_perfil`),
  KEY `FK_actividad_perfil` (`idclase_formulario`),
  KEY `FK_actividad_perfil2` (`idfrm_actividades`),
  CONSTRAINT `FK_actividad_perfil` FOREIGN KEY (`idclase_formulario`) REFERENCES `clase_formularios` (`idclase_formulario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_actividad_perfil2` FOREIGN KEY (`idfrm_actividades`) REFERENCES `frm_prospectos` (`idfrm_actividades`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `actividad_perfil` */

insert  into `actividad_perfil`(`idactividad_perfil`,`idclase_formulario`,`idfrm_actividades`,`aprobo`) values (1,1,1,'S');

/*Table structure for table `actividades` */

DROP TABLE IF EXISTS `actividades`;

CREATE TABLE `actividades` (
  `idactividad` tinyint(2) NOT NULL AUTO_INCREMENT,
  `nom_actividad` varchar(45) NOT NULL,
  `icono` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idactividad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `actividades` */

insert  into `actividades`(`idactividad`,`nom_actividad`,`icono`,`descripcion`) values (1,'Contactar','extra/css/img/iconos prospeccion/Contactar.png','Primera Fase Prospectos');
insert  into `actividades`(`idactividad`,`nom_actividad`,`icono`,`descripcion`) values (2,'Presentar','extra/css/img/iconos prospeccion/Presentar.png','Segunda Fase Prospectos');
insert  into `actividades`(`idactividad`,`nom_actividad`,`icono`,`descripcion`) values (3,'Seguimiento','extra/css/img/iconos prospeccion/Seguimiento.png','Tercera Fase Prospectos');
insert  into `actividades`(`idactividad`,`nom_actividad`,`icono`,`descripcion`) values (4,'Cierre','extra/css/img/iconos prospeccion/Cierre.png','Si el prospecto se convence del negocio');
insert  into `actividades`(`idactividad`,`nom_actividad`,`icono`,`descripcion`) values (5,'Crece','extra/css/img/iconos prospeccion/Crece.png','Fase 1 Empresario Aprendiz');
insert  into `actividades`(`idactividad`,`nom_actividad`,`icono`,`descripcion`) values (6,'Aprende','extra/css/img/iconos prospeccion/Aprende.png','Fase 2 Empresario Aprendiz');
insert  into `actividades`(`idactividad`,`nom_actividad`,`icono`,`descripcion`) values (7,'Gana','extra/css/img/iconos prospeccion/Gana.png','Fase 3 Empresario Aprendiz');

/*Table structure for table `clase_formularios` */

DROP TABLE IF EXISTS `clase_formularios`;

CREATE TABLE `clase_formularios` (
  `idclase_formulario` int(11) NOT NULL AUTO_INCREMENT,
  `idactividad` tinyint(2) NOT NULL,
  `idtabla_perfil` varchar(1) NOT NULL,
  PRIMARY KEY (`idclase_formulario`),
  KEY `fk_formul_x_activi_actividades1_idx` (`idactividad`),
  KEY `fk_form_x_activi_formularios1_idx` (`idtabla_perfil`),
  CONSTRAINT `fk_formul_x_activi_actividades1` FOREIGN KEY (`idactividad`) REFERENCES `actividades` (`idactividad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `clase_formularios` */

insert  into `clase_formularios`(`idclase_formulario`,`idactividad`,`idtabla_perfil`) values (1,1,'A');
insert  into `clase_formularios`(`idclase_formulario`,`idactividad`,`idtabla_perfil`) values (2,2,'A');
insert  into `clase_formularios`(`idclase_formulario`,`idactividad`,`idtabla_perfil`) values (3,3,'A');
insert  into `clase_formularios`(`idclase_formulario`,`idactividad`,`idtabla_perfil`) values (4,4,'A');

/*Table structure for table `combos` */

DROP TABLE IF EXISTS `combos`;

CREATE TABLE `combos` (
  `idcombo` tinyint(2) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idcombo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `combos` */

insert  into `combos`(`idcombo`,`descripcion`) values (1,'Tipo de Persona');
insert  into `combos`(`idcombo`,`descripcion`) values (2,'Tipo de Documentos');
insert  into `combos`(`idcombo`,`descripcion`) values (3,'Perfil SEFIZ');
insert  into `combos`(`idcombo`,`descripcion`) values (4,'Jornadas');
insert  into `combos`(`idcombo`,`descripcion`) values (5,'Generos');
insert  into `combos`(`idcombo`,`descripcion`) values (6,'Planes');
insert  into `combos`(`idcombo`,`descripcion`) values (7,'Estado Civil');
insert  into `combos`(`idcombo`,`descripcion`) values (8,'Estados');
insert  into `combos`(`idcombo`,`descripcion`) values (9,'///////');

/*Table structure for table `control_material` */

DROP TABLE IF EXISTS `control_material`;

CREATE TABLE `control_material` (
  `idcontrol_material` smallint(6) NOT NULL AUTO_INCREMENT,
  `idmaterial` tinyint(4) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idcontrol_material`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `control_material` */

insert  into `control_material`(`idcontrol_material`,`idmaterial`,`descripcion`) values (1,1,'La Culpa es de la Vaca');
insert  into `control_material`(`idcontrol_material`,`idmaterial`,`descripcion`) values (2,1,'Como ser un Lider');
insert  into `control_material`(`idcontrol_material`,`idmaterial`,`descripcion`) values (3,1,'Como Ganar Dinero');
insert  into `control_material`(`idcontrol_material`,`idmaterial`,`descripcion`) values (4,1,'Como Vender');
insert  into `control_material`(`idcontrol_material`,`idmaterial`,`descripcion`) values (5,2,'Escucha tu Voz');
insert  into `control_material`(`idcontrol_material`,`idmaterial`,`descripcion`) values (6,2,'Aprende por ti mismo');
insert  into `control_material`(`idcontrol_material`,`idmaterial`,`descripcion`) values (7,2,'Escucha un Campeon');

/*Table structure for table `detalle_combo` */

DROP TABLE IF EXISTS `detalle_combo`;

CREATE TABLE `detalle_combo` (
  `iddetalle_combo` tinyint(2) NOT NULL AUTO_INCREMENT,
  `idcombo` tinyint(2) NOT NULL,
  `detalle_item` varchar(30) DEFAULT NULL,
  `valor_item` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`iddetalle_combo`),
  KEY `fk_detalle_combo_combos1_idx` (`idcombo`),
  CONSTRAINT `fk_detalle_combo_combos1` FOREIGN KEY (`idcombo`) REFERENCES `combos` (`idcombo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `detalle_combo` */

insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (1,1,'Prospecto','P');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (2,1,'Empresario','E');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (3,2,'Cedula Ciudadania','CC');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (4,2,'Registro Civil','RC');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (5,2,'Cedula Extranjeria','CE');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (6,2,'Adulto Sin Identificacion','AI');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (7,2,'Tarjeta de Identidad','TI');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (8,2,'Nit','NI');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (12,4,'Mañana','M');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (13,4,'Tarde','T');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (14,4,'Noche','N');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (15,5,'Hombre','HO');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (16,5,'Mujer','MU');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (17,6,'Premium','PR');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (18,6,'Platino','PL');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (19,6,'Empresario VIP','EV');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (20,6,'Consumidor VIP','CV');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (21,7,'Solter@','S');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (22,7,'Casad@','C');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (23,7,'Union LIbre','U');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (24,7,'Viud@','V');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (25,7,'Divorciad@','D');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (26,8,'Activo','A');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (27,8,'Inactivo','I');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (28,8,'Pendiente','P');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (29,8,'Aplazado 90 dias','X');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (30,3,'Prospecto','PR');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (31,3,'Aprendiz','AP');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (32,3,'Lider','LI');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (33,3,'Profesional','PF');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (34,9,'/////////////','//');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (35,9,'////////////','//');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (36,9,'///////////','//');
insert  into `detalle_combo`(`iddetalle_combo`,`idcombo`,`detalle_item`,`valor_item`) values (37,9,'///////////','//');

/*Table structure for table `frm_prospectos` */

DROP TABLE IF EXISTS `frm_prospectos`;

CREATE TABLE `frm_prospectos` (
  `idfrm_actividades` int(11) NOT NULL AUTO_INCREMENT,
  `idtitulo_actividad` tinyint(2) NOT NULL,
  `fech_deligenciado` date NOT NULL,
  `presento` char(1) DEFAULT 'N',
  `llamada` char(1) DEFAULT 'N',
  `visita` char(1) DEFAULT 'N',
  `idtema` tinyint(4) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `idjornada` varchar(3) NOT NULL,
  PRIMARY KEY (`idfrm_actividades`),
  KEY `fk_frm_control_personas1_idx` (`idpersona`),
  KEY `fk_frm_control_detalle_combo1_idx` (`idjornada`),
  KEY `FK_frm_actividades` (`idtitulo_actividad`),
  KEY `FK_frm_prospectos` (`idtema`),
  CONSTRAINT `FK_frm_actividades` FOREIGN KEY (`idtitulo_actividad`) REFERENCES `actividades` (`idactividad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_frm_control_personas1` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_frm_prospectos` FOREIGN KEY (`idtema`) REFERENCES `tema_perfil` (`idtema_perfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `frm_prospectos` */

insert  into `frm_prospectos`(`idfrm_actividades`,`idtitulo_actividad`,`fech_deligenciado`,`presento`,`llamada`,`visita`,`idtema`,`idpersona`,`idjornada`) values (1,1,'2016-06-22','S','S','N',1,6,'T');
insert  into `frm_prospectos`(`idfrm_actividades`,`idtitulo_actividad`,`fech_deligenciado`,`presento`,`llamada`,`visita`,`idtema`,`idpersona`,`idjornada`) values (2,2,'2016-06-28','S','S','S',2,6,'M');
insert  into `frm_prospectos`(`idfrm_actividades`,`idtitulo_actividad`,`fech_deligenciado`,`presento`,`llamada`,`visita`,`idtema`,`idpersona`,`idjornada`) values (3,1,'2016-06-28','S','S','S',1,7,'N');

/*Table structure for table `material` */

DROP TABLE IF EXISTS `material`;

CREATE TABLE `material` (
  `idmaterial` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nom_material` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmaterial`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `material` */

insert  into `material`(`idmaterial`,`nom_material`) values (1,'LIBRO');
insert  into `material`(`idmaterial`,`nom_material`) values (2,'CD');
insert  into `material`(`idmaterial`,`nom_material`) values (3,'DVD');
insert  into `material`(`idmaterial`,`nom_material`) values (4,'NINGUNO');

/*Table structure for table `material_x_frm` */

DROP TABLE IF EXISTS `material_x_frm`;

CREATE TABLE `material_x_frm` (
  `idmaterial_x_frm` int(11) NOT NULL AUTO_INCREMENT,
  `idfrm_actividades` int(11) NOT NULL,
  `idcontrol_material` smallint(6) NOT NULL,
  `fech_entrega` date NOT NULL,
  `fech_recibido` date NOT NULL,
  PRIMARY KEY (`idmaterial_x_frm`),
  KEY `fk_material_x_frm_frm_control1_idx` (`idfrm_actividades`),
  KEY `fk_material_x_frm_detalle_material1_idx` (`idcontrol_material`),
  CONSTRAINT `FK_material_x_frm` FOREIGN KEY (`idcontrol_material`) REFERENCES `control_material` (`idcontrol_material`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_material_x_frm2` FOREIGN KEY (`idfrm_actividades`) REFERENCES `frm_prospectos` (`idfrm_actividades`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `material_x_frm` */

insert  into `material_x_frm`(`idmaterial_x_frm`,`idfrm_actividades`,`idcontrol_material`,`fech_entrega`,`fech_recibido`) values (1,1,1,'2016-06-22','2016-06-27');

/*Table structure for table `niveles` */

DROP TABLE IF EXISTS `niveles`;

CREATE TABLE `niveles` (
  `idniveles` tinyint(2) NOT NULL AUTO_INCREMENT,
  `idtipo_persona` tinyint(2) NOT NULL,
  `nivel` varchar(2) NOT NULL,
  `orden` tinyint(2) NOT NULL,
  PRIMARY KEY (`idniveles`),
  KEY `FK_niveles` (`idtipo_persona`),
  CONSTRAINT `FK_niveles` FOREIGN KEY (`idtipo_persona`) REFERENCES `detalle_combo` (`iddetalle_combo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `niveles` */

insert  into `niveles`(`idniveles`,`idtipo_persona`,`nivel`,`orden`) values (1,1,'PR',1);
insert  into `niveles`(`idniveles`,`idtipo_persona`,`nivel`,`orden`) values (2,2,'AP',2);
insert  into `niveles`(`idniveles`,`idtipo_persona`,`nivel`,`orden`) values (3,2,'LI',3);
insert  into `niveles`(`idniveles`,`idtipo_persona`,`nivel`,`orden`) values (4,2,'PF',3);

/*Table structure for table `observaciones` */

DROP TABLE IF EXISTS `observaciones`;

CREATE TABLE `observaciones` (
  `idObservacion` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) DEFAULT NULL,
  `idpersona` int(11) DEFAULT NULL,
  `observacion` varchar(150) DEFAULT NULL,
  `fech_observacion` datetime DEFAULT NULL,
  `idrol` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`idObservacion`),
  KEY `FK_observaciones` (`idpersona`),
  CONSTRAINT `FK_observaciones` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `observaciones` */

/*Table structure for table `paisciudad` */

DROP TABLE IF EXISTS `paisciudad`;

CREATE TABLE `paisciudad` (
  `cod_pais` varchar(3) DEFAULT 'CO',
  `cod_departamento` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nom_departamento` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cod_municipio` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `cod_municipio2` varchar(10) DEFAULT NULL,
  `nom_municipio` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `cod_municipio_compuesto` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cod_municipio_compuesto_2` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_municipio_compuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paisciudad` */

insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','11','BOGOTA                                            ','111','001','BOGOTA','11111','11001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','131','001','CARTAGENA','13131','13001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13140','140','CALAMAR','1313140','13140');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13160','160','CANTAGALLO','1313160','13160');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13188','188','CICUCO','1313188','13188');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13212','212','CORDOBA','1313212','13212');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13222','222','CLEMENCIA','1313222','13222');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13244','235','EL CARMEN DE BOLIVAR','1313244','13235');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13248','248','EL GUAMO','1313248','13248');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13268','268','EL PEÑON','1313268','13268');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','1330','030','ALTOS DEL ROSARIO','131330','13030');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13300','300','HATILLO DE LOBA','1313300','13300');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','1342','042','ARENAL','131342','13042');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13430','430','MAGANGUE','1313430','13430');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13433','433','MAHATES','1313433','13433');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13440','440','MARGARITA','1313440','13440');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13442','442','MARIA LA BAJA','1313442','13442');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13458','458','MONTECRISTO','1313458','13458');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13468','468','MOMPOS','1313468','13468');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13473','473','MORALES','1313473','13473');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','1352','052','ARJONA','131352','13052');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13549','549','PINILLOS','1313549','13549');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13580','580','REGIDOR','1313580','13580');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','136','006','ACHI','13136','13006');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13600','600','RIO VIEJO','1313600','13600');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','1362','062','ARROYOHONDO','131362','13062');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13620','620','SAN CRISTOBAL','1313620','13620');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13647','647','SAN ESTANISLAO','1313647','13647');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13650','650','SAN FERNANDO','1313650','13650');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13654','654','SAN JACINTO','1313654','13654');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13655','655','SAN JACINTO DEL CAUCA','1313655','13655');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13657','657','SAN JUAN NEPOMUCENO','1313657','13657');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13667','667','SAN MARTIN DE LOBA','1313667','13667');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13670','670','SAN PABLO','1313670','13670');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13673','673','SANTA CATALINA','1313673','13673');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13683','683','SANTA ROSA','1313683','13683');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13688','688','SANTA ROSA DEL SUR','1313688','13688');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','1374','074','BARRANCO DE LOBA','131374','13074');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13744','744','SIMITI','1313744','13744');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13760','760','SOPLAVIENTO','1313760','13760');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13780','780','TALAIGUA NUEVO','1313780','13780');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13810','810','TIQUISIO','1313810','13810');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13836','836','TURBACO','1313836','13836');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13838','838','TURBANA','1313838','13838');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13873','873','VILLANUEVA','1313873','13873');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','13','BOLIVAR                                           ','13894','894','ZAMBRANO','1313894','13894');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','151','001','TUNJA','15151','15001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15104','104','BOYACA','1515104','15104');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15106','106','BRICEÑO','1515106','15106');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15109','109','BUENAVISTA','1515109','15109');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15114','114','BUSBANZA','1515114','15114');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15131','131','CALDAS','1515131','15131');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15135','135','CAMPOHERMOSO','1515135','15135');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15162','162','CERINZA','1515162','15162');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15172','172','CHINAVITA','1515172','15172');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15176','176','CHIQUINQUIRA','1515176','15176');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15180','180','CHISCAS','1515180','15180');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15183','183','CHITA','1515183','15183');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15185','185','CHITARAQUE','1515185','15185');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15187','187','CHIVATA','1515187','15187');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15189','189','CIENEGA','1515189','15189');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15204','204','COMBITA','1515204','15204');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15212','212','COPER','1515212','15212');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15215','215','CORRALES','1515215','15215');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15218','218','COVARACHIA','1515218','15218');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','1522','022','ALMEIDA','151522','15022');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15223','223','CUBARA','1515223','15223');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15224','224','CUCAITA','1515224','15224');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15226','226','CUITIVA','1515226','15226');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15232','232','CHIQUIZA','1515232','15232');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15236','236','CHIVOR','1515236','15236');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15238','238','DUITAMA','1515238','15238');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15244','244','EL COCUY','1515244','15244');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15248','248','EL ESPINO','1515248','15248');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15272','272','FIRAVITOBA','1515272','15272');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15276','276','FLORESTA','1515276','15276');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15293','293','GACHANTIVA','1515293','15293');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15296','296','GAMEZA','1515296','15296');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15299','299','GARAGOA','1515299','15299');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15317','317','GUACAMAYAS','1515317','15317');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15322','322','GUATEQUE','1515322','15322');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15325','325','GUAYATA','1515325','15325');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15332','332','GUICAN','1515332','15332');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15362','362','IZA','1515362','15362');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15367','367','JENESANO','1515367','15367');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15368','368','JERICO','1515368','15368');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15377','377','LABRANZAGRANDE','1515377','15377');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15380','380','LA CAPILLA','1515380','15380');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15401','401','LA VICTORIA','1515401','15401');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15403','403','LA UVITA','1515403','15403');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15407','407','LEIVA','1515407','15407');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15425','425','MACANAL','1515425','15425');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15442','442','MARIPI','1515442','15442');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15455','455','MIRAFLORES','1515455','15455');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15464','464','MONGUA','1515464','15464');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15466','466','MONGUI','1515466','15466');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15469','469','MONIQUIRA','1515469','15469');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','1547','047','AQUITANIA','151547','15047');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15476','476','MOTAVITA','1515476','15476');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15480','480','MUZO','1515480','15480');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15491','491','NOBSA','1515491','15491');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15494','494','NUEVO COLON','1515494','15494');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15500','500','OICATA','1515500','15500');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15507','507','OTANCHE','1515507','15507');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','1551','051','ARCABUCO','151551','15051');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15511','511','PACHAVITA','1515511','15511');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15514','514','PAEZ','1515514','15514');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15516','516','PAIPA','1515516','15516');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15518','518','PAJARITO','1515518','15518');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15522','522','PANQUEBA','1515522','15522');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15531','531','PAUNA','1515531','15531');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15533','533','PAYA','1515533','15533');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15537','537','PAZ DEL RIO','1515537','15537');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15542','542','PESCA','1515542','15542');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15550','550','PISBA','1515550','15550');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15572','572','PUERTO BOYACA','1515572','15572');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15580','580','QUIPAMA','1515580','15580');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15599','599','RAMIRIQUI','1515599','15599');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15600','600','RAQUIRA','1515600','15600');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15621','621','RONDON','1515621','15621');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15632','632','SABOYA','1515632','15632');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15638','638','SACHICA','1515638','15638');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15646','646','SAMACA','1515646','15646');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15660','660','SAN EDUARDO','1515660','15660');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15664','664','SAN JOSE DE PARE','1515664','15664');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15667','667','SAN LUIS DE GACENO','1515667','15667');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15673','673','SAN MATEO','1515673','15673');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15676','676','SAN MIGUEL DE SEMA','1515676','15676');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15681','681','SAN PABLO DE BORBUR','1515681','15681');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15686','686','SANTANA','1515686','15686');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15690','690','SANTA MARIA','1515690','15690');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15693','693','SANTA ROSA DE VITERBO','1515693','15693');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15696','696','SANTA SOFIA','1515696','15696');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15720','720','SATIVANORTE','1515720','15720');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15723','723','SATIVASUR','1515723','15723');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15740','740','SIACHOQUE','1515740','15740');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15753','753','SOATA','1515753','15753');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15755','755','SOCOTA','1515755','15755');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15757','757','SOCHA','1515757','15757');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15759','759','SOGAMOSO','1515759','15759');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15761','761','SOMONDOCO','1515761','15761');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15762','762','SORA','1515762','15762');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15763','763','SOTAQUIRA','1515763','15763');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15764','764','SORACA','1515764','15764');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15774','774','SUSACON','1515774','15774');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15776','776','SUTAMARCHAN','1515776','15776');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15778','778','SUTATENZA','1515778','15778');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15790','790','TASCO','1515790','15790');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15798','798','TENZA','1515798','15798');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15804','804','TIBANA','1515804','15804');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15806','806','TIBASOSA','1515806','15806');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15808','808','TINJACA','1515808','15808');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15810','810','TIPACOQUE','1515810','15810');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15814','814','TOCA','1515814','15814');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15816','816','TOGUI','1515816','15816');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15820','820','TOPAGA','1515820','15820');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15822','822','TOTA','1515822','15822');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15832','832','TUNUNGUA','1515832','15832');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15835','835','TURMEQUE','1515835','15835');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15837','837','TUTA','1515837','15837');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15839','839','TUTASA','1515839','15839');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15842','842','UMBITA','1515842','15842');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15861','861','VENTAQUEMADA','1515861','15861');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','1587','087','BELEN','151587','15087');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15879','879','VIRACACHA','1515879','15879');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','15897','897','ZETAQUIRA','1515897','15897');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','1590','090','BERBEO','151590','15090');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','1592','092','BETEITIVA','151592','15092');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','15','BOYACA                                            ','1597','097','BOAVITA','151597','15097');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','171','001','MANIZALES','17171','17001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','1713','013','AGUADAS','171713','17013');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17174','174','CHINCHINA','1717174','17174');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17272','272','FILADELFIA','1717272','17272');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17380','380','LA DORADA','1717380','17380');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17388','388','LA MERCED','1717388','17388');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','1742','042','ANSERMA','171742','17042');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17433','433','MANZANARES','1717433','17433');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17442','442','MARMATO','1717442','17442');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17444','444','MARQUETALIA','1717444','17444');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17446','446','MARULANDA','1717446','17446');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17486','486','NEIRA','1717486','17486');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17495','495','NORCASIA','1717495','17495');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','1750','050','ARANZAZU','171750','17050');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17513','513','PACORA','1717513','17513');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17524','524','PALESTINA','1717524','17524');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17541','541','PENSILVANIA','1717541','17541');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17614','614','RIOSUCIO','1717614','17614');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17616','616','RISARALDA','1717616','17616');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17653','653','SALAMINA','1717653','17653');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17662','662','SAMANA','1717662','17662');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17665','665','SAN JOSE','1717665','17665');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17777','777','SUPIA','1717777','17777');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17867','867','VICTORIA','1717867','17867');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17873','873','VILLAMARIA','1717873','17873');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','17877','877','VITERBO','1717877','17877');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','17','CALDAS                                            ','1788','088','BELALCAZAR','171788','17088');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','181','001','FLORENCIA','18181','18001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18150','150','CARTAGENA DEL CHAIRA','1818150','18150');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18205','205','CURILLO','1818205','18205');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18247','247','EL DONCELLO','1818247','18247');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18256','256','EL PAUJIL','1818256','18256');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','1829','029','ALBANIA','181829','18029');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18410','410','LA MONTAÑITA','1818410','18410');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18460','460','MILAN','1818460','18460');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18479','479','MORELIA','1818479','18479');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18592','592','PUERTO RICO','1818592','18592');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18610','610','SAN JOSE DE FRAGUA','1818610','18610');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18753','753','SAN  VICENTE DEL CAGUAN','1818753','18753');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18756','756','SOLANO','1818756','18756');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18785','785','SOLITA','1818785','18785');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','18860','860','VALPARAISO','1818860','18860');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','18','CAQUETA                                           ','1894','094','BELEN ANDAQUIES','181894','18094');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','191','001','POPAYAN','19191','19001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19100','100','BOLIVAR','1919100','19100');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19110','110','BUENOS AIRES','1919110','19110');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19130','130','CAJIBIO','1919130','19130');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19137','137','CALDONO','1919137','19137');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19142','142','CALOTO','1919142','19142');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19212','212','CORINTO','1919212','19212');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','1922','022','ALMAGUER','191922','19022');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19256','256','EL TAMBO','1919256','19256');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19290','290','FLORENCIA','1919290','19290');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19318','318','GUAPI','1919318','19318');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19355','355','INZA','1919355','19355');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19364','364','JAMBALO','1919364','19364');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19392','392','LA SIERRA','1919392','19392');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19397','397','LA VEGA','1919397','19397');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19418','418','LOPEZ','1919418','19418');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19450','450','MERCADERES','1919450','19450');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19455','455','MIRANDA','1919455','19455');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19473','473','MORALES','1919473','19473');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','1950','050','ARGELIA','191950','19050');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19513','513','PADILLA','1919513','19513');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19517','517','PAEZ','1919517','19517');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19532','532','PATIA (EL BORDO)','1919532','19532');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19533','533','PIAMONTE','1919533','19533');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19548','548','PIENDAMO','1919548','19548');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19573','573','PUERTO TEJADA','1919573','19573');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19585','585','PURACE','1919585','19585');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19622','622','ROSAS','1919622','19622');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19693','693','SAN SEBASTIAN','1919693','19693');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19698','698','SANTANDER DE QUILICHAO','1919698','19698');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19701','701','SANTA ROSA','1919701','19701');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19743','743','SILVIA','1919743','19743');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','1975','075','BALBOA','191975','19075');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19760','760','SOTARA','1919760','19760');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19780','780','SUAREZ','1919780','19780');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19785','785','SUCRE','1919785','19785');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19807','807','TIMBIO','1919807','19807');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19809','809','TIMBIQUI','1919809','19809');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19821','821','TORIBIO','1919821','19821');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19824','824','TOTORO','1919824','19824');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','19','CAUCA                                             ','19845','845','VILLA RICA','1919845','19845');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','201','001','VALLEDUPAR','20201','20001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','2011','011','AGUACHICA','202011','20011');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','2013','013','AGUSTIN CODAZZI','202013','20013');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20175','175','CHIMICHAGUA','2020175','20175');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20178','178','CHIRIGUANA','2020178','20178');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20228','228','CURUMANI','2020228','20228');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20238','238','EL COPEY','2020238','20238');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20250','250','EL PASO','2020250','20250');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20295','295','GAMARRA','2020295','20295');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20310','310','GONZALEZ','2020310','20310');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','2032','032','ASTREA','202032','20032');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20383','383','LA GLORIA','2020383','20383');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20400','400','LA JAGUA IBIRICO','2020400','20400');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20443','443','MANAURE BALCON DEL CESAR','2020443','20443');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','2045','045','BECERRIL','202045','20045');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20517','517','PAILITAS','2020517','20517');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20550','550','PELAYA','2020550','20550');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20570','570','PUEBLO BELLO','2020570','20570');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','2060','060','BOSCONIA','202060','20060');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20614','614','RIO DE ORO','2020614','20614');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20621','621','ROBLES (LA PAZ)','2020621','20621');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20710','710','SAN ALBERTO','2020710','20710');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20750','750','SAN DIEGO','2020750','20750');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20770','770','SAN MARTIN','2020770','20770');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','20','CESAR                                             ','20787','787','TAMALAMEQUE','2020787','20787');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','231','001','MONTERIA','23231','23001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23162','162','CERETE','2323162','23162');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23168','168','CHIMA','2323168','23168');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23182','182','CHINU','2323182','23182');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23189','189','CIENAGA DE ORO','2323189','23189');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23300','300','COTORRA','2323300','23300');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23350','350','LA APARTADA','2323350','23350');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23417','417','LORICA','2323417','23417');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23419','419','LOS CORDOBAS','2323419','23419');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23464','464','MOMIL','2323464','23464');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23466','466','MONTELIBANO','2323466','23466');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23500','500','MO','2323500','23500');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23555','555','PLANETA RICA','2323555','23555');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23570','570','PUEBLO NUEVO','2323570','23570');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23574','574','PUERTO ESCONDIDO','2323574','23574');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23580','580','PUERTO LIBERTADOR','2323580','23580');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23586','586','PURISIMA','2323586','23586');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23660','660','SAHAGUN','2323660','23660');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23670','670','SAN ANDRES SOTAVENTO','2323670','23670');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23672','672','SAN ANTERO','2323672','23672');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23675','675','SAN BERNARDO VIENTO','2323675','23675');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23678','678','SAN CARLOS','2323678','23678');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','2368','068','AYAPEL','232368','23068');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23686','686','SAN PELAYO','2323686','23686');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','2379','109','BUENAVISTA','232379','23109');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23807','807','TIERRALTA','2323807','23807');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23855','855','VALENCIA','2323855','23855');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','2390','090','CANALETE','232390','23090');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','23','CORDOBA                                           ','23991','991','CERROMATOSO','2323991','23991');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','251','001','AGUA DE DIOS','25251','25001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25120','120','CABRERA','2525120','25120');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25123','123','CACHIPAY','2525123','25123');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25126','126','CAJICA','2525126','25126');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25148','148','CAPARRAPI','2525148','25148');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25151','151','CAQUEZA','2525151','25151');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25154','154','CARMEN DE CARUPA','2525154','25154');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25168','168','CHAGUANI','2525168','25168');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25175','175','CHIA','2525175','25175');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25178','178','CHIPAQUE','2525178','25178');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25181','181','CHOACHI','2525181','25181');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25183','183','CHOCONTA','2525183','25183');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','2519','019','ALBAN','252519','25019');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25200','200','COGUA','2525200','25200');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25214','214','COTA','2525214','25214');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25224','224','CUCUNUBA','2525224','25224');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25245','245','EL COLEGIO','2525245','25245');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25258','258','EL PE','2525258','25258');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25260','260','EL ROSAL','2525260','25260');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25269','269','FACATATIVA','2525269','25269');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25279','279','FOMEQUE','2525279','25279');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25281','281','FOSCA','2525281','25281');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25286','286','FUNZA','2525286','25286');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25288','288','FUQUENE','2525288','25288');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25290','290','FUSAGASUGA','2525290','25290');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25293','293','GACHALA','2525293','25293');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25295','295','GACHANCIPA','2525295','25295');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25297','297','GACHETA','2525297','25297');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25299','299','GAMA','2525299','25299');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25307','307','GIRARDOT','2525307','25307');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25312','312','GRANADA','2525312','25312');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25317','317','GUACHETA','2525317','25317');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25320','320','GUADUAS','2525320','25320');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25322','322','GUASCA','2525322','25322');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25324','324','GUATAQUI','2525324','25324');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25326','326','GUATAVITA','2525326','25326');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25328','328','GUAYABAL DE SIQUIMA','2525328','25328');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25335','335','GUAYABETAL','2525335','25335');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25339','339','GUTIERREZ','2525339','25339');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','2535','035','ANAPOIMA','252535','25035');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25368','368','JERUSALEN','2525368','25368');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25372','372','JUNIN','2525372','25372');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25377','377','LA CALERA','2525377','25377');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25386','386','LA MESA','2525386','25386');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25394','394','LA PALMA','2525394','25394');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25398','398','LA PE','2525398','25398');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','2540','040','ANOLAIMA','252540','25040');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25402','402','LA VEGA','2525402','25402');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25407','407','LENGUAZAQUE','2525407','25407');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25426','426','MACHETA','2525426','25426');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25430','430','MADRID','2525430','25430');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25436','436','MANTA','2525436','25436');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25438','438','MEDINA','2525438','25438');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25473','473','MOSQUERA','2525473','25473');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25483','483','NARI','2525483','25483');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25486','486','NEMOCON','2525486','25486');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25488','488','NILO','2525488','25488');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25489','489','NIMAIMA','2525489','25489');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25491','491','NOCAIMA','2525491','25491');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25506','506','OSPINA PEREZ','2525506','25506');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25513','513','PACHO','2525513','25513');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25518','518','PAIME','2525518','25518');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25524','524','PANDI','2525524','25524');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','2553','053','ARBELAEZ','252553','25053');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25530','530','PARATEBUENO','2525530','25530');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25535','535','PASCA','2525535','25535');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25572','572','PUERTO SALGAR','2525572','25572');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25580','580','PULI','2525580','25580');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25592','592','QUEBRADANEGRA','2525592','25592');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25594','594','QUETAME','2525594','25594');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25596','596','QUIPILE','2525596','25596');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25599','599','RAFAEL REYES','2525599','25599');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25612','612','RICAURTE','2525612','25612');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25645','645','SAN  ANTONIO DEL  TEQUENDAMA','2525645','25645');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25649','649','SAN BERNARDO','2525649','25649');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25653','653','SAN CAYETANO','2525653','25653');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25658','658','SAN FRANCISCO','2525658','25658');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25662','662','SAN JUAN DE RIOSECO','2525662','25662');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25718','718','SASAIMA','2525718','25718');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25736','736','SESQUILE','2525736','25736');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25740','740','SIBATE','2525740','25740');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25743','743','SILVANIA','2525743','25743');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25745','745','SIMIJACA','2525745','25745');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25754','754','SOACHA','2525754','25754');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25758','758','SOPO','2525758','25758');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25769','769','SUBACHOQUE','2525769','25769');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25772','772','SUESCA','2525772','25772');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25777','777','SUPATA','2525777','25777');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25779','779','SUSA','2525779','25779');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25781','781','SUTATAUSA','2525781','25781');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25785','785','TABIO','2525785','25785');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25793','793','TAUSA','2525793','25793');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25797','797','TENA','2525797','25797');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25799','799','TENJO','2525799','25799');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25805','805','TIBACUY','2525805','25805');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25807','807','TIBIRITA','2525807','25807');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25815','815','TOCAIMA','2525815','25815');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25817','817','TOCANCIPA','2525817','25817');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25823','823','TOPAIPI','2525823','25823');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25839','839','UBALA','2525839','25839');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25841','841','UBAQUE','2525841','25841');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25843','843','UBATE','2525843','25843');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25845','845','UNE','2525845','25845');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25851','851','UTICA','2525851','25851');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','2586','086','BELTRAN','252586','25086');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25862','862','VERGARA','2525862','25862');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25867','867','VIANI','2525867','25867');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25871','871','VILLAGOMEZ','2525871','25871');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25873','873','VILLAPINZON','2525873','25873');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25875','875','VILLETA','2525875','25875');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25878','878','VIOTA','2525878','25878');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25885','885','YACOPI','2525885','25885');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25898','898','ZIPACON','2525898','25898');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','25899','899','ZIPAQUIRA','2525899','25899');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','2595','095','BITUIMA','252595','25095');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','25','CUNDINAMARCA                                      ','2599','099','BOJACA','252599','25099');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','271','001','QUIBDO','27271','27001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27135',NULL,'CANTOM DE SAN PABLO','2727135',NULL);
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27150','150','CARMEN DEL DARIEN','2727150','27150');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27160','160','CERTEGUI','2727160','27160');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27205','205','CONDOTO','2727205','27205');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27245','245','EL CARMEN','2727245','27245');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','2725','025','ALTO BAUDO (PIE DE PATO)','272725','27025');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27250','250','LITORAL DEL SAN JUAN','2727250','27250');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27361','361','ITSMINA','2727361','27361');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27372','372','JURADO','2727372','27372');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27413','413','LLORO','2727413','27413');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27425','425','MEDIO ATRATO','2727425','27425');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27430','430','MEDIO BAUDO (BOCA DE PEPE)','2727430','27430');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27450','450','MEDIO SAN JUAN','2727450','27450');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27491','491','NOVITA','2727491','27491');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27495','495','NUQUI','2727495','27495');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','2750','050','ATRATO','272750','27050');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27580','580','RIO IRO','2727580','27580');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','276','006','ACANDI','27276','27006');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27600','600','RIOI QUITO','2727600','27600');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27615','615','RIOSUCIO','2727615','27615');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27660','660','SAN JOSE DEL PALMAR','2727660','27660');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','2773','073','BAGADO','272773','27073');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27745','745','SIPI','2727745','27745');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','2775','075','BAHIA SOLANO (MUTIS)','272775','27075');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','2777','077','BAJO BAUDO (PIZARRO)','272777','27077');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27787','787','TADO','2727787','27787');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27800','800','UNGUIA','2727800','27800');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','27810','810','UNION PARAMERICANA','2727810','27810');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','27','CHOCO                                             ','2799','099','BOJAYA (BELLAVISTA)','272799','27099');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','411','001','NEIVA','41411','41001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','4113','013','AGRADO','414113','41013');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41132','132','CAMPOALEGRE','4141132','41132');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','4116','016','AIPE','414116','41016');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','4120','020','ALGECIRAS','414120','41020');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41206','206','COLOMBIA','4141206','41206');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41244','244','ELIAS','4141244','41244');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','4126','026','ALTAMIRA','414126','41026');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41298','298','GARZON','4141298','41298');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41306','306','GIGANTE','4141306','41306');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41319','319','GUADALUPE','4141319','41319');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41349','349','HOBO','4141349','41349');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41357','357','IQUIRA','4141357','41357');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41359','359','ISNOS','4141359','41359');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41378','378','LA ARGENTINA','4141378','41378');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41396','396','LA PLATA','4141396','41396');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41483','483','NATAGA','4141483','41483');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41503','503','OPORAPA','4141503','41503');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41518','518','PAICOL','4141518','41518');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41524','524','PALERMO','4141524','41524');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41530','530','PALESTINA','4141530','41530');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41548','548','PITAL','4141548','41548');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41551','551','PITALITO','4141551','41551');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','416','006','ACEVEDO','41416','41006');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41615','615','RIVERA','4141615','41615');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41660','660','SALADOBLANCO','4141660','41660');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41668','668','SAN AGUSTIN','4141668','41668');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41676','676','SANTA MARIA','4141676','41676');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41770','770','SUAZA','4141770','41770');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','4178','078','BARAYA','414178','41078');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41791','791','TARQUI','4141791','41791');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41797','797','TESALIA','4141797','41797');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41799','799','TELLO','4141799','41799');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41801','801','TERUEL','4141801','41801');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41807','807','TIMANA','4141807','41807');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41872','872','VILLAVIEJA','4141872','41872');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','41','HUILA                                             ','41885','885','YAGUARA','4141885','41885');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','441','001','RIOHACHA','44441','44001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44110','110','EL MOLINO','4444110','44110');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44279','279','FONSECA','4444279','44279');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','4435','035','ALBANIA','444435','44035');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44378','378','HATONUEVO','4444378','44378');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44420','420','LA JAGUA DEL PILAR','4444420','44420');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44430','430','MAICAO','4444430','44430');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44560','560','MANAURE','4444560','44560');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44650','650','SAN JUAN DEL CESAR','4444650','44650');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','4478','078','BARRANCAS','444478','44078');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44847','847','URIBIA','4444847','44847');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44855','855','URUMITA','4444855','44855');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','44874','874','VILLANUEVA','4444874','44874');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','4490','090','DIBULLA','444490','44090');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','44','LA GUAJIRA                                        ','4498','098','DISTRACCION','444498','44098');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','471','001','SANTA MARTA','47471','47001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47161','161','CERRO SAN ANTONIO','4747161','47161');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47170','170','CHIVOLO','4747170','47170');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47189','189','CIENAGA','4747189','47189');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47205','205','CONCORDIA','4747205','47205');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47245','245','EL BANCO','4747245','47245');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47258','258','EL PI','4747258','47258');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47268','268','EL RETEN','4747268','47268');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47288','288','FUNDACION','4747288','47288');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','4730','030','ALGARROBO','474730','47030');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47318','318','GUAMAL','4747318','47318');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47460','460','NUEVA GRANADA','4747460','47460');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','4753','053','ARACATACA','474753','47053');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47541','541','PEDRAZA','4747541','47541');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47545','545','PIJI','4747545','47545');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47551','551','PIVIJAY','4747551','47551');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47555','555','PLATO','4747555','47555');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47570','570','PUEBLOVIEJO','4747570','47570');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','4758','058','ARIGUANI','474758','47058');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47605','605','REMOLINO','4747605','47605');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47660','660','SABANAS DE SAN ANGEL','4747660','47660');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47675','675','SALAMINA','4747675','47675');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47692','692','SAN SEBASTIAN DE BUENAVISTA','4747692','47692');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47703','703','SAN ZENON','4747703','47703');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47707','707','SANTA ANA','4747707','47707');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47720','720','SANTA BARBARA DE PINTO','4747720','47720');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47745','745','SITIONUEVO','4747745','47745');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47798','798','TENERIFE','4747798','47798');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47960','960','ZAPAYAN','4747960','47960');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','47','MAGDALENA                                         ','47980','980','ZONA BANANERA','4747980','47980');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','501','001','VILLAVICENCIO','50501','50001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50110','110','BARRANCA DE UPIA','5050110','50110');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50124','124','CABUYARO','5050124','50124');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50150','150','CASTILLA LA NUEVA','5050150','50150');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50223','223','CUBARRAL','5050223','50223');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50226','226','CUMARAL','5050226','50226');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50245','245','EL CALVARIO','5050245','50245');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50251','251','EL CASTILLO','5050251','50251');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50270','270','EL DORADO','5050270','50270');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50287','287','FUENTE DE ORO','5050287','50287');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50313','313','GRANADA','5050313','50313');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50318','318','GUAMAL','5050318','50318');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50325','325','MAPIRIPAN','5050325','50325');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50330','330','MESETAS','5050330','50330');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50350','350','LA MACARENA','5050350','50350');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50370','370','LA URIBE','5050370','50370');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50400','400','LEJANIAS','5050400','50400');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50450','450','PUERTO CONCORDIA','5050450','50450');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50568','568','PUERTO GAITAN','5050568','50568');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50573','573','PUERTO LOPEZ','5050573','50573');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50577','577','PUERTO LLERAS','5050577','50577');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50590','590','PUERTO RICO','5050590','50590');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','506','006','ACACIAS','50506','50006');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50606','606','RESTREPO','5050606','50606');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50680','680','SAN CARLOS GUAROA','5050680','50680');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50683','683','SAN  JUAN DE ARAMA','5050683','50683');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50686','686','SAN JUANITO','5050686','50686');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50689','689','SAN MARTIN','5050689','50689');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','50','META                                              ','50711','711','VISTA HERMOSA','5050711','50711');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARINO','001','001','PASTO','52001','52001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52110','110','BUESACO','5252110','52110');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','5219','019','ALBAN','525219','52019');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52203','203','COLON(GENOVA)','5252203','52203');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52207','207','CONSACA','5252207','52207');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52210','210','CONTADERO','5252210','52210');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52215','215','CORDOBA','5252215','52215');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','5222','022','ALDANA','525222','52022');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52224','224','CUASPUD','5252224','52224');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52227','227','CUMBAL','5252227','52227');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52233','233','CUMBITARA','5252233','52233');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52240','249','CHACHAGUI','5252240','52249');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52250','250','EL CHARCO','5252250','52250');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52254','254','EL PE','5252254','52254');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52256','256','EL ROSARIO','5252256','52256');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52258','258','EL TABLON','5252258','52258');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52260','260','EL TAMBO','5252260','52260');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52287','287','FUNES','5252287','52287');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52317','317','GUACHUCAL','5252317','52317');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52320','320','GUAITARILLA','5252320','52320');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52323','323','GUALMATAN','5252323','52323');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52352','352','ILES','5252352','52352');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52354','354','IMUES','5252354','52354');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52356','356','IPIALES','5252356','52356');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','5236','036','ANCUYA','525236','52036');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52378','378','LA CRUZ','5252378','52378');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52381','381','LA FLORIDA','5252381','52381');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52385','385','LA LLANADA','5252385','52385');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52390','390','LA TOLA','5252390','52390');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52399','399','LA UNION','5252399','52399');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52405','405','LEIVA','5252405','52405');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52411','411','LINARES','5252411','52411');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52418','418','LOS ANDES','5252418','52418');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52427','427','MAGUI','5252427','52427');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52435','435','MALLAMA','5252435','52435');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52473','473','MOSQUERA','5252473','52473');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52480','480','NARI','5252480','52480');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52490','490','OLAYA HERRERA','5252490','52490');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52506','506','OSPINA','5252506','52506');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','5251','051','ARBOLEDA','525251','52051');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52520','520','PIZARRO','5252520','52520');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52540','540','POLICARPA','5252540','52540');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52560','560','POTOSI','5252560','52560');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52565','565','PROVIDENCIA','5252565','52565');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52573','573','PUERRES','5252573','52573');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52585','585','PUPIALES','5252585','52585');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52612','612','RICAURTE','5252612','52612');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52621','621','ROBERTO PAYAN','5252621','52621');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52678','678','SAMANIEGO','5252678','52678');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52683','683','SANDONA','5252683','52683');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52685','685','SAN BERNARDO','5252685','52685');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52687','687','SAN LORENZO','5252687','52687');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52693','693','SAN PABLO','5252693','52693');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52694','694','SAN PEDRO DE CARTAGO','5252694','52694');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52696','696','SANTA BARBARA','5252696','52696');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52699','699','SANTACRUZ','5252699','52699');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52720','720','SAPUYES','5252720','52720');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52786','786','TAMINANGO','5252786','52786');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52788','788','TANGUA','5252788','52788');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','5279','079','BARBACOAS','525279','52079');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','5283','083','BELEN','525283','52083');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52835','835','TUMACO','5252835','52835');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52838','838','TUQUERRES','5252838','52838');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','52','NARIÑO','52885','885','YACUANQUER','5252885','52885');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','541','001','CUCUTA','54541','54001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54109','109','BUCARASICA','5454109','54109');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54125','125','CACOTA','5454125','54125');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54128','128','CACHIRA','5454128','54128');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54172','172','CHINACOTA','5454172','54172');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54174','174','CHITAGA','5454174','54174');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54206','206','CONVENCION','5454206','54206');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54223','223','CUCUTILLA','5454223','54223');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54239','239','DURANIA','5454239','54239');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54245','245','EL CARMEN','5454245','54245');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54250','250','EL TARRA','5454250','54250');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54261','261','EL ZULIA','5454261','54261');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','543','003','ABREGO','54543','54003');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54313','313','GRAMALOTE','5454313','54313');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54344','344','HACARI','5454344','54344');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54347','347','HERRAN','5454347','54347');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54377','377','LABATECA','5454377','54377');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54385','385','LA ESPERANZA','5454385','54385');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54398','398','LA PLAYA','5454398','54398');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54405','405','LOS PATIOS','5454405','54405');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54418','418','LOURDES','5454418','54418');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54480','480','MUTISCUA','5454480','54480');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54498','498','OCA','5454498','54498');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','5451','051','ARBOLEDAS','545451','54051');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54518','518','PAMPLONA','5454518','54518');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54520','520','PAMPLONITA','5454520','54520');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54553','553','PUERTO SANTANDER','5454553','54553');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54599','599','RAGONVALIA','5454599','54599');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54660','660','SALAZAR','5454660','54660');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54670','670','SAN CALIXTO','5454670','54670');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54673','673','SAN CAYETANO','5454673','54673');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54680','680','SANTIAGO','5454680','54680');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54720','720','SARDINATA','5454720','54720');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54743','743','SILOS','5454743','54743');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54800','800','TEORAMA','5454800','54800');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54810','810','TIBU','5454810','54810');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54820','820','TOLEDO','5454820','54820');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54871','871','VILLACARO','5454871','54871');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','54874','874','VILLA DEL ROSARIO','5454874','54874');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','54','NORTE DE SANTANDER                                ','5499','099','BOCHALEMA','545499','54099');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','51','001','MEDELLIN','551','05001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5101',NULL,'BOLIVAR','55101',NULL);
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5107','107','BRICEÑO','55107','05107');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5113','113','BURITICA','55113','05113');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5120','120','CACERES','55120','05120');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5125','125','CAICEDO','55125','05125');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5129','129','CALDAS','55129','05129');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5134','134','CAMPAMENTO','55134','05134');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5138',NULL,'CA','55138',NULL);
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5142','142','CARACOLI','55142','05142');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5145','145','CARAMANTA','55145','05145');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5147','147','CAREPA','55147','05147');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5148',NULL,'CARMEN DE VIBORAL','55148',NULL);
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5150','150','CAROLINA','55150','05150');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5154','154','CAUCASIA','55154','05154');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5172','172','CHIGORODO','55172','05172');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5190','190','CISNEROS','55190','05190');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5197','197','COCORNA','55197','05197');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','52','002','ABEJORRAL','552','05002');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5206','206','CONCEPCION','55206','05206');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5209','209','CONCORDIA','55209','05209');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','521','021','ALEJANDRIA','5521','05021');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5212','212','COPACABANA','55212','05212');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5234','234','DABEIBA','55234','05234');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5237','237','DON MATIAS','55237','05237');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5240','240','EBEJICO','55240','05240');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5250','250','EL BAGRE','55250','05250');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5264','264','ENTRERRIOS','55264','05264');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5266','266','ENVIGADO','55266','05266');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5282','282','FREDONIA','55282','05282');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5284','284','FRONTINO','55284','05284');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','530','030','AMAGA','5530','05030');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5306','306','GIRALDO','55306','05306');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5308','308','GIRARDOTA','55308','05308');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','531','031','AMALFI','5531','05031');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5310','310','GOMEZ PLATA','55310','05310');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5313','313','GRANADA','55313','05313');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5315','315','GUADALUPE','55315','05315');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5318','318','GUARNE','55318','05318');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5321','321','GUATAPE','55321','05321');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','534','034','ANDES','5534','05034');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5347','347','HELICONIA','55347','05347');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5353','353','HISPANIA','55353','05353');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','536','036','ANGELOPOLIS','5536','05036');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5360','360','ITAGUI','55360','05360');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5361','361','ITUANGO','55361','05361');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5364','364','JARDIN','55364','05364');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5368','368','JERICO','55368','05368');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5376','376','LA CEJA','55376','05376');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','538','038','ANGOSTURA','5538','05038');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5380','380','LA ESTRELLA','55380','05380');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5390','390','LA PINTADA','55390','05390');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','54','004','ABRIAQUI','554','05004');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','540','040','ANORI','5540','05040');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5400','400','LA UNION','55400','05400');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5411','411','LIBORINA','55411','05411');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','542',NULL,'ANTIOQUIA','5542',NULL);
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5425','425','MACEO','55425','05425');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','544','044','ANZA','5544','05044');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5440','440','MARINILLA','55440','05440');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','545','045','APARTADO','5545','05045');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5467','467','MONTEBELLO','55467','05467');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5475','475','MURINDO','55475','05475');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5480','480','MUTATA','55480','05480');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5483','483','NARI','55483','05483');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5490','490','NECOCLI','55490','05490');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5495','495','NECHI','55495','05495');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5501','501','OLAYA','55501','05501');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','551','051','ARBOLETES','5551','05051');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5541','541','PE','55541','05541');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5543','543','PEQUE','55543','05543');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','555','055','ARGELIA','5555','05055');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5576','576','PUEBLORRICO','55576','05576');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5579','579','PUERTO BERRIO','55579','05579');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5585','585','PUERTO NARE (LA MAGDALENA)','55585','05585');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','559','059','ARMENIA','5559','05059');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5591','591','PUERTO TRIUNFO','55591','05591');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5604','604','REMEDIOS','55604','05604');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5607','607','RETIRO','55607','05607');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5615','615','RIONEGRO','55615','05615');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5628','628','SABANALARGA','55628','05628');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5631','631','SABANETA','55631','05631');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5642','642','SALGAR','55642','05642');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5647','647','SAN ANDRES','55647','05647');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5649','649','SAN CARLOS','55649','05649');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5652','652','SAN FRANCISCO','55652','05652');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5656','656','SAN JERONIMO','55656','05656');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5658','658','SAN JOSE DE LA MONTA','55658','05658');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5659','659','SAN JUAN DE URABA','55659','05659');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5660','660','SAN LUIS','55660','05660');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5664','664','SAN PEDRO','55664','05664');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5665','665','SAN PEDRO DE URABA','55665','05665');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5667','667','SAN RAFAEL','55667','05667');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5670','670','SAN ROQUE','55670','05670');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5674','674','SAN VICENTE','55674','05674');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5679','679','SANTA BARBARA','55679','05679');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5686','686','SANTA ROSA DE OSOS','55686','05686');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5690','690','SANTO DOMINGO','55690','05690');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5697','697','SANTUARIO','55697','05697');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5736','736','SEGOVIA','55736','05736');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5756','756','SONSON','55756','05756');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5761','761','SOPETRAN','55761','05761');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5789','789','TAMESIS','55789','05789');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','579','079','BARBOSA','5579','05079');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5790','790','TARAZA','55790','05790');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5792','792','TARSO','55792','05792');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5809','809','TITIRIBI','55809','05809');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5819','819','TOLEDO','55819','05819');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5837','837','TURBO','55837','05837');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5842','842','URAMITA','55842','05842');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5847','847','URRAO','55847','05847');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5854','854','VALDIVIA','55854','05854');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5856','856','VALPARAISO','55856','05856');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5858','858','VEGACHI','55858','05858');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','586','086','BELMIRA','5586','05086');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5861','506','VENECIA','55861','05506');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5873','873','VIGIA DEL FUERTE','55873','05873');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','588','088','BELLO','5588','05088');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5885','885','YALI','55885','05885');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5887','887','YARUMAL','55887','05887');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5890','890','YOLOMBO','55890','05890');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5893','893','YONDO','55893','05893');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','5895','895','ZARAGOZA','55895','05895');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','591','091','BETANIA','5591','05091');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','05','ANTIOQUIA                                         ','593','093','BETULIA','5593','05093');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','631','001','ARMENIA','63631','63001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63111','111','BUENAVISTA','6363111','63111');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63130','130','CALARCA','6363130','63130');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63190','190','CIRCASIA','6363190','63190');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63212','212','CORDOBA','6363212','63212');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63272','272','FILANDIA','6363272','63272');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63302','302','GENOVA','6363302','63302');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63401','401','LA TEBAIDA','6363401','63401');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63470','470','MONTENEGRO','6363470','63470');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63548','548','PIJAO','6363548','63548');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63594','594','QUIMBAYA','6363594','63594');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','63','QUINDIO                                           ','63690','690','SALENTO','6363690','63690');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','661','001','PEREIRA','66661','66001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66170','170','DOS QUEBRADAS','6666170','66170');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66318','318','GUATICA','6666318','66318');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66383','383','LA CELIA','6666383','66383');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66400','400','LA VIRGINIA','6666400','66400');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66440','440','MARSELLA','6666440','66440');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','6645','045','APIA','666645','66045');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66456','456','MISTRATO','6666456','66456');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66572','572','PUEBLO RICO','6666572','66572');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66594','594','QUINCHIA','6666594','66594');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66682','682','SANTA ROSA DE CABAL','6666682','66682');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','66687','687','SANTUARIO','6666687','66687');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','6675','075','BALBOA','666675','66075');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','66','RISARALDA                                         ','6688','088','BELEN DE UMBRIA','666688','66088');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','681','001','BUCARAMANGA','68681','68001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68101','101','BOLIVAR','6868101','68101');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68121','121','CABRERA','6868121','68121');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','6813','013','AGUADA','686813','68013');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68132','132','CALIFORNIA','6868132','68132');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68147','147','CAPITANEJO','6868147','68147');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68152','152','CARCASI','6868152','68152');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68160','160','CEPITA','6868160','68160');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68162','162','CERRITO','6868162','68162');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68167','167','CHARALA','6868167','68167');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68169','169','CHARTA','6868169','68169');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68176','176','CHIMA','6868176','68176');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68179','179','CHIPATA','6868179','68179');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68190','190','CIMITARRA','6868190','68190');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','6820','020','ALBANIA','686820','68020');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68207','207','CONCEPCION','6868207','68207');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68209','209','CONFINES','6868209','68209');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68211','211','CONTRATACION','6868211','68211');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68217','217','COROMORO','6868217','68217');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68229','229','CURITI','6868229','68229');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68235','235','EL CARMEN','6868235','68235');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68245','245','EL GUACAMAYO','6868245','68245');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68250','250','EL PE','6868250','68250');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68255','255','EL PLAYON','6868255','68255');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68264','264','ENCINO','6868264','68264');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68266','266','ENCISO','6868266','68266');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68271','271','FLORIAN','6868271','68271');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68276','276','FLORIDABLANCA','6868276','68276');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68296','296','GALAN','6868296','68296');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68298','298','GAMBITA','6868298','68298');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68307','307','GIRON','6868307','68307');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68318','318','GUACA','6868318','68318');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68320','320','GUADALUPE','6868320','68320');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68322','322','GUAPOTA','6868322','68322');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68324','324','GUAVATA','6868324','68324');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68327','327','GUEPSA','6868327','68327');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68344','344','HATO','6868344','68344');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68368','368','JESUS MARIA','6868368','68368');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68370','370','JORDAN','6868370','68370');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68377','377','LA BELLEZA','6868377','68377');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68385','385','LANDAZURI','6868385','68385');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68397','397','LA PAZ','6868397','68397');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68406','406','LEBRIJA','6868406','68406');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68418','418','LOS SANTOS','6868418','68418');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68425','425','MACARAVITA','6868425','68425');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68432','432','MALAGA','6868432','68432');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68444','444','MATANZA','6868444','68444');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68464','464','MOGOTES','6868464','68464');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68468','468','MOLAGAVITA','6868468','68468');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68498','498','OCAMONTE','6868498','68498');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68500','500','OIBA','6868500','68500');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68502','502','ONZAGA','6868502','68502');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','6851','051','ARATOCA','686851','68051');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68522','522','PALMAR','6868522','68522');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68524','524','PALMAS DEL SOCORRO','6868524','68524');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68533','533','PARAMO','6868533','68533');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68547','547','PIEDECUESTA','6868547','68547');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68549','549','PINCHOTE','6868549','68549');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68572','572','PUENTE NACIONAL','6868572','68572');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68573','573','PUERTO PARRA','6868573','68573');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68575','575','PUERTO WILCHES','6868575','68575');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68615','615','RIONEGRO','6868615','68615');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68655','655','SABANA DE TORRES','6868655','68655');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68669','669','SAN ANDRES','6868669','68669');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68673','673','SAN BENITO','6868673','68673');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68679','679','SAN GIL','6868679','68679');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68682','682','SAN JOAQUIN','6868682','68682');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68684','684','SAN JOSE DE MIRANDA','6868684','68684');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68686','686','SAN MIGUEL','6868686','68686');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68689','689','SAN VICENTE DE CHUCURI','6868689','68689');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68705','705','SANTA BARBARA','6868705','68705');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68720','720','SANTA HELENA','6868720','68720');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68745','745','SIMACOTA','6868745','68745');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68755','755','SOCORRO','6868755','68755');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','6877','077','BARBOSA','686877','68077');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68770','770','SUAITA','6868770','68770');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68773','773','SUCRE','6868773','68773');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68780','780','SURATA','6868780','68780');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','6879','079','BARICHARA','686879','68079');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','6881','081','BARRANCABERMEJA','686881','68081');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68820','820','TONA','6868820','68820');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68855','855','VALLE SAN JOSE','6868855','68855');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68861','861','VELEZ','6868861','68861');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68867','867','VETAS','6868867','68867');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68872','872','VILLANUEVA','6868872','68872');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','68895','895','ZAPATOCA','6868895','68895');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','68','SANTANDER                                         ','6892','092','BETULIA','686892','68092');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','701','001','SINCELEJO','70701','70001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70110','110','BUENAVISTA','7070110','70110');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70124','124','CAIMITO','7070124','70124');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70204','204','COLOSO','7070204','70204');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70215','215','COROZAL','7070215','70215');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70230','230','CHALAN','7070230','70230');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70233','233','EL ROBLE','7070233','70233');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70235','235','GALERAS','7070235','70235');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70265','265','GUARANDA','7070265','70265');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70400','400','LA UNION','7070400','70400');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70418','418','LOS PALMITOS','7070418','70418');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70429','429','MAJAGUAL','7070429','70429');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70473','473','MORROA','7070473','70473');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70508','508','OVEJAS','7070508','70508');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70523','523','PALMITO','7070523','70523');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70670','670','SAMPUES','7070670','70670');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70678','678','SAN BENITO ABAD','7070678','70678');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70702','702','SAN JUAN DE BETULIA','7070702','70702');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70708','708','SAN MARCOS','7070708','70708');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70713','713','SAN ONOFRE','7070713','70713');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70717','717','SAN PEDRO','7070717','70717');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70742','742','SINCE','7070742','70742');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70771','771','SUCRE','7070771','70771');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70820','820','TOLU','7070820','70820');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','70','SUCRE                                             ','70823','823','TOLUVIEJO','7070823','70823');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','731','001','IBAGUE','73731','73001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73124','124','CAJAMARCA','7373124','73124');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73148','148','CARMEN DE APICALA','7373148','73148');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73152','152','CASABIANCA','7373152','73152');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73168','168','CHAPARRAL','7373168','73168');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73200','200','COELLO','7373200','73200');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73217','217','COYAIMA','7373217','73217');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73226','226','CUNDAY','7373226','73226');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73236','236','DOLORES','7373236','73236');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','7324','024','ALPUJARRA','737324','73024');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','7326','026','ALVARADO','737326','73026');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73268','268','ESPINAL','7373268','73268');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73270','270','FALAN','7373270','73270');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73275','275','FLANDES','7373275','73275');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73283','283','FRESNO','7373283','73283');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','7330','030','AMBALEMA','737330','73030');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73319','319','GUAMO','7373319','73319');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73347','347','HERVEO','7373347','73347');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73349','349','HONDA','7373349','73349');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73352','352','ICONONZO','7373352','73352');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73408','408','LERIDA','7373408','73408');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73411','411','LIBANO','7373411','73411');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','7343','043','ANZOATEGUI','737343','73043');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73443','443','MARIQUITA','7373443','73443');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73449','449','MELGAR','7373449','73449');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73461','461','MURILLO','7373461','73461');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73483','483','NATAGAIMA','7373483','73483');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73504','504','ORTEGA','7373504','73504');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73520','520','PALOCABILDO','7373520','73520');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73547','547','PIEDRAS','7373547','73547');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','7355','055','ARMERO (GUAYABAL)','737355','73055');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73555','555','PLANADAS','7373555','73555');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73563','563','PRADO','7373563','73563');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73585','585','PURIFICACION','7373585','73585');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73616','616','RIOBLANCO','7373616','73616');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73622','622','RONCESVALLES','7373622','73622');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73624','624','ROVIRA','7373624','73624');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','7367','067','ATACO','737367','73067');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73671','671','SALDA','7373671','73671');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73675','675','SAN ANTONIO','7373675','73675');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73678','678','SAN LUIS','7373678','73678');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73686','686','SANTA ISABEL','7373686','73686');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73770','770','SUAREZ','7373770','73770');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73854','854','VALLE DE SAN JUAN','7373854','73854');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73861','861','VENADILLO','7373861','73861');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73870','870','VILLAHERMOSA','7373870','73870');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','73','TOLIMA                                            ','73873','873','VILLARRICA','7373873','73873');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','761','001','CALI','76761','76001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76100','100','BOLIVAR','7676100','76100');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76109','109','BUENAVENTURA','7676109','76109');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76111',NULL,'BUGA','7676111',NULL);
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76113','113','BUGALAGRANDE','7676113','76113');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76122','122','CAICEDONIA','7676122','76122');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76126','126','CALIMA (DARIEN)','7676126','76126');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76130','130','CANDELARIA','7676130','76130');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76147','147','CARTAGO','7676147','76147');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','7620','020','ALCALA','767620','76020');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76233','233','DAGUA','7676233','76233');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76243','243','EL AGUILA','7676243','76243');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76246','246','EL CAIRO','7676246','76246');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76248','248','EL CERRITO','7676248','76248');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76250','250','EL DOVIO','7676250','76250');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76275','275','FLORIDA','7676275','76275');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76306','306','GINEBRA','7676306','76306');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76318','318','GUACARI','7676318','76318');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','7636','036','ANDALUCIA','767636','76036');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76364','364','JAMUNDI','7676364','76364');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76377','377','LA CUMBRE','7676377','76377');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76400','400','LA UNION','7676400','76400');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76403','403','LA VICTORIA','7676403','76403');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','7641','041','ANSERMANUEVO','767641','76041');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76497','497','OBANDO','7676497','76497');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76520','520','PALMIRA','7676520','76520');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','7654','054','ARGELIA','767654','76054');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76563','563','PRADERA','7676563','76563');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76606','606','RESTREPO','7676606','76606');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76616','616','RIOFRIO','7676616','76616');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76622','622','ROLDANILLO','7676622','76622');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76670','670','SAN PEDRO','7676670','76670');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76736','736','SEVILLA','7676736','76736');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76823','823','TORO','7676823','76823');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76828','828','TRUJILLO','7676828','76828');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76834','834','TULUA','7676834','76834');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76845','845','ULLOA','7676845','76845');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76863','863','VERSALLES','7676863','76863');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76869','869','VIJES','7676869','76869');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76890','890','YOTOCO','7676890','76890');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76892','892','YUMBO','7676892','76892');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','76','VALLE DEL CAUCA                                   ','76895','895','ZARZAL','7676895','76895');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','81','ARAUCA                                            ','811','001','ARAUCA','81811','81001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','81','ARAUCA                                            ','81220','220','CRAVO NORTE','8181220','81220');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','81','ARAUCA                                            ','81300','300','FORTUL','8181300','81300');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','81','ARAUCA                                            ','81591','591','PUERTO RONDON','8181591','81591');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','81','ARAUCA                                            ','8165','065','ARAUQUITA','818165','81065');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','81','ARAUCA                                            ','81736','736','SARAVENA','8181736','81736');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','81','ARAUCA                                            ','81794','794','TAME','8181794','81794');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','851','001','YOPAL','85851','85001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','8510','010','AGUAZUL','858510','85010');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85125','125','HATO COROZAL','8585125','85125');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85136','136','LA SALINA','8585136','85136');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85139','139','MANI','8585139','85139');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','8515','015','CHAMEZA','858515','85015');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85162','162','MONTERREY','8585162','85162');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85225','225','NUNCHIA','8585225','85225');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85230','230','OROCUE','8585230','85230');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85250','250','PAZ DE ARIPORO','8585250','85250');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85263','263','PORE','8585263','85263');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85279','279','RECETOR','8585279','85279');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85300','300','SABANALARGA','8585300','85300');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85315','315','SACAMA','8585315','85315');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85325','325','SAN LUIS DE PALENQUE','8585325','85325');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85400','400','TAMARA','8585400','85400');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85410','410','TAURAMENA','8585410','85410');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85430','430','TRINIDAD','8585430','85430');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','85','CASANARE                                          ','85440','440','VILLANUEVA','8585440','85440');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','861','001','MOCOA','86861','86001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86219','219','COLON','8686219','86219');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86320','320','ORITO','8686320','86320');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86568','568','PUERTO ASIS','8686568','86568');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86569','569','PUERTO CAYCEDO','8686569','86569');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86571','571','PUERTO GUZMAN','8686571','86571');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86573','573','PUERTO LEGUIZAMO','8686573','86573');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86749','749','SIBUNDOY','8686749','86749');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86755','755','SAN FRANCISCO','8686755','86755');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86757','757','SAN MIGUEL','8686757','86757');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86760','760','SANTIAGO','8686760','86760');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86865','865','VALLE DEL GUAMUEZ','8686865','86865');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','86','PUTUMAYO                                          ','86885','885','VILLAGARZON','8686885','86885');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','81','001','BARRANQUILLA','881','8001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8137','137','CAMPO DE LA CRUZ','88137','8137');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8141','141','CANDELARIA','88141','8141');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8296','296','GALAPA','88296','8296');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8372','372','JUAN DE ACOSTA','88372','8372');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8421','421','LURUACO','88421','8421');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8433','433','MALAMBO','88433','8433');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8436','436','MANATI','88436','8436');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8520','520','PALMAR DE VARELA','88520','8520');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8549','549','PIOJO','88549','8549');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8558','558','POLO NUEVO','88558','8558');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8560','560','PONEDERA','88560','8560');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8573','573','PUERTO COLOMBIA','88573','8573');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8606','606','REPELON','88606','8606');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8634','634','SABANAGRANDE','88634','8634');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8638','638','SABANALARGA','88638','8638');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8675','675','SANTA LUCIA','88675','8675');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8685','685','SANTO TOMAS','88685','8685');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8758','758','SOLEDAD','88758','8758');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8770','770','SUAN','88770','8770');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','878','078','BARANOA','8878','8078');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8832','832','TUBARA','88832','8832');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','8','ATLANTICO                                         ','8849','849','USIACURI','88849','8849');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','88','SAN ANDRES                                        ','881','001','SAN ANDRES','88881','88001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','88','SAN ANDRES                                        ','88564','564','PROVIDENCIA','8888564','88564');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','91','AMAZONAS                                          ','911','001','LETICIA','91911','91001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','91','AMAZONAS                                          ','91263','263','EL ENCANTO','9191263','91263');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','91','AMAZONAS                                          ','91405','405','LA CHORRERA','9191405','91405');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','91','AMAZONAS                                          ','91407','407','LA PEDRERA','9191407','91407');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','91','AMAZONAS                                          ','91460','460','MIRITI-PARANA','9191460','91460');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','91','AMAZONAS                                          ','91540','540','PUERTO NARI','9191540','91540');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','91','AMAZONAS                                          ','91669','669','PUERTO SANTANDER','9191669','91669');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','91','AMAZONAS                                          ','91798','798','TARAPACA','9191798','91798');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','94','GUAINIA                                           ','941','001','PUERTO INIRIDA','94941','94001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','94','GUAINIA                                           ','94343','343','BARRANCO MINAS','9494343','94343');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','94','GUAINIA                                           ','94883','883','SAN FELIPE','9494883','94883');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','94','GUAINIA                                           ','94884','884','PUERTO COLOMBIA','9494884','94884');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','94','GUAINIA                                           ','94885','885','LA GUADALUPE','9494885','94885');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','94','GUAINIA                                           ','94886','886','CACAHUAL','9494886','94886');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','94','GUAINIA                                           ','94887','887','PANA PANA','9494887','94887');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','94','GUAINIA                                           ','94888','888','MORICHAL NUEVO','9494888','94888');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','95','GUAVIRE                                           ','951','001','SAN JOSE DEL GUAVIARE','95951','95001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','95','GUAVIRE                                           ','9515','015','CALAMAR','959515','95015');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','95','GUAVIRE                                           ','95200','200','MIRAFLORES','9595200','95200');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','95','GUAVIRE                                           ','9525','025','EL RETORNO','959525','95025');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','97','VAUPES                                            ','971','001','MITU','97971','97001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','97','VAUPES                                            ','97161','161','CARURU','9797161','97161');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','97','VAUPES                                            ','97511','511','PACOA','9797511','97511');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','97','VAUPES                                            ','97666','666','TARAIRA','9797666','97666');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','97','VAUPES                                            ','97777','777','PAPUNAUA','9797777','97777');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','97','VAUPES                                            ','97889','889','YAVARATE','9797889','97889');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','99','VICHADA                                           ','991','001','PUERTO CARRE','99991','99001');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','99','VICHADA                                           ','99524','524','LA PRIMAVERA','9999524','99524');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','99','VICHADA                                           ','99624','624','SANTA ROSALIA','9999624','99624');
insert  into `paisciudad`(`cod_pais`,`cod_departamento`,`nom_departamento`,`cod_municipio`,`cod_municipio2`,`nom_municipio`,`cod_municipio_compuesto`,`cod_municipio_compuesto_2`) values ('CO','99','VICHADA                                           ','99773','773','CUMARIBO','9999773','99773');

/*Table structure for table `paises` */

DROP TABLE IF EXISTS `paises`;

CREATE TABLE `paises` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) DEFAULT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `paises` */

insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (1,'AF','Afganistán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (2,'AX','Islas Gland');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (3,'AL','Albania');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (4,'DE','Alemania');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (5,'AD','Andorra');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (6,'AO','Angola');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (7,'AI','Anguilla');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (8,'AQ','Antártida');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (9,'AG','Antigua y Barbuda');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (10,'AN','Antillas Holandesas');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (11,'SA','Arabia Saudí');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (12,'DZ','Argelia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (13,'AR','Argentina');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (14,'AM','Armenia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (15,'AW','Aruba');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (16,'AU','Australia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (17,'AT','Austria');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (18,'AZ','Azerbaiyán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (19,'BS','Bahamas');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (20,'BH','Bahréin');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (21,'BD','Bangladesh');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (22,'BB','Barbados');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (23,'BY','Bielorrusia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (24,'BE','Bélgica');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (25,'BZ','Belice');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (26,'BJ','Benin');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (27,'BM','Bermudas');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (28,'BT','Bhután');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (29,'BO','Bolivia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (30,'BA','Bosnia y Herzegovina');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (31,'BW','Botsuana');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (32,'BV','Isla Bouvet');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (33,'BR','Brasil');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (34,'BN','Brunéi');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (35,'BG','Bulgaria');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (36,'BF','Burkina Faso');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (37,'BI','Burundi');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (38,'CV','Cabo Verde');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (39,'KY','Islas Caimán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (40,'KH','Camboya');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (41,'CM','Camerún');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (42,'CA','Canadá');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (43,'CF','República Centroafricana');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (44,'TD','Chad');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (45,'CZ','República Checa');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (46,'CL','Chile');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (47,'CN','China');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (48,'CY','Chipre');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (49,'CX','Isla de Navidad');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (50,'VA','Ciudad del Vaticano');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (51,'CC','Islas Cocos');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (52,'CO','Colombia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (53,'KM','Comoras');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (54,'CD','República Democrática del Congo');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (55,'CG','Congo');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (56,'CK','Islas Cook');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (57,'KP','Corea del Norte');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (58,'KR','Corea del Sur');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (59,'CI','Costa de Marfil');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (60,'CR','Costa Rica');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (61,'HR','Croacia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (62,'CU','Cuba');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (63,'DK','Dinamarca');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (64,'DM','Dominica');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (65,'DO','República Dominicana');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (66,'EC','Ecuador');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (67,'EG','Egipto');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (68,'SV','El Salvador');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (69,'AE','Emiratos Árabes Unidos');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (70,'ER','Eritrea');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (71,'SK','Eslovaquia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (72,'SI','Eslovenia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (73,'ES','España');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (74,'UM','Islas ultramarinas de Estados Unidos');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (75,'US','Estados Unidos');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (76,'EE','Estonia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (77,'ET','Etiopía');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (78,'FO','Islas Feroe');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (79,'PH','Filipinas');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (80,'FI','Finlandia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (81,'FJ','Fiyi');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (82,'FR','Francia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (83,'GA','Gabón');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (84,'GM','Gambia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (85,'GE','Georgia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (86,'GS','Islas Georgias del Sur y Sandwich del Sur');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (87,'GH','Ghana');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (88,'GI','Gibraltar');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (89,'GD','Granada');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (90,'GR','Grecia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (91,'GL','Groenlandia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (92,'GP','Guadalupe');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (93,'GU','Guam');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (94,'GT','Guatemala');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (95,'GF','Guayana Francesa');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (96,'GN','Guinea');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (97,'GQ','Guinea Ecuatorial');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (98,'GW','Guinea-Bissau');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (99,'GY','Guyana');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (100,'HT','Haití');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (101,'HM','Islas Heard y McDonald');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (102,'HN','Honduras');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (103,'HK','Hong Kong');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (104,'HU','Hungría');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (105,'IN','India');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (106,'ID','Indonesia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (107,'IR','Irán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (108,'IQ','Iraq');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (109,'IE','Irlanda');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (110,'IS','Islandia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (111,'IL','Israel');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (112,'IT','Italia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (113,'JM','Jamaica');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (114,'JP','Japón');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (115,'JO','Jordania');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (116,'KZ','Kazajstán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (117,'KE','Kenia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (118,'KG','Kirguistán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (119,'KI','Kiribati');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (120,'KW','Kuwait');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (121,'LA','Laos');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (122,'LS','Lesotho');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (123,'LV','Letonia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (124,'LB','Líbano');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (125,'LR','Liberia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (126,'LY','Libia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (127,'LI','Liechtenstein');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (128,'LT','Lituania');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (129,'LU','Luxemburgo');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (130,'MO','Macao');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (131,'MK','ARY Macedonia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (132,'MG','Madagascar');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (133,'MY','Malasia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (134,'MW','Malawi');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (135,'MV','Maldivas');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (136,'ML','Malí');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (137,'MT','Malta');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (138,'FK','Islas Malvinas');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (139,'MP','Islas Marianas del Norte');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (140,'MA','Marruecos');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (141,'MH','Islas Marshall');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (142,'MQ','Martinica');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (143,'MU','Mauricio');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (144,'MR','Mauritania');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (145,'YT','Mayotte');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (146,'MX','México');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (147,'FM','Micronesia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (148,'MD','Moldavia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (149,'MC','Mónaco');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (150,'MN','Mongolia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (151,'MS','Montserrat');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (152,'MZ','Mozambique');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (153,'MM','Myanmar');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (154,'NA','Namibia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (155,'NR','Nauru');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (156,'NP','Nepal');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (157,'NI','Nicaragua');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (158,'NE','Níger');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (159,'NG','Nigeria');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (160,'NU','Niue');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (161,'NF','Isla Norfolk');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (162,'NO','Noruega');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (163,'NC','Nueva Caledonia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (164,'NZ','Nueva Zelanda');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (165,'OM','Omán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (166,'NL','Países Bajos');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (167,'PK','Pakistán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (168,'PW','Palau');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (169,'PS','Palestina');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (170,'PA','Panamá');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (171,'PG','Papúa Nueva Guinea');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (172,'PY','Paraguay');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (173,'PE','Perú');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (174,'PN','Islas Pitcairn');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (175,'PF','Polinesia Francesa');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (176,'PL','Polonia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (177,'PT','Portugal');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (178,'PR','Puerto Rico');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (179,'QA','Qatar');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (180,'GB','Reino Unido');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (181,'RE','Reunión');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (182,'RW','Ruanda');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (183,'RO','Rumania');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (184,'RU','Rusia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (185,'EH','Sahara Occidental');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (186,'SB','Islas Salomón');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (187,'WS','Samoa');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (188,'AS','Samoa Americana');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (189,'KN','San Cristóbal y Nevis');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (190,'SM','San Marino');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (191,'PM','San Pedro y Miquelón');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (192,'VC','San Vicente y las Granadinas');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (193,'SH','Santa Helena');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (194,'LC','Santa Lucía');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (195,'ST','Santo Tomé y Príncipe');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (196,'SN','Senegal');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (197,'CS','Serbia y Montenegro');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (198,'SC','Seychelles');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (199,'SL','Sierra Leona');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (200,'SG','Singapur');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (201,'SY','Siria');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (202,'SO','Somalia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (203,'LK','Sri Lanka');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (204,'SZ','Suazilandia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (205,'ZA','Sudáfrica');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (206,'SD','Sudán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (207,'SE','Suecia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (208,'CH','Suiza');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (209,'SR','Surinam');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (210,'SJ','Svalbard y Jan Mayen');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (211,'TH','Tailandia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (212,'TW','Taiwán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (213,'TZ','Tanzania');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (214,'TJ','Tayikistán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (215,'IO','Territorio Británico del Océano Índico');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (216,'TF','Territorios Australes Franceses');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (217,'TL','Timor Oriental');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (218,'TG','Togo');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (219,'TK','Tokelau');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (220,'TO','Tonga');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (221,'TT','Trinidad y Tobago');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (222,'TN','Túnez');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (223,'TC','Islas Turcas y Caicos');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (224,'TM','Turkmenistán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (225,'TR','Turquía');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (226,'TV','Tuvalu');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (227,'UA','Ucrania');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (228,'UG','Uganda');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (229,'UY','Uruguay');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (230,'UZ','Uzbekistán');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (231,'VU','Vanuatu');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (232,'VE','Venezuela');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (233,'VN','Vietnam');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (234,'VG','Islas Vírgenes Británicas');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (235,'VI','Islas Vírgenes de los Estados Unidos');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (236,'WF','Wallis y Futuna');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (237,'YE','Yemen');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (238,'DJ','Yibuti');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (239,'ZM','Zambia');
insert  into `paises`(`idPais`,`codigo`,`descripcion`) values (240,'ZW','Zimbabue');

/*Table structure for table `perfil` */

DROP TABLE IF EXISTS `perfil`;

CREATE TABLE `perfil` (
  `idPerfil` tinyint(2) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `perfil` */

insert  into `perfil`(`idPerfil`,`descripcion`) values (1,'SUPERADMINISTRADOR');
insert  into `perfil`(`idPerfil`,`descripcion`) values (2,'ADMINISTRADOR');
insert  into `perfil`(`idPerfil`,`descripcion`) values (3,'LIDER');
insert  into `perfil`(`idPerfil`,`descripcion`) values (4,'PRO');

/*Table structure for table `perfilrecurso` */

DROP TABLE IF EXISTS `perfilrecurso`;

CREATE TABLE `perfilrecurso` (
  `idPerfilRecurso` int(11) NOT NULL AUTO_INCREMENT,
  `idPerfil` tinyint(2) NOT NULL,
  `idRecurso` smallint(2) NOT NULL,
  `acceso` tinyint(1) NOT NULL DEFAULT '0',
  `insertar` tinyint(1) NOT NULL DEFAULT '0',
  `consultar` tinyint(1) NOT NULL DEFAULT '0',
  `eliminar` tinyint(1) NOT NULL DEFAULT '0',
  `actualizar` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idPerfilRecurso`),
  KEY `FK_perfilrecurso` (`idPerfil`),
  KEY `FK_perfilrecurso_recurso` (`idRecurso`),
  CONSTRAINT `FK_perfilrecurso` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_perfilrecurso_recurso` FOREIGN KEY (`idRecurso`) REFERENCES `recurso` (`idrecurso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `perfilrecurso` */

insert  into `perfilrecurso`(`idPerfilRecurso`,`idPerfil`,`idRecurso`,`acceso`,`insertar`,`consultar`,`eliminar`,`actualizar`) values (2,1,2,1,1,1,1,1);
insert  into `perfilrecurso`(`idPerfilRecurso`,`idPerfil`,`idRecurso`,`acceso`,`insertar`,`consultar`,`eliminar`,`actualizar`) values (3,1,3,1,1,1,1,1);
insert  into `perfilrecurso`(`idPerfilRecurso`,`idPerfil`,`idRecurso`,`acceso`,`insertar`,`consultar`,`eliminar`,`actualizar`) values (4,1,4,1,1,1,1,1);
insert  into `perfilrecurso`(`idPerfilRecurso`,`idPerfil`,`idRecurso`,`acceso`,`insertar`,`consultar`,`eliminar`,`actualizar`) values (5,1,5,1,1,1,1,1);
insert  into `perfilrecurso`(`idPerfilRecurso`,`idPerfil`,`idRecurso`,`acceso`,`insertar`,`consultar`,`eliminar`,`actualizar`) values (8,2,2,1,1,1,1,1);
insert  into `perfilrecurso`(`idPerfilRecurso`,`idPerfil`,`idRecurso`,`acceso`,`insertar`,`consultar`,`eliminar`,`actualizar`) values (9,2,3,1,1,1,1,1);
insert  into `perfilrecurso`(`idPerfilRecurso`,`idPerfil`,`idRecurso`,`acceso`,`insertar`,`consultar`,`eliminar`,`actualizar`) values (10,2,4,1,1,1,1,1);
insert  into `perfilrecurso`(`idPerfilRecurso`,`idPerfil`,`idRecurso`,`acceso`,`insertar`,`consultar`,`eliminar`,`actualizar`) values (11,2,5,1,1,1,1,1);

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo_persona` tinyint(2) NOT NULL DEFAULT '1',
  `idtipodocu` varchar(3) DEFAULT NULL,
  `identificacion` varchar(15) DEFAULT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `fec_nac` date DEFAULT NULL,
  `idsexo` varchar(2) DEFAULT NULL,
  `idestado_civil` varchar(3) DEFAULT NULL,
  `idprofesion` smallint(3) unsigned DEFAULT NULL,
  `idcodpais` varchar(2) DEFAULT NULL,
  `idDpto` varchar(5) DEFAULT NULL,
  `idCiudad` varchar(5) DEFAULT NULL,
  `barrio` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `fec_registro` date NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'P',
  `usuarioCreacion` int(11) NOT NULL,
  PRIMARY KEY (`idpersona`),
  KEY `fk_personas_detalle_combo1_idx` (`idtipodocu`),
  KEY `FK_personas_profesion` (`idprofesion`),
  KEY `FK_personas` (`estado`),
  CONSTRAINT `FK_personas_profesion` FOREIGN KEY (`idprofesion`) REFERENCES `profesiones` (`idprofesion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (3,2,'CC','1075240263','Andres Felipe','Lara Nieto','1989-09-24','HO','U',10,'CO','41','41001','V. Regina','Calle 15 NO. 43A-57','8638443',NULL,'anslara89@gmail.com','2016-03-30','A',0);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (4,2,'CC','1075267912','Jose Alexander','Lozano Velasco','1993-01-06','HO','S',10,'CO','41','41001','Cristalinas','Calle 2f NO. 38A-34 ','8601512',NULL,'alexanderlozano950@gmail.com','2016-03-30','A',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (5,2,'CC','123456565O','Maria Jose','Perez Gonzales','1992-03-04','MU','C',6,'CO','41','41001','Palmas','Call 40a NO. 22-43','8704343',NULL,'maraiaa@gmail.com','2016-04-21','A',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (6,1,'TI','96454544','Fernanda ','Peña Lozada','1999-04-05','MU','S',3,'CO','41','41001','Alpes','Cr 4 NO. 43-34','8654344','','ferpare@hotmail.com','2016-04-21','P',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (7,1,NULL,NULL,'Alexander','Perez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','3203732599','avex16@gmail.com','2016-04-23','P',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (8,2,'CC','107633224','Jessica','Amaya','1995-04-09','MU','S',4,'CO','41','41001','Santa ines','cll 3 b 34 a 23','8670442','3214567899','jekiita@hotmail.com','0000-00-00','I',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (9,2,'CC','121434324','Santiago','Rua Lozano','1990-09-02','HO','S',3,'CO','41','41001','Acacias',NULL,'','3213456212','santiagor8a@gmail.com','2016-04-23','A',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (10,2,'CC','14353535','florentinoo','Perez Gon',NULL,'HO','C',8,'CO','41','41001','Los parques',NULL,'8452323','3212343566','florentinoq@gmail.com','0000-00-00','A',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (11,1,NULL,NULL,'Juan Carlos','Hernandez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','3244563213','hernadez@hotmail.com','0000-00-00','P',4);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (12,2,'TI','933454664','Carolain','Peña',NULL,'MU','S',6,'CO','41','41001','Las cristalinas',NULL,'8704428','3123355546','carolain@gmail.com','0000-00-00','A',4);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (21,1,NULL,NULL,'Jose Alexander','Lozano velasco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8452322','3104820378','alexanderlozano@gmail.com','0000-00-00','X',4);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (22,1,NULL,NULL,'Marina','Pascuas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','8784567','pascuas@hotmail.com','0000-00-00','P',4);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (23,1,NULL,NULL,'Jose Alexander','Lozano velasco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8452322','3104820378','lalalal@gmail.com','2016-05-07','P',4);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (24,1,NULL,NULL,'Luciana','Adfdfdfw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8452322','3104820378','passs@gmail.com','2016-05-13','P',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (25,1,NULL,NULL,'Victor','Zavala',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8494344','3203224243','zabala@gmail.com','2016-05-14','X',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (26,1,NULL,NULL,'Jessica alejandra','Amaya peña',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8704356','3244563213','amormiojya@gmail.com','2016-05-15','P',4);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (27,1,NULL,NULL,'Katerine','Canacue',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8638443','','chicainston16@hotmail.com','2016-05-24','P',4);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (28,1,NULL,NULL,'Santiago','Lara',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8452322','','larasantiago@gmail.com','2016-05-24','X',4);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (29,1,NULL,NULL,'Sandra Milena','Velasco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8690045','3165433455','sandra@hotmail.com','0000-00-00','X',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (30,1,NULL,NULL,'Patricia','Velasco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8690045','3165433455','patricia@hotmail.com','0000-00-00','P',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (33,1,NULL,NULL,'claudia Patricia','Velasco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8690045','3165433455','ricia@hotmail.com','0000-00-00','P',3);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (34,1,NULL,NULL,'Ricardo','Vera',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8771677','','rvera@hotmail.com','2016-06-20','P',4);
insert  into `personas`(`idpersona`,`idtipo_persona`,`idtipodocu`,`identificacion`,`nombres`,`apellidos`,`fec_nac`,`idsexo`,`idestado_civil`,`idprofesion`,`idcodpais`,`idDpto`,`idCiudad`,`barrio`,`direccion`,`telefono`,`celular`,`email`,`fec_registro`,`estado`,`usuarioCreacion`) values (35,1,NULL,NULL,'Santiago ','Lozano',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','santiagolozano@hotmail.com','2016-07-25','P',4);

/*Table structure for table `profesiones` */

DROP TABLE IF EXISTS `profesiones`;

CREATE TABLE `profesiones` (
  `idprofesion` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `oficio` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idprofesion`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=latin1;

/*Data for the table `profesiones` */

insert  into `profesiones`(`idprofesion`,`oficio`) values (1,'ACOMODADORES DE ESTANTES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (2,'ACOMPAÑANTES Y VALETS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (3,'INGENIERO DE SISTEMAS Y TECNOLOGÍAS INFORMÁTICAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (4,'AGENTES DE EMPLEO Y CONTRATISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (5,'AGENTES DE POLICÍA,FUERZAS ARMADAS, EJERCITO Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (6,'AGENTES INMOBILIARIOS Y ADMINISTRADORES DE PROPIEDADES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (7,'AGRICULTORES DE CULTIVOS DE SUBSISTENCIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (8,'AGRICULTORES Y PRODUCTORES DE HORTALIZAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (9,'ALBAÑILES Y TRABAJADORES DE LA CONSTRUCCIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (10,'ANALISTAS DE SISTEMAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (11,'ANALISTAS FINANCIEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (12,'APICULTORES Y SERICICULTORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (13,'ARCHIVISTAS Y CURADORES DE MUSEOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (14,'ARQUITECTOS DE EDIFICIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (15,'ARQUITECTOS PAISAJISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (16,'ARTESANOS DE TEXTILES, CUERO Y MATERIALES RELACIONADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (17,'ARTILLEROS Y DINAMITEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (18,'ASERRADORES O TRATADORES DE MADERA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (19,'ASESORES DE AGRICULTURA, SILVICULTURA Y PESCA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (20,'ASESORES FINANCIEROS Y DE INVERSIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (21,'ASISTENTES DE CONTABILIDAD');
insert  into `profesiones`(`idprofesion`,`oficio`) values (22,'ASISTENTES DE ENFERMERÍA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (23,'ASISTENTES DE VENTAS EN COMERCIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (24,'ASISTENTES ESTADÍSTICOS, MATEMÁTICOS Y ACTUARIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (25,'ASISTENTES MÉDICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (26,'ASISTENTES Y TERAPEUTAS DENTALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (27,'ASTRÓLOGOS, ADIVINOS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (28,'ATLETAS Y DEPORTISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (29,'AUTORES Y ESCRITORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (30,'AUXILIARES DE ATENCIÓN A LA SALUD');
insert  into `profesiones`(`idprofesion`,`oficio`) values (31,'AUXILIARES DE MOSTRADORES DE SERVICIO DE ALIMENTOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (32,'AYUDANTES DE COCINA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (33,'BARRENDEROS Y TRABAJADORES AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (34,'BARTENDERS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (35,'BIBLIOTECARIOS Y PROFESIONALES AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (36,'BOMBEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (37,'BUZOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (38,'CAJEROS DE BANCOS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (39,'CAJEROS Y EXPENDEDORES DE BOLETOS O BILLETES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (40,'CAMAREROS O MESEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (41,'CANTEROS, CORTADORES DE PIEDRA, DIVISORES Y GRABADORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (42,'CARNICEROS, PESCADEROS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (43,'CARPINTEROS Y EBANISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (44,'CARTÓGRAFOS Y AGRIMENSORES O TOPÓGRAFOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (45,'CATADORES DE ALIMENTOS Y BEBIDAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (46,'CAZADORES Y TRAMPEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (47,'CHAPISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (48,'CHEFS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (49,'CLASIFICADORES DE DESECHOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (50,'COBRADORES Y TRABAJADORES AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (51,'COCINEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (52,'COLOCADORES DE CONCRETO, DE ACABADOS DE HORMIGÓN Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (53,'COLOCADORES DE PISOS Y BALDOSAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (54,'COMERCIANTES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (55,'COMPRADORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (56,'CONDUCTORES DE TAXIS, AUTOS Y CAMIONETAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (57,'CONSEJEROS Y TRABAJADORES SOCIALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (58,'CONSERJES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (59,'CONSERVADORES DE FRUTAS, VERDURAS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (60,'CONSTRUCTORES DE ESTRUCTURAS METÁLICAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (61,'CONSTRUCTORES DE VIVIENDAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (62,'CONSULTORES DE VIAJES Y EMPLEADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (63,'CONTADORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (64,'CONTROLADORES DE PLANTAS QUÍMICAS PROCESADORAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (65,'CORREDORES DE COMERCIO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (66,'CORREDORES O AGENTES DE BOLSA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (67,'CORREDORES, CROUPIERS Y TRABAJADORES RELACIONADOS CON LAS APUESTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (68,'MODISTAS, BORDADORAS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (69,'CRISTALEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (70,'CUIDADORES DE ANIMALES Y PELUQUEROS DE MASCOTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (71,'DEMOSTRADORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (72,'DENTISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (73,'DESARROLLADORES DE SOFTWARE');
insert  into `profesiones`(`idprofesion`,`oficio`) values (74,'DESARROLLADORES WEB Y MULTIMEDIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (75,'DIBUJANTES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (76,'DIETISTAS Y NUTRICIONISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (77,'DIRECTORES Y GERENTES GENERALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (78,'DISEÑADORES DE PRODUCTOS Y PRENDAS DE VESTIR');
insert  into `profesiones`(`idprofesion`,`oficio`) values (79,'DISEÑADORES GRÁFICOS Y MULTIMEDIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (80,'DISEÑADORES Y ADMINISTRADORES DE BASES DE DATOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (81,'DISEÑADORES Y DECORADORES DE INTERIORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (82,'EBANISTAS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (83,'ECONOMISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (84,'ELECTRICISTAS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (85,'EMPACADORES MANUALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (86,'EMPLEADOS CODIFICACIÓN Y CORRECCIÓN DE PRUEBAS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (87,'EMPLEADOS DE BIBLIOTECA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (88,'EMPLEADOS DE ALMACÉN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (89,'EMPLEADOS DE CLASIFICACIÓN Y COPIADO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (90,'EMPLEADOS DE CONSULTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (91,'EMPLEADOS DE CONTABILIDAD');
insert  into `profesiones`(`idprofesion`,`oficio`) values (92,'EMPLEADOS DE CORREOS Y CLASIFICACIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (93,'EMPLEADOS DE ESTACIONES DE SERVICIO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (94,'EMPLEADOS DE ESTADÍSTICA, FINANZAS Y SEGUROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (95,'EMPLEADOS DE NÓMINA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (96,'EMPLEADOS DE PERSONAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (97,'EMPLEADOS DE PRODUCCIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (98,'EMPLEADOS DE REGISTRO DE DATOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (99,'EMPLEADOS DE TRANSPORTE');
insert  into `profesiones`(`idprofesion`,`oficio`) values (100,'EMPLEADOS EN SERVICIOS DE ATENCIÓN AL CLIENTE');
insert  into `profesiones`(`idprofesion`,`oficio`) values (101,'ENCUESTADORES DE ESTUDIOS DE MERCADO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (102,'ENTERRADORES Y EMBALSAMADORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (103,'ENTRENADORES DEPORTIVOS, INSTRUCTORES Y FUNCIONARIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (104,'ENTRENADORES Y LÍDERES DE PROGRAMA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (105,'ESCRIBIENTES Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (106,'ESPECIALISTAS EN MÉTODOS EDUCATIVOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (107,'ESTETICISTAS O ESTILISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (108,'EXAMINADORES Y CALIFICADORES DE PRODUCTOS (EXCEPTO ALIMENTOS Y BEBIDAS)');
insert  into `profesiones`(`idprofesion`,`oficio`) values (109,'FÍSICOS Y ASTÓNOMOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (110,'FABRICANTES DE PRODUCTOS LÁCTEOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (111,'FABRICANTES DE VIDRIO, CORTADORES, TRITURADORES Y ACABADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (112,'FABRICANTES Y REPARADORES DE INSTRUMENTOS DE PRECISIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (113,'FARMACÉUTICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (114,'FILÓSOFOS, HISTORIADORES Y CIENTÍFICOS POLÍTICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (115,'FISIOTERAPEUTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (116,'FONOAUDIÓLOGOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (117,'FONTANEROS O PLOMEROS E INSTALADORES DE TUBERÍAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (118,'FORMADORES EN TECNOLOGÍAS DE LA INFORMACIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (119,'FOTÓGRAFOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (120,'FUMIGADORES Y OTROS CONTROLADORES DE PLAGAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (121,'FUNCIONARIOS DE IMPUESTOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (122,'GANADEROS DE SUBSISTENCIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (123,'GANADEROS Y AGRICULTORES DE SUBSISTENCIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (124,'GANADEROS Y PRODUCTORES DE LÁCTEOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (125,'GEÓLOGOS Y GEOFÍSICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (126,'GERENTE DE VENTAS AL POR MAYOR Y AL POR MENOR');
insert  into `profesiones`(`idprofesion`,`oficio`) values (127,'GERENTES ADMINISTRATIVOS Y DE SERVICIOS EMPRESARIALES, OTROS CARGOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (128,'GERENTES DE BIENESTAR SOCIAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (129,'GERENTES DE CENTROS DEPORTIVOS, RECREATIVOS O CULTURALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (130,'GERENTES DE CONSTRUCCIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (131,'GERENTES DE EDUCACIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (132,'GERENTES DE FINANZAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (133,'GERENTES DE HOTEL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (134,'GERENTES DE INVESTIGACIÓN Y DESARROLLO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (135,'GERENTES DE LOS RAMOS FINANCIEROS Y DE SEGUROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (136,'GERENTES DE PRODUCCIÓN AGRÍCOLA Y FORESTAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (137,'GERENTES DE PUBLICIDAD Y MARKETING');
insert  into `profesiones`(`idprofesion`,`oficio`) values (138,'GERENTES DE PUBLICIDAD Y RELACIONES PÚBLICAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (139,'GERENTES DE RECURSOS HUMANOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (140,'GERENTES DE RESTAURANTES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (141,'GERENTES DE SERVICIOS DE CUIDADO INFANTIL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (142,'GERENTES DE SERVICIOS DE CUIDADOS PARA LA TERCERA EDAD');
insert  into `profesiones`(`idprofesion`,`oficio`) values (143,'GERENTES DE SERVICIOS DE INFORMACIÓN Y COMUNICACIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (144,'GERENTES DE SERVICIOS DE SALUD');
insert  into `profesiones`(`idprofesion`,`oficio`) values (145,'GERENTES DE SUMINISTRO, DISTRIBUCIÓN Y RELACIONADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (146,'GUÍAS DE VIAJE O DE TURISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (147,'GUARDIAS DE SEGURIDAD');
insert  into `profesiones`(`idprofesion`,`oficio`) values (148,'HERREROS, MARTILLADORES Y FRAGUADORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (149,'INGENIEROS QUÍMICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (150,'INGENIEROS AMBIENTALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (151,'INGENIEROS CIVILES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (152,'INGENIEROS DE TELECOMUNICACIONES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (153,'INGENIEROS DE BUQUES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (154,'INGENIEROS DE MINAS, METALÚRGICOS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (155,'INGENIEROS ELÉCTRICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (156,'INGENIEROS ELECTRÓNICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (157,'INGENIEROS INDUSTRIALES Y DE PRODUCCIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (158,'INSPECTORES Y ASISTENTES DE SALUD OCUPACIONAL Y AMBIENTAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (159,'INSTALADORES Y REPARADORES DE LÍNEAS ELÉCTRICAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (160,'INSTALADORES Y REPARADORES DE TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (161,'INSTRUCTORES DE AUTOESCUELA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (162,'INTENDENTES Y AYUDANTES DE LIMPIEZA DOMÉSTICA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (163,'INTENDENTES Y AYUDANTES DE LIMPIEZA EN OFICINAS Y OTROS ESTABLECIMIENTOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (164,'JARDINEROS Y TRABAJADORES HORTÍCOLAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (165,'JARDINEROS, HORTICULTORES Y TRABAJADORES DE VIVEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (166,'LAVADORES DE VEHÍCULOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (167,'LAVANDERAS Y PLANCHADORAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (168,'LECTORES DE MEDIDORES Y RECOLECTORES DE MÁQUINAS EXPENDEDORAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (169,'LIMPIADORES DE FACHADAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (170,'LIMPIADORES DE VIDRIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (171,'LOS INGENIEROS MECÁNICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (172,'MÉDICOS ESPECIALISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (173,'MÉDICOS GENERALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (174,'MAESTRAS DE JARDÍN DE INFANTES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (175,'MAESTROS DE ENSEÑANZA PRIMARIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (176,'MATEMÁTICOS, ACTUARIOS Y ESTADÍSTICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (177,'MECÁNICOS DE AIRE ACONDICIONADO Y REFRIGERACIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (178,'MECÁNICOS DE MAQUINARIA INDUSTRIAL Y AGRÍCOLA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (179,'MECÁNICOS DE VEHÍCULOS MOTORIZADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (180,'MECÁNICOS Y ELECTRICISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (181,'MECANÓGRAFOS Y OPERADORES DE PROCESADORES DE TEXTOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (182,'MENSAJEROS, REPARTIDORES DE PAQUETES Y CARGADORES DE EQUIPAJE');
insert  into `profesiones`(`idprofesion`,`oficio`) values (183,'METEORÓLOGOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (184,'OBSTÉTRAS O PARTERAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (185,'OCULISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (186,'OFICIALES DE CRÉDITO Y PRÉSTAMOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (187,'OPERADORES DE GRÚAS Y MONTACARGAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (188,'OPERADORES DE MÁQUINAS DE BLANQUEADO, TEÑIDO Y LIMPIEZA DE TELAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (189,'OPERADORES DE MÁQUINAS DE COMIDA Y PRODUCTOS RELACIONADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (190,'OPERADORES DE MÁQUINAS DE COSER');
insert  into `profesiones`(`idprofesion`,`oficio`) values (191,'OPERADORES DE MÁQUINAS DE EMBALAJE, EMBOTELLADO Y ETIQUETADO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (192,'OPERADORES DE MÁQUINAS DE LAVANDERÍA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (193,'OPERADORES DE MÁQUINAS PARA TRABAJAR LA MADERA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (194,'OPERADORES DE MAQUINARIA Y PLANTAS DE PRODUCTOS QUÍMICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (195,'OPERADORES DE PLANTAS DE MOVIMIENTO DE TIERRA Y RELACIONADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (196,'OPERADORES DE PLANTAS FORESTALES Y MAQUINARIA AGRÍCOLA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (197,'OPERADORES DE PLANTAS INCINERADORAS Y DE TRATAMIENTO DE AGUA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (198,'OPERADORES DE PLANTAS INCINERADORAS Y DE TRATAMIENTO DE AGUA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (199,'OPERADORES DE PLANTAS PROCESADORAS DE MADERA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (200,'OPERADORES DE PLANTAS PROCESADORAS DE MINERALES Y ROCAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (201,'OPTOMETRISTAS Y ÓPTICOS OFTÁLMICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (202,'ORGANIZADORES DE CONFERENCIAS Y EVENTOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (203,'OTROS AGENTES DE SERVICIOS EMPRESARIALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (204,'OTROS DESARROLLADORES Y ANALISTAS DE SOFTWARE Y APLICACIONES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (205,'OTROS GERENTES DE SERVICIO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (206,'OTROS OPERADORES DE MÁQUINAS Y PLANTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (207,'OTROS PRODUCTORES DE ANIMALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (208,'OTROS PROFESIONALES ARTÍSTICOS Y CULTURALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (209,'OTROS PROFESIONALES ASOCIADOS DE REGLAMENTACIÓN GUBERNAMENTAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (210,'OTROS PROFESIONALES DE LA ENSEÑANZA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (211,'OTROS PROFESIONALES DE LA INGENIERÍA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (212,'OTROS PROFESIONALES DE LA SALUD');
insert  into `profesiones`(`idprofesion`,`oficio`) values (213,'OTROS PROFESIONALES DE LA SALUD ASOCIADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (214,'OTROS PROFESIONALES EN BASES DE DATOS Y REDES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (215,'OTROS PROFESORES DE ARTES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (216,'OTROS TÉCNICOS DE CONTROL DE PROCESOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (217,'OTROS TÉCNICOS EN CIENCIAS FÍSICAS E INGENIERÍA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (218,'OTROS TRABAJADORES DE APOYO ADMINISTRATIVO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (219,'OTROS TRABAJADORES DE ATENCIÓN A CLIENTES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (220,'OTROS TRABAJADORES DE CUIDADO PERSONAL EN LOS SERVICIOS DE SALUD');
insert  into `profesiones`(`idprofesion`,`oficio`) values (221,'OTROS TRABAJADORES DE LA CONSTRUCCIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (222,'OTROS TRABAJADORES DE LIMPIEZA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (223,'OTROS TRABAJADORES DE SERVICIOS DE PROTECCIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (224,'OTROS TRABAJADORES DE SERVICIOS PERSONALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (225,'OTROS TRABAJADORES DE VENTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (226,'OTROS TRABAJADORES PRIMARIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (227,'PANADEROS, PASTELEROS Y CONFITEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (228,'PARAMÉDICOS PROFESIONALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (229,'PARTERAS ASISTENTES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (230,'PELUQUEROS O PEINDADORAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (231,'PEONES DE CARGA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (232,'PEONES DE LA CONSTRUCCIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (233,'PERIODISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (234,'PERITOS Y ASESORES DE PÉRDIDA O VALUADORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (235,'PERSONAL DE MANTENIMIENTO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (236,'PERSONAL DE OFICINA EN GENERAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (237,'PESCADORES DE AGUAS INTERIORES Y COSTERAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (238,'PESCADORES DE AGUAS PROFUNDAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (239,'PESCADORES, CAZADORES, TRAMPEROS Y RECOLECTORES DE SUBSISTENCIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (240,'PINTORES DE SPRAY Y BARNIZADORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (241,'PINTORES Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (242,'PREPARADORES DE COMIDA RÁPIDA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (243,'PRESTAMISTAS DE CASAS DE EMPEÑO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (244,'PRODUCTORES AVÍCOLAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (245,'PRODUCTORES DE ÁRBOLES Y ARBUSTOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (246,'PRODUCTORES DE ANIMALES Y CULTIVOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (247,'PRODUCTORES DE CULTIVOS MIXTOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (248,'PRODUCTORES DE TABACO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (249,'PROFESIONALES ASOCIADOS DE TRABAJO SOCIAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (250,'PROFESIONALES ASOCIADOS EN MEDICINA TRADICIONAL Y COMPLEMENTARIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (251,'PROFESIONALES DE ENFERMERÍA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (252,'PROFESIONALES DE LA HIGIENE Y SALUD OCUPACIONAL Y AMBIENTAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (253,'PROFESIONALES DE LA PROTECCIÓN AL MEDIO AMBIENTE');
insert  into `profesiones`(`idprofesion`,`oficio`) values (254,'PROFESIONALES DE MEDICINA TRADICIONAL O COMPLEMENTARIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (255,'PROFESIONALES DE PUBLICIDAD Y MARKETING');
insert  into `profesiones`(`idprofesion`,`oficio`) values (256,'PROFESIONALES DE RECURSOS HUMANOS Y PERSONAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (257,'PROFESIONALES DE REDES INFORMÁTICAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (258,'PROFESIONALES DE RELACIONES PÚBLICAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (259,'PROFESIONALES DE VENTAS DE TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (260,'PROFESIONALES DE VENTAS MÉDICAS Y TÉCNICAS (CON EXCLUSIÓN DE LAS TIC)');
insert  into `profesiones`(`idprofesion`,`oficio`) values (261,'PROFESORES ADJUNTOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (262,'PROFESORES DE EDUCACIÓN ESPECIAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (263,'PROFESORES DE EDUCACIÓN SECUNDARIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (264,'PROFESORES DE EDUCACIÓN UNIVERSITARIA Y SUPERIOR');
insert  into `profesiones`(`idprofesion`,`oficio`) values (265,'PROFESORES DE FORMACIÓN PROFESIONAL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (266,'PROFESORES DE IDIOMAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (267,'PROFESORES DE MÚSICA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (268,'PROGRAMADORES DE APLICACIONES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (269,'PSICÓLOGOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (270,'QUÍMICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (271,'RECEPCIONISTAS (EN GENERAL)');
insert  into `profesiones`(`idprofesion`,`oficio`) values (272,'RECEPCIONISTAS DE HOTEL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (273,'RECOLECTORES DE AGUA Y LEÑA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (274,'RECOLECTORES DE BASURA Y PRODUCTOS PARA RECICLAR');
insert  into `profesiones`(`idprofesion`,`oficio`) values (275,'RELIGIOSOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (276,'REPARADORES DE BICICLETAS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (277,'REPRESENTANTES DE SEGUROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (278,'REPRESENTANTES DE VENTAS COMERCIALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (279,'REPRESENTANTES RELIGIOSOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (280,'SECRETARIAS (EN GENERAL)');
insert  into `profesiones`(`idprofesion`,`oficio`) values (281,'SECRETARIAS MÉDICAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (282,'SECRETARIOS ADMINISTRATIVOS Y EJECUTIVOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (283,'SECRETARIOS JUDICIALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (284,'SOCIÓLOGOS, ANTROPÓLOGOS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (285,'SUPERVISORES DE OFICINA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (286,'SUPERVISORES DE COMERCIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (287,'SUPERVISORES DE CONSTRUCCIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (288,'SUPERVISORES DE LIMPIEZA DE OFICINAS, HOTELES Y OTROS ESTABLECIMIENTOS,');
insert  into `profesiones`(`idprofesion`,`oficio`) values (289,'TÉCNICOS AGRÍCOLAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (290,'TÉCNICOS DE INGENIERÍA EN TELECOMUNICACIONES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (291,'TÉCNICOS DE INGENIERÍA MECÁNICA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (292,'TÉCNICOS DE INTERNET');
insert  into `profesiones`(`idprofesion`,`oficio`) values (293,'TÉCNICOS DE EQUIPOS DE IMÁGENES MÉDICAS Y TERAPÉUTICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (294,'TÉCNICOS DE GALERÍAS, MUSEOS Y BIBLIOTECA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (295,'TÉCNICOS DE INGENIERÍA ELÉCTRICA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (296,'TÉCNICOS DE LABORATORIOS MÉDICOS O PATOLÓGICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (297,'TÉCNICOS DE OPERACIÓN DE TECNOLOGÍAS DE LA INFORMACIÓN Y LA COMUNICACIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (298,'TÉCNICOS EN INGENIERÍA QUÍMICA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (299,'TÉCNICOS EN INGENIERÍA CIVIL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (300,'TÉCNICOS EN INGENIERÍA ELECTRÓNICA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (301,'TÉCNICOS EN MINERÍA Y METALURGIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (302,'TÉCNICOS EN CIENCIAS BIOLÓGICAS (EXCEPTO MÉDICOS)');
insert  into `profesiones`(`idprofesion`,`oficio`) values (303,'TÉCNICOS EN CIENCIAS FÍSICAS Y QUÍMICAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (304,'TÉCNICOS EN REDES Y SISTEMAS INFORMÁTICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (305,'TÉCNICOS EN REGISTROS DE INFORMACIÓN MÉDICA Y DE SALUD');
insert  into `profesiones`(`idprofesion`,`oficio`) values (306,'TÉCNICOS EN SOPORTE PARA EL USUARIO DE TECNOLOGÍAS DE INFORMACIÓN Y COMUNICACIÓN');
insert  into `profesiones`(`idprofesion`,`oficio`) values (307,'TÉCNICOS FORESTALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (308,'TÉCNICOS PROTESISTAS DENTALES Y MÉDICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (309,'TÉCNICOS Y ASISTENTES FARMACÉUTICOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (310,'TÉCNICOS Y ASISTENTES VETERINARIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (311,'TÉCNICOS Y AUXILIARES DE FISIOTERAPIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (312,'TAPICEROS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (313,'TECHADORES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (314,'TELEFONISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (315,'TRABAJADORAS DOMÉSTICAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (316,'TRABAJADORES ACUÍCOLAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (317,'TRABAJADORES AL CUIDADO DE NIÑOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (318,'TRABAJADORES CALLEJEROS Y DE SERVICIOS RELACIONADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (319,'TRABAJADORES DE AISLAMIENTO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (320,'TRABAJADORES DE CUIDADO PERSONAL A DOMICILIO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (321,'TRABAJADORES DE CULTIVOS AGRÍCOLAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (322,'TRABAJADORES DE FINCAS Y GRANJAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (323,'TRABAJADORES DE GRANJAS GANADERAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (324,'TRABAJADORES DE INGENIERÍA CIVIL');
insert  into `profesiones`(`idprofesion`,`oficio`) values (325,'TRABAJADORES DE LA PESCA Y LA ACUICULTURA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (326,'TRABAJADORES DE SALUD COMUNITARIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (327,'TRABAJADORES FORESTALES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (328,'TRABAJADORES FORESTALES Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (329,'TRADUCTORES, INTÉRPRETES Y OTROS LINGÜISTAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (330,'URBANISTAS E INGENIEROS DE TRÁFICO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (331,'VENDEDORES AMBULANTES (EXCEPTO DE ALIMENTOS)');
insert  into `profesiones`(`idprofesion`,`oficio`) values (332,'VENDEDORES DE ALIMENTOS EN LA CALLE');
insert  into `profesiones`(`idprofesion`,`oficio`) values (333,'VENDEDORES DE CENTRO DE CONTACTO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (334,'VENDEDORES DE CENTRO DE CONTACTO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (335,'VENDEDORES DE QUIOSCOS Y DE PUESTOS DE MERCADO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (336,'VENDEDORES PUERTA EN PUERTA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (337,'VETERINARIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (338,'YESEROS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (339,'ZAPATEROS Y AFINES');
insert  into `profesiones`(`idprofesion`,`oficio`) values (340,'ABOGADOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (341,'TEÓLOGO , SACERDOTE, PASTOR Y OFICIOS DE LA FE');
insert  into `profesiones`(`idprofesion`,`oficio`) values (342,'RECTOR O DIRECTOR DE INSTITUCION EDUCATIVA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (343,'AMA DE CASA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (344,'ESTUDIANTE DE ESCUELA PRIMARIA/SECUNDARIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (345,'ESTUDIANTE UNIVERSITARIO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (346,'NO RECUERDA Y/O SIN PROFESION');
insert  into `profesiones`(`idprofesion`,`oficio`) values (347,'PENSIONADO(A)');
insert  into `profesiones`(`idprofesion`,`oficio`) values (348,'DESPLAZADO(A)');
insert  into `profesiones`(`idprofesion`,`oficio`) values (349,'ADMINISTRADOR DE EMPRESAS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (350,'SOLDADOR');
insert  into `profesiones`(`idprofesion`,`oficio`) values (351,'MADRE COMUNITARIA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (352,'ENFERMERO (A)');
insert  into `profesiones`(`idprofesion`,`oficio`) values (353,'OFICIOS VARIOS');
insert  into `profesiones`(`idprofesion`,`oficio`) values (354,'FARMACEUTA');
insert  into `profesiones`(`idprofesion`,`oficio`) values (355,'VISITADOR MEDICO');
insert  into `profesiones`(`idprofesion`,`oficio`) values (356,'DESEMPLEADO(A)');

/*Table structure for table `recurso` */

DROP TABLE IF EXISTS `recurso`;

CREATE TABLE `recurso` (
  `idrecurso` smallint(2) NOT NULL AUTO_INCREMENT,
  `url` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `icono` varchar(50) CHARACTER SET utf8 NOT NULL,
  `icono2` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idrecurso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `recurso` */

insert  into `recurso`(`idrecurso`,`url`,`nombre`,`tipo`,`icono`,`icono2`) values (2,'/sefiz','Mi Sefiz','M','extra/css/img/sefiz.png','icon2');
insert  into `recurso`(`idrecurso`,`url`,`nombre`,`tipo`,`icono`,`icono2`) values (3,'/prospectos','Prospectos','M','extra/css/img/red_prospe.png','icon2');
insert  into `recurso`(`idrecurso`,`url`,`nombre`,`tipo`,`icono`,`icono2`) values (4,'/mi_red','Mi Red','M','extra/css/img/icon_red.png','icon2');
insert  into `recurso`(`idrecurso`,`url`,`nombre`,`tipo`,`icono`,`icono2`) values (5,'/productividad','Productividad','M','extra/css/img/productividad.png','icon2');

/*Table structure for table `red` */

DROP TABLE IF EXISTS `red`;

CREATE TABLE `red` (
  `idred` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom_red` varchar(50) NOT NULL,
  `idpadre` int(11) NOT NULL,
  `idhijo` int(11) NOT NULL,
  `idnivel` tinyint(2) NOT NULL DEFAULT '1',
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_ubicacion` date NOT NULL,
  PRIMARY KEY (`idred`),
  KEY `fk_red_personas1_idx` (`idpadre`),
  KEY `fk_red_personas2_idx` (`idhijo`),
  KEY `FK_red` (`idnivel`),
  CONSTRAINT `FK_red` FOREIGN KEY (`idnivel`) REFERENCES `niveles` (`idniveles`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_red_personas1` FOREIGN KEY (`idpadre`) REFERENCES `personas` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_red_personas2` FOREIGN KEY (`idhijo`) REFERENCES `personas` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `red` */

insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (1,'Red3',3,4,3,1,'2016-04-23');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (8,'Red3',3,5,1,1,'2016-04-24');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (9,'Red3',3,6,1,1,'2016-04-24');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (10,'Red3',3,8,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (11,'Red3',3,9,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (12,'Red3',3,10,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (13,'Red4',4,11,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (14,'Red4',4,12,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (15,'Red4',4,21,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (16,'Red4',4,22,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (17,'Red4',4,23,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (18,'Red3',3,24,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (19,'Red3',3,25,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (20,'Red4',4,26,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (21,'Red4',4,27,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (22,'Red4',4,28,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (23,'Red3',3,33,1,1,'0000-00-00');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (24,'Red4',4,34,1,1,'2016-06-20');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (25,'red4',4,35,1,1,'2016-07-25');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (26,'red4',3,7,1,1,'2016-09-13');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (27,'red4',3,29,1,1,'2016-09-13');
insert  into `red`(`idred`,`nom_red`,`idpadre`,`idhijo`,`idnivel`,`estado`,`fecha_ubicacion`) values (28,'red4',3,30,1,1,'2016-09-13');

/*Table structure for table `tabla_perfil` */

DROP TABLE IF EXISTS `tabla_perfil`;

CREATE TABLE `tabla_perfil` (
  `idtablaperfil` varchar(1) NOT NULL COMMENT 'Solo letras del abecedario',
  `tabla` varchar(45) NOT NULL,
  `perfil_sefiz` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`idtablaperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tabla_perfil` */

insert  into `tabla_perfil`(`idtablaperfil`,`tabla`,`perfil_sefiz`) values ('A','frm_prospectos','PR');
insert  into `tabla_perfil`(`idtablaperfil`,`tabla`,`perfil_sefiz`) values ('B','frm_aprendiz','AP');
insert  into `tabla_perfil`(`idtablaperfil`,`tabla`,`perfil_sefiz`) values ('C','frm_lider','LI');

/*Table structure for table `tema_actividad` */

DROP TABLE IF EXISTS `tema_actividad`;

CREATE TABLE `tema_actividad` (
  `idtema_actividad` tinyint(4) NOT NULL AUTO_INCREMENT,
  `idactividad` tinyint(2) DEFAULT NULL,
  `idtema` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`idtema_actividad`),
  KEY `FK_ACTIVIDAD` (`idactividad`),
  KEY `FK_TEMA` (`idtema`),
  CONSTRAINT `FK_ACTIVIDAD` FOREIGN KEY (`idactividad`) REFERENCES `actividades` (`idactividad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TEMA` FOREIGN KEY (`idtema`) REFERENCES `temas` (`idtema`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tema_actividad` */

insert  into `tema_actividad`(`idtema_actividad`,`idactividad`,`idtema`) values (1,1,1);
insert  into `tema_actividad`(`idtema_actividad`,`idactividad`,`idtema`) values (2,2,2);
insert  into `tema_actividad`(`idtema_actividad`,`idactividad`,`idtema`) values (3,3,3);
insert  into `tema_actividad`(`idtema_actividad`,`idactividad`,`idtema`) values (4,4,4);

/*Table structure for table `tema_perfil` */

DROP TABLE IF EXISTS `tema_perfil`;

CREATE TABLE `tema_perfil` (
  `idtema_perfil` tinyint(6) NOT NULL AUTO_INCREMENT,
  `idperfil` char(1) NOT NULL,
  `idtema` smallint(6) NOT NULL,
  PRIMARY KEY (`idtema_perfil`),
  KEY `FK_tema_perfil` (`idtema`),
  CONSTRAINT `FK_tema_perfil` FOREIGN KEY (`idtema`) REFERENCES `temas` (`idtema`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tema_perfil` */

insert  into `tema_perfil`(`idtema_perfil`,`idperfil`,`idtema`) values (1,'A',1);
insert  into `tema_perfil`(`idtema_perfil`,`idperfil`,`idtema`) values (2,'A',2);
insert  into `tema_perfil`(`idtema_perfil`,`idperfil`,`idtema`) values (3,'A',3);
insert  into `tema_perfil`(`idtema_perfil`,`idperfil`,`idtema`) values (4,'A',4);
insert  into `tema_perfil`(`idtema_perfil`,`idperfil`,`idtema`) values (5,'B',5);
insert  into `tema_perfil`(`idtema_perfil`,`idperfil`,`idtema`) values (6,'B',6);
insert  into `tema_perfil`(`idtema_perfil`,`idperfil`,`idtema`) values (7,'B',7);
insert  into `tema_perfil`(`idtema_perfil`,`idperfil`,`idtema`) values (8,'B',8);
insert  into `tema_perfil`(`idtema_perfil`,`idperfil`,`idtema`) values (9,'B',9);

/*Table structure for table `temas` */

DROP TABLE IF EXISTS `temas`;

CREATE TABLE `temas` (
  `idtema` smallint(6) NOT NULL AUTO_INCREMENT,
  `cod_tema` varchar(2) NOT NULL,
  `tema` varchar(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`idtema`),
  UNIQUE KEY `idtema` (`idtema`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `temas` */

insert  into `temas`(`idtema`,`cod_tema`,`tema`,`descripcion`) values (1,'CT','Contactar','XXXXXXXX');
insert  into `temas`(`idtema`,`cod_tema`,`tema`,`descripcion`) values (2,'PN','Presentacion del Negocio','XXXXXXXX');
insert  into `temas`(`idtema`,`cod_tema`,`tema`,`descripcion`) values (3,'SG','Seguimiento','XXXXXXXX');
insert  into `temas`(`idtema`,`cod_tema`,`tema`,`descripcion`) values (4,'CR','Cierre','XXXXXXXX');
insert  into `temas`(`idtema`,`cod_tema`,`tema`,`descripcion`) values (5,'EJ','Entendiendo el Juego','XXXXXXXX');
insert  into `temas`(`idtema`,`cod_tema`,`tema`,`descripcion`) values (6,'DN','Dias Vitales de Nuevo','XXXXXXXX');
insert  into `temas`(`idtema`,`cod_tema`,`tema`,`descripcion`) values (7,'PD','El Poder del Sistema','XXXXXXXX');
insert  into `temas`(`idtema`,`cod_tema`,`tema`,`descripcion`) values (8,'HH','Hogar Dulce Hogar','XXXXXXXX');
insert  into `temas`(`idtema`,`cod_tema`,`tema`,`descripcion`) values (9,'GD','Como Ganar Dinero','XXXXXXXX');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL DEFAULT 'user.png',
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fechaCreacion` date NOT NULL,
  `usuarioCreacion` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `FK_usuario_persona` FOREIGN KEY (`idUsuario`) REFERENCES `personas` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`idUsuario`,`user`,`password`,`email`,`avatar`,`estado`,`fechaCreacion`,`usuarioCreacion`) values (3,'anslara89','e10adc3949ba59abbe56e057f20f883e','anslara89@gmail.com','lara.jpg','A','2016-02-15',0);
insert  into `usuario`(`idUsuario`,`user`,`password`,`email`,`avatar`,`estado`,`fechaCreacion`,`usuarioCreacion`) values (4,'lex1102','c667d53acd899a97a85de0c201ba99be','alexanderlozano950@gmail.com','foto.jpg','A','2016-03-30',3);
insert  into `usuario`(`idUsuario`,`user`,`password`,`email`,`avatar`,`estado`,`fechaCreacion`,`usuarioCreacion`) values (8,'jessica','c667d53acd899a97a85de0c201ba99be','jekiita@hotmail.com','jessica.jpg','I','2016-09-02',3);
insert  into `usuario`(`idUsuario`,`user`,`password`,`email`,`avatar`,`estado`,`fechaCreacion`,`usuarioCreacion`) values (9,'santiago','c667d53acd899a97a85de0c201ba99be','santiagor8a@gmail.com','rua.jpg','A','2016-09-02',3);
insert  into `usuario`(`idUsuario`,`user`,`password`,`email`,`avatar`,`estado`,`fechaCreacion`,`usuarioCreacion`) values (10,'florentino','c667d53acd899a97a85de0c201ba99be','florentinoq@gmail.com','florentino.jpg','A','2016-09-02',3);
insert  into `usuario`(`idUsuario`,`user`,`password`,`email`,`avatar`,`estado`,`fechaCreacion`,`usuarioCreacion`) values (12,'carol','c667d53acd899a97a85de0c201ba99be','carolain@gmail.com  ','user.png','A','2016-09-02',4);

/*Table structure for table `usuarioperfil` */

DROP TABLE IF EXISTS `usuarioperfil`;

CREATE TABLE `usuarioperfil` (
  `idUsuarioPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idperfil` tinyint(2) NOT NULL,
  PRIMARY KEY (`idUsuarioPerfil`),
  KEY `FK_usuarioperfil` (`idusuario`),
  KEY `FK_usuarioperfil_2` (`idperfil`),
  CONSTRAINT `FK_usuarioperfil` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_usuarioperfil_2` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `usuarioperfil` */

insert  into `usuarioperfil`(`idUsuarioPerfil`,`idusuario`,`idperfil`) values (1,3,1);
insert  into `usuarioperfil`(`idUsuarioPerfil`,`idusuario`,`idperfil`) values (2,4,2);
insert  into `usuarioperfil`(`idUsuarioPerfil`,`idusuario`,`idperfil`) values (3,10,3);
insert  into `usuarioperfil`(`idUsuarioPerfil`,`idusuario`,`idperfil`) values (4,8,3);
insert  into `usuarioperfil`(`idUsuarioPerfil`,`idusuario`,`idperfil`) values (5,9,3);
insert  into `usuarioperfil`(`idUsuarioPerfil`,`idusuario`,`idperfil`) values (6,12,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
