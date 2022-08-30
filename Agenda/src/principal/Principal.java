package principal;

import br.edu.ifba.agenda.basicas.Categoria;
import br.edu.ifba.agenda.colecao.ColecaoCategoria;

public class Principal {

	public static void main(String[] args) {
		Categoria c = new Categoria("Teste");
		ColecaoCategoria cg = new ColecaoCategoria();
		
		cg.adicionarCategoria(c);
	}
}