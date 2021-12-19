package com.lauracristina.redballoon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class RedballoonApplication implements CommandLineRunner {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public static void main(String[] args) {
		SpringApplication.run(RedballoonApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

		jdbcTemplate.execute("CREATE TABLE aluno(id SERIAL, nome VARCHAR(255), dataNascimento CHAR(8), anoEscola VARCHAR(10), escola VARCHAR(255), PRIMARY KEY (id))");

		jdbcTemplate.update("INSERT INTO aluno(nome) VALUES (?,?,?,?,?)", "Marcos Paulo");
		/*
		jdbcTemplate.update("INSERT INTO aluno(nome) VALUES (?)", "Laura Cristina");
		jdbcTemplate.update("INSERT INTO aluno(nome) VALUES (?)", "Latifa");
		jdbcTemplate.update("INSERT INTO aluno(nome) VALUES (?)", "Scott");
		jdbcTemplate.update("INSERT INTO aluno(nome) VALUES (?)", "Ágata");
		*/

		//CRIAÇÃO DAS TABELAS

		/*		jdbcTemplate.execute ("CREATE TABLE responsavel(id_Resp SERIAL, cpf VARCHAR(255), data_nasc DATE, email VARCHAR(255), telefone VARCHAR(255), profissao VARCHAR(255), PRIMARY KEY (id_Resp))");

		jdbcTemplate.execute("CREATE TABLE alunos (id_alunos SERIAL, nome VARCHAR(255), cpf VARCHAR(255), escola VARCHAR(255), turma VARCHAR(255), email VARCHAR(255), id_Resp SERIAL, PRIMARY KEY (id_alunos), FOREIGN KEY(id_Resp))");

		jdbcTemplate.execute("CREATE TABLE matricula (idMatricula SERIAL, id_alunos SERIAL, idMensalidade SERIAL, PRIMARY KEY(idMatricula), FORREIGN KEY(id_alunos), FOREIGN KEY(idMensalidade))");

		jdbcTemplate.execute("CREATE TABLE mensalidade (idMensalidade SERIAL, valor float, id_alunos SERIAL, PRIMARY KEY(idMensalidade), FORREIGN KEY(id_alunos))");

		jdbcTemplate.execute("CREATE TABLE dados_med (idHosp SERIAL, medico VARCHAR(255), hospital VARCHAR(255), alergia VARCHAR(255), id_alunos SERIAL, PRIMARY KEY(idHosp), FOREIGN KEY(id_alunos))");

		*/
	}


	
}
