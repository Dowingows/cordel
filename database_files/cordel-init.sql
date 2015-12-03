-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.24 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela cordel.areas
CREATE TABLE IF NOT EXISTS `areas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `appear` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `controller` varchar(25) NOT NULL,
  `controller_label` varchar(50) DEFAULT NULL,
  `action` varchar(25) NOT NULL,
  `action_label` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `appear` (`appear`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela cordel.areas: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` (`id`, `parent_id`, `appear`, `controller`, `controller_label`, `action`, `action_label`) VALUES
	(1, NULL, 1, 'Users', 'Usu&aacute;rios', 'index', 'Todos'),
	(2, NULL, 0, 'Users', 'Usu&aacute;rios', 'add', 'Criar Novo'),
	(3, NULL, 0, 'Users', 'Usu&aacute;rios', 'edit', 'Editar'),
	(4, NULL, 0, 'Users', 'Usu&aacute;rios', 'delete', 'Excluir'),
	(5, 1, 1, 'Profiles', 'Perf&iacute;s de Usu&aacute;rio', 'index', 'Todos'),
	(6, NULL, 0, 'Profiles', 'Perf&iacute;s de Usu&aacute;rio', 'add', 'Criar Novo'),
	(7, NULL, 0, 'Profiles', 'Perf&iacute;s de Usu&aacute;rio', 'edit', 'Editar'),
	(8, NULL, 0, 'Profiles', 'Perf&iacute;s de Usu&aacute;rio', 'delete', 'Excluir'),
	(9, NULL, 0, 'Profiles', 'Perf&iacute;s de Usu&aacute;rio', 'view', 'Visualizar'),
	(10, NULL, 0, 'Users', 'Usu&aacute;rios', 'view', 'Visualizar'),
	(11, NULL, 1, 'Repositories', 'Reposit&oacute;rios', 'index', 'Todos'),
	(12, NULL, 0, 'Repositories', 'Reposit&oacute;rios', 'add', 'Enviar');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;


-- Copiando estrutura para tabela cordel.areas_profiles
CREATE TABLE IF NOT EXISTS `areas_profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_id` int(11) unsigned NOT NULL,
  `profile_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_profile` (`area_id`,`profile_id`),
  KEY `profile_area_idx` (`profile_id`),
  CONSTRAINT `area_area_profile` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profile_area` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cordel.areas_profiles: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `areas_profiles` DISABLE KEYS */;
INSERT INTO `areas_profiles` (`id`, `area_id`, `profile_id`) VALUES
	(30, 1, 1),
	(25, 1, 2),
	(31, 2, 1),
	(26, 2, 2),
	(32, 3, 1),
	(27, 3, 2),
	(33, 4, 1),
	(28, 4, 2),
	(35, 5, 1),
	(36, 6, 1),
	(37, 7, 1),
	(38, 8, 1),
	(39, 9, 1),
	(34, 10, 1),
	(29, 10, 2),
	(40, 11, 1),
	(41, 12, 1);
/*!40000 ALTER TABLE `areas_profiles` ENABLE KEYS */;


-- Copiando estrutura para tabela cordel.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cordel.profiles: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` (`id`, `name`, `created`, `modified`) VALUES
	(1, 'Admin', '0000-00-00 00:00:00', '2015-12-02 15:18:47'),
	(2, 'Perfil Teste', '2012-03-25 00:21:45', '2012-04-02 17:09:38');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;


-- Copiando estrutura para tabela cordel.repositories
CREATE TABLE IF NOT EXISTS `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cordel.repositories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;


-- Copiando estrutura para tabela cordel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) unsigned NOT NULL,
  `password` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `pass_switched` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `users_profiles` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cordel.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `profile_id`, `password`, `name`, `email`, `last_login`, `pass_switched`, `created`, `modified`) VALUES
	(1, 1, 'a78f76a37a7f699f39b324ba58b2aad5', 'Administrador', 'admin', '2015-12-03 02:20:07', 1, '0000-00-00 00:00:00', '2015-12-03 02:20:07'),
	(5, 2, '9bc5f2b8fb63d9ec807dc1d6e35ebf6e', 'Teste', 'teste@teste.com', '2012-04-02 22:41:30', 1, '2012-03-23 15:49:04', '2012-04-02 22:41:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
