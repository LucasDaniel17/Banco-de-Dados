package br.edu.ifba.agenda.colecao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.edu.ifba.agenda.basicas.Categoria;

public class ColecaoCategoria {

	public void adicionarCategoria(Categoria c) {
		try {
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("insert into Categoria (nome) values (?)");
			stmt.setString(1, c.getNome());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}