CREATE TABLE IF NOT EXISTS  `alunos` (
  `idAlunos` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `escola` varchar(45) DEFAULT NULL,
  `turma` varchar(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAlunos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS  `dados_med` (
  `id_Hosp` int NOT NULL,
  `medico` varchar(45) DEFAULT NULL,
  `hospital` varchar(45) DEFAULT NULL,
  `alergia` varchar(45) DEFAULT NULL,
  `idAlunos` int DEFAULT NULL,
  PRIMARY KEY (`id_Hosp`),
  KEY `fk_dados_med_1_idx` (`idAlunos`),
  CONSTRAINT `fk_idAlunos` FOREIGN KEY (`idAlunos`) REFERENCES `alunos` (`idAlunos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS  `mensalidade` (
  `idmensalidade` int NOT NULL,
  `valor` float DEFAULT NULL,
  `idAlunos` int DEFAULT NULL,
  PRIMARY KEY (`idmensalidade`),
  KEY `idAlunos_idx` (`idAlunos`),
  CONSTRAINT `idAlunos` FOREIGN KEY (`idAlunos`) REFERENCES `alunos` (`idAlunos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS  `matricula` (
  `idmatricula` int NOT NULL,
  `idAlunos` int DEFAULT NULL,
  `idmensalidade` int DEFAULT NULL,
  PRIMARY KEY (`idmatricula`),
  KEY `fk_idAlunos_idx` (`idAlunos`),
  KEY `fk_idMensalidade_idx` (`idmensalidade`),
  CONSTRAINT `fk_idAlunos2` FOREIGN KEY (`idAlunos`) REFERENCES `alunos` (`idAlunos`),
  CONSTRAINT `fk_idMensalidade` FOREIGN KEY (`idmensalidade`) REFERENCES `mensalidade` (`idmensalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS  `responsavel` (
  `id_Resp` int NOT NULL,
  `cpf` char(11) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` char(11) DEFAULT NULL,
  `profissao` varchar(45) DEFAULT NULL,
  `alunos_idAlunos` int NOT NULL,
  PRIMARY KEY (`id_Resp`),
  KEY `fk_responsavel_alunos1_idx` (`alunos_idAlunos`),
  CONSTRAINT `fk_responsavel_alunos1` FOREIGN KEY (`alunos_idAlunos`) REFERENCES `alunos` (`idAlunos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
