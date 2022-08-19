-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Ago-2022 às 22:09
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

CREATE TABLE `candidato` (
  `id` int(11) NOT NULL,
  `nome` varchar(90) NOT NULL,
  `partido` varchar(90) NOT NULL,
  `ficha_limpa` enum('S','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `candidato`
--

INSERT INTO `candidato` (`id`, `nome`, `partido`, `ficha_limpa`) VALUES
(12, 'Ciro Gomes', 'PDT', 'S'),
(13, 'Luiz Inácio Lula da Silva', 'PT', 'S'),
(22, 'Jair Bolssonaro', 'PL', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidatoxpesquisa`
--

CREATE TABLE `candidatoxpesquisa` (
  `id` int(11) NOT NULL,
  `candidato` int(11) NOT NULL,
  `pesquisa` int(11) NOT NULL,
  `votos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `candidatoxpesquisa`
--

INSERT INTO `candidatoxpesquisa` (`id`, `candidato`, `pesquisa`, `votos`) VALUES
(1, 12, 1, 10456000),
(2, 12, 2, 12500000),
(3, 13, 1, 55000000),
(4, 13, 2, 58000000),
(5, 22, 1, 34000000),
(6, 22, 2, 40000000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pesquisa`
--

CREATE TABLE `pesquisa` (
  `id` int(11) NOT NULL,
  `instituto` varchar(90) NOT NULL,
  `data` date NOT NULL,
  `local` varchar(90) NOT NULL,
  `media_idade` int(11) NOT NULL,
  `tipo` enum('Induzida','Livre') NOT NULL,
  `formato` enum('Telefone','Presencial') NOT NULL,
  `tipo_pesquisa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pesquisa`
--

INSERT INTO `pesquisa` (`id`, `instituto`, `data`, `local`, `media_idade`, `tipo`, `formato`, `tipo_pesquisa`) VALUES
(1, 'INSTITUTO IDEIA', '2022-08-10', 'Brasilia', 38, 'Livre', 'Telefone', 1),
(2, 'IPESPE', '2022-08-07', 'Sao Paulo', 42, 'Induzida', 'Presencial', 2),
(3, 'IPESPE', '2022-08-05', 'Rio de Janeiro', 42, 'Induzida', 'Telefone', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pesquisa`
--

CREATE TABLE `tipo_pesquisa` (
  `id` int(11) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_pesquisa`
--

INSERT INTO `tipo_pesquisa` (`id`, `descricao`) VALUES
(1, 'Pesquisa quantitativa que consiste na realização de entrevistas por telefone; com a aplicação de questionário com livre escolha junto a uma amostra representativa do eleitorado em estudo. O modelo de amostragem aplicado por cotas, com distribuição proporcional ao tamanho da população.'),
(2, 'Pesquisa quantitativa induzida que consiste na realização de entrevistas, face a face em ponto de fluxo e residências aleatórias e separadas para que não haja favorecimento de candidatos; com a aplicação de questionário estruturado junto a uma amostra representativa do eleitorado em estudo. O modelo de amostragem aplicado por cotas, com distribuição proporcional ao tamanho da população.');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `candidatoxpesquisa`
--
ALTER TABLE `candidatoxpesquisa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pesquisa` (`pesquisa`),
  ADD KEY `fk_candidato` (`candidato`);

--
-- Índices para tabela `pesquisa`
--
ALTER TABLE `pesquisa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipopesquisa` (`tipo_pesquisa`);

--
-- Índices para tabela `tipo_pesquisa`
--
ALTER TABLE `tipo_pesquisa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `candidatoxpesquisa`
--
ALTER TABLE `candidatoxpesquisa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pesquisa`
--
ALTER TABLE `pesquisa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_pesquisa`
--
ALTER TABLE `tipo_pesquisa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `candidatoxpesquisa`
--
ALTER TABLE `candidatoxpesquisa`
  ADD CONSTRAINT `fk_candidato` FOREIGN KEY (`candidato`) REFERENCES `candidato` (`id`),
  ADD CONSTRAINT `fk_pesquisa` FOREIGN KEY (`pesquisa`) REFERENCES `pesquisa` (`id`);

--
-- Limitadores para a tabela `pesquisa`
--
ALTER TABLE `pesquisa`
  ADD CONSTRAINT `fk_tipopesquisa` FOREIGN KEY (`tipo_pesquisa`) REFERENCES `tipo_pesquisa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
