package br.edu.ifba.agenda.cadastros;

import br.edu.ifba.agenda.basicas.Categoria;
import br.edu.ifba.agenda.colecao.ColecaoCategoria;
import br.edu.ifba.agenda.exception.CadastroCategoriaException;

public class CadastroCategoria {
	ColecaoCategoria col = new ColecaoCategoria();
	
	public void adicionarCategoria(Categoria c) throws CadastroCategoriaException {		
		if(col.procurarCategoriaNome(c.getNome()) != null) {
			CadastroCategoriaException ex = new CadastroCategoriaException(c.getNome());
			throw(ex);
		}
		
		this.col.adicionarCategoria(c);	
	}
}
