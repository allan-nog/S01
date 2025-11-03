import java.util.HashMap;

interface IRastreavel {
    String obterCoordenadas();
}

class Poder {
    public String nome;

    public Poder(String nome) {
        this.nome = nome;
    }
}

class Entidades implements IRastreavel {
    public String nome;
    protected String localizacao;

    public Entidades(String nome, String local, Poder poder) {
        this.nome = nome;
        this.localizacao = local;
    }

    @Override
    public String obterCoordenadas() {
        return localizacao;
    }
}

class Youkai extends Entidades {
    private Poder _poder;

    public Youkai(String nome, String local, Poder poder) {
        super(nome, local, poder);
        this._poder = poder;
    }

    @Override
    public String obterCoordenadas() {
        return "Youkai " + nome + " detectado em " + localizacao + " com poder: " + _poder.nome;
    }
}

class Alien extends Entidades {
    private String planetaOrigem;
    private String Ovni;

    public Alien(String nome, String planeta, String Ovni) {
        super(nome, "Desconhecido", new Poder("Não especificado"));
        this.planetaOrigem = planeta;
        this.Ovni = Ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "Alien " + nome + " do planeta " + planetaOrigem + " avistado no OVNI: " + Ovni;
    }
}

class Registros {
    public String nomeEquipe;
    private HashMap<String, Entidades> _avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this._avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidades entidade, String nome) {
        if (!_avistamentos.containsKey(nome)) {
            _avistamentos.put(nome, entidade);
            System.out.println("Avistamento registrado: " + entidade.obterCoordenadas());
            return true;
        } else {
            System.out.println("Entidade " + nome + " já registrada!");
            return false;
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Registros registros = new Registros("Equipe");

        Poder poder1 = new Poder("Poder");
        Youkai y1 = new Youkai("Youkai", "Local 1", poder1);

        Alien a1 = new Alien("Alien", "Local 2", "Ovni");

        registros.registrarAvistamento(y1, y1.nome);
        registros.registrarAvistamento(a1, a1.nome);
        registros.registrarAvistamento(y1, y1.nome); 
    }
}