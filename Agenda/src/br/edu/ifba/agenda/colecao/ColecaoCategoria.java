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
	
	public void update (Categoria c) {
		try {
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("update Categoria set nome = ? where id = ?");
			stmt.setString(1, c.getNome());
			stmt.setInt(2, c.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deletar (Categoria c) {
		try {
			PreparedStatement stmt = Conexao.getConnection().prepareStatement("delete from Categoria where id = ?");
			stmt.setInt(1, c.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}