-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 23, 2024 at 03:18 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `casostestes`
--

-- --------------------------------------------------------

--
-- Table structure for table `casodeteste`
--

DROP TABLE IF EXISTS `casodeteste`;
CREATE TABLE IF NOT EXISTS `casodeteste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(250) DEFAULT NULL,
  `entrada` varchar(250) DEFAULT NULL,
  `saida` varchar(250) DEFAULT NULL,
  `ambiente` varchar(250) DEFAULT '--',
  `exigenciasespeciais` varchar(250) DEFAULT '--',
  `precondicoes` varchar(250) DEFAULT NULL,
  `poscondicoes` varchar(250) DEFAULT NULL,
  `cenario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `casodeteste`
--

INSERT INTO `casodeteste` (`id`, `descricao`, `entrada`, `saida`, `ambiente`, `exigenciasespeciais`, `precondicoes`, `poscondicoes`, `cenario`) VALUES
(1, 'cadastrar jogador com sucesso', 'nome, numero, telefone, email', 'mensagem \"usuario criado com sucesso\"', '--', '--', 'usuario logado, time criado', 'jogador criado com sucesso', 1),
(2, 'tentar cadastrar jogador com numero ja cadastrado', 'nome, numero, telefone, email', 'mensagem \"erro: ja existe jogador com este numero\"', '--', '--', 'usuario logado, time criado, jogador com mesmo numero cadastrado', '--', 1),
(3, 'tentar cadastrar com dados incompletos', 'nome, numero', 'mensagem \"erro: dados obrigatorios nao preenchidos\"', '--', '--', 'usuario logado time criado', '--', 1),
(4, 'cadastrar jogo com sucesso', 'a data e o horario do jogo, o local, o nome do time adversario, os nomes do juiz e do juiz auxiliar;', 'mensagem \"jogo cadastrado com sucesso\"', '--', '--', 'time cadastrado, time advesario cadastrado, juizes cadastrado', 'jogo cadastrado com sucesso', 2),
(5, 'erro  ao cadastrar jogo', 'a data e o horario do jogo, o local, os nomes do juiz e do juiz auxiliar;', 'mensagem \"erro ao cadastrar jogo\"', '--', '--', 'time cadastrado, time advesario cadastrado, juizes cadastrado', 'sem ateraçoes nos jogos cadastrados', 2),
(6, 'ponto cadastrado com sucesso', 'jogo, time, jogador, tipo de ponto', 'mensagem \"ponto cadastrado com sucesso\"', '--', '--', 'time cadastrado, time advesario cadastrado, jogo cadastrado, time principal cadastrado, tipos de ponto cadastrado', 'ponto cadastrado com sucesso', 3),
(7, 'erro ao cadastrar ponto', 'jogo, time, jogador', 'mensagem \"ponto nao cadastrado\"', '--', '--', 'time cadastrado, time advesario cadastrado, jogo cadastrado, time principal cadastrado, tipos de ponto cadastrado', 'erro ao cadastrar ponto', 3),
(8, 'erro ao cadastrar ponto', 'time, jogador, tipo de ponto', 'mensagem \"ponto nao cadastrado\"', '--', '--', 'time cadastrado, time advesario cadastrado, jogo cadastrado, time principal cadastrado, tipos de ponto cadastrado', 'erro ao cadastrar ponto', 3),
(9, 'relatorio gerado com sucesso', 'jogo, jogador', 'mensagem \"relatorio gerado por jogador\"', '--', '--', 'time cadastrado, time advesario cadastrado, jogo cadastrado, time principal cadastrado, tipos de ponto cadastrado', 'relatorio gerado com sucesso', 4),
(10, 'relatorio por treinador gerado com sucesso', 'jogo, treinador', 'mensagem \"relatorio gerado por treinador\"', '--', '--', 'time cadastrado, time advesario cadastrado, jogo cadastrado, time principal cadastrado, tipos de ponto cadastrado', 'relatorio gerado com sucesso', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cenarios`
--

DROP TABLE IF EXISTS `cenarios`;
CREATE TABLE IF NOT EXISTS `cenarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requisito` varchar(250) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cenarios`
--

INSERT INTO `cenarios` (`id`, `requisito`, `descricao`) VALUES
(1, 'RF-001', 'Cadastrar Jogador'),
(2, 'RF-002', 'Cadastrar Jogo'),
(3, 'RF-003', 'Cadastrar Ponto no SET'),
(4, 'RF-004', 'Gera Relatorio');

-- --------------------------------------------------------

--
-- Table structure for table `procedimento`
--

DROP TABLE IF EXISTS `procedimento`;
CREATE TABLE IF NOT EXISTS `procedimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(250) DEFAULT NULL,
  `resultadoesperado` varchar(250) DEFAULT NULL,
  `caso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `procedimento`
--

INSERT INTO `procedimento` (`id`, `acao`, `resultadoesperado`, `caso`) VALUES
(1, '1 acessa tela de cadastro de jogadores no time', '1 exibe tela com formulario para cadastro de jogador', 1),
(2, '2 preenche formulario com dados de entrada e clica botao cadastrar', '2 sistema processa e salva jogador com os dados preenchidos', 1),
(3, ' 1 acessa tela de cadastro de jogadores no time', '1 exibe tela com formulario para cadastro de jogador', 2),
(4, '2 preenche formulario com dados de entrada e clica botao cadastrar', '2 sistema retorna mensagem com erro de cadastro por numero em duplicidade, voltando para autofocus no campo para substituicao', 2),
(5, '1 acessa tela de cadastro de jogadores no time', '1 exibe tela com formulario para cadastro de jogador', 3),
(6, '2 preenche formulario com dados de entrada e clica botao cadastrar', '2 sistema retorna mensagem com erro de cadastro por dados obrigatorios incompletos, voltando para autofocus no campo o primeiro campo em branco', 3),
(7, 'acessa tela de cadastro de jogo', 'exibe tela de cadastro de jogo', 4),
(8, 'preenche formulario marcando horario, data, selecionando time adversario, seleciona juizes e clica em criar', 'cadastra um jogo com sucesso', 4),
(9, 'acessa tela de cadastro de jogo', 'exibe tela de cadastro de jogo', 5),
(10, 'preenche formulario marcando horario, data, NAO SELECIONA adversario, seleciona juizes e clica em criar', 'erro ao cadastrar jogo', 5),
(11, 'acessa tela de cadastro de ponto', 'exibe tela de cadastro de ponto', 6),
(12, 'preenche formulario: jogo, jogador e tipo do ponto e clica em criar', 'sucesso ao cadastrar ponto', 6),
(13, 'acessa tela de cadastro de ponto', 'exibe tela de cadastro de ponto', 7),
(14, 'preenche formulario: jogo, jogador mas nao seleciona o tipo do ponto e clica em criar', 'erro ao cadastrar ponto', 7),
(15, 'acessa tela de cadastro de ponto', 'exibe tela de cadastro de ponto', 8),
(16, 'preenche formulario: jogador, tipo do ponto \r\n mas nao seleciona o jogo e clica em criar', 'erro ao cadastrar ponto', 8),
(17, 'acessa tela de gerar relatorio', 'exibe tela de gerar relatorio', 9),
(18, 'seleciona o jogador que deseja o relatorio e clica em gerar', 'gera relatorio por jogador', 9),
(19, 'acessa tela de gerar relatorio', 'exibe tela de gerar relatorio', 10),
(20, 'seleciona o treinador que deseja o relatorio e clica em gerar', 'gera relatorio por treinador', 10);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
