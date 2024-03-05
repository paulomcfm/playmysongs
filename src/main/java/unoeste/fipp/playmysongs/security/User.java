package unoeste.fipp.playmysongs.security;

public class User {
    private String nome;
    private boolean autenticado;
    public User(String nome){
        this.nome = nome;
        autenticado = true;
    }

    public String getNome() {
        return nome;
    }

    public boolean isAutenticado() {
        return autenticado;
    }

}