import java.util.ArrayList;

class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}

class Mago extends Personagem {
    private String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }

    public String lancarFeitico() {
        return "O mago lançou o feitiço: " + magia;
    }
}

class Divisao {
    String nome;

    public Divisao(String nome) {
        this.nome = nome;
    }
}

class Castelo {
    String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.nome = nome;
        this.divisoes = divisoes;
    }

    public void adicionarDivisao(Divisao divisao) {
        divisoes.add(divisao);
    }
}

public class Main {
    public static void main(String[] args) {
        ArrayList<Divisao> listaDivisoes = new ArrayList<>();
        listaDivisoes.add(new Divisao("Cozinha"));
        listaDivisoes.add(new Divisao("Biblioteca"));
        listaDivisoes.add(new Divisao("Sala de Poções"));

        Castelo castelo = new Castelo("Castelo Animado", listaDivisoes);
        castelo.adicionarDivisao(new Divisao("Laboratório Mágico"));

        Mago howl = new Mago("Mago 1", 27, "Magia de Invisiblidade");

        System.out.println(howl.lancarFeitico());
    }
}
