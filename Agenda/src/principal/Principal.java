package principal;

import br.edu.ifba.agenda.basicas.Categoria;
import br.edu.ifba.agenda.colecao.ColecaoCategoria;

public class Principal {

	public static void main(String[] args) {
		Categoria c = new Categoria("Teste");
		ColecaoCategoria cg = new ColecaoCategoria();
		Categoria c2 = new Categoria (1, "Teste2");
		Categoria c3 = new Categoria (1);
		
		
		//cg.adicionarCategoria(c);
		//cg.update(c2);
		//cg.deletar(c2);
		
		//cg.listarCategoria().forEach(System.out::println);
		
		System.out.println(cg.procurarCategoriaId(5));
		System.out.println(cg.procurarCategoriaNome("Familia"));
	}
}