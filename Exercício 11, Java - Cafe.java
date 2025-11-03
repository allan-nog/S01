import java.util.ArrayList;

class Cafe {
    public String nome;
    public double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public double calcularPrecoFinal() {
        return precoBase;
    }
}

class CafeGourmet extends Cafe {
    public double bonusAroma;

    public CafeGourmet(String nome, double preco, double bonus) {
        super(nome, preco);
        this.bonusAroma = bonus;
    }

    @Override
    public double calcularPrecoFinal() {
        return precoBase + bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> itens;

    public Menu(ArrayList<Cafe> itens) {
        this.itens = itens;
    }

    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }
}

class CafeLeblanc {
    private Menu _menu;

    public CafeLeblanc(Menu menu) {
        this._menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        System.out.println("Pedido recebido: " + cafe.nome + " | Preço final: R$ " + cafe.calcularPrecoFinal());
    }
}

public class Main {
    public static void main(String[] args) {
        ArrayList<Cafe> lista = new ArrayList<>();

        Menu menu = new Menu(lista);
        CafeLeblanc leblanc = new CafeLeblanc(menu);

        Cafe cafeNormal = new Cafe("Cafe", 5.0);
        CafeGourmet cafeEspecial = new CafeGourmet("Cafe Gourmet", 7.0, 2.0);

        menu.adicionarItem(cafeNormal);
        menu.adicionarItem(cafeEspecial);

        leblanc.receberPedido(cafeNormal);
        leblanc.receberPedido(cafeEspecial);
    }
}