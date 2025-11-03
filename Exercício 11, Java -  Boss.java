import java.util.*;

class PadraoAtaque {
    public String nome;
    public int dano;

    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }
}

class Boss {
    public String nome;
    protected String idBoss;
    protected String PontoFraco;
    protected LinkedHashSet<PadraoAtaque> _moveset;

    public Boss(String nome, String id, String fracoContra) {
        this.nome = nome;
        this.idBoss = id;
        this.PontoFraco = fracoContra;
        this._moveset = new LinkedHashSet<>();
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        _moveset.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("Boss " + nome + " entrou na arena. Ponto fraco: " + PontoFraco);
        for (PadraoAtaque a : _moveset) {
            System.out.println("Ataque: " + a.nome + " | Dano: " + a.dano);
        }
    }
}

class BossMagico extends Boss {
    public BossMagico(String nome, String id, String fracoContra) {
        super(nome, id, fracoContra);
    }

    @Override
    public void iniciarFase() {
        System.out.println("Boss Mágico " + nome);
        for (PadraoAtaque a : _moveset) {
            System.out.println("Feitiço: " + a.nome + " | Dano mágico: " + a.dano);
        }
    }
}

class Batalha {
    private HashMap<String, Boss> _arena;

    public Batalha() {
        this._arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        _arena.put(boss.idBoss, boss);
    }

    public void iniciarBatalha(String idBoss) {
        Boss boss = _arena.get(idBoss);
        if (boss != null) {
            boss.iniciarFase();
        } else {
            System.out.println("Nenhum boss encontrado com ID: " + idBoss);
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Batalha batalha = new Batalha();

        BossMagico boss1 = new BossMagico("BossMagico", "B001", "Água");
        boss1.adicionarAtaque(new PadraoAtaque("Raio Arcano", 50));
        boss1.adicionarAtaque(new PadraoAtaque("Explosão de Fogo", 70));

        Boss boss2 = new Boss("Boss", "B002", "Luz");
        boss2.adicionarAtaque(new PadraoAtaque("Golpe Sombrio", 40));

        batalha.adicionarBoss(boss1);
        batalha.adicionarBoss(boss2);

        batalha.iniciarBatalha("B001");
        batalha.iniciarBatalha("B002");
    }
}