package AST;

public class Atom implements ASTNode{
    ASTNode atom;
    public Atom(ASTNode atom) {
        this.atom = atom;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent+ "Atom:\n" +atom.prettyPrint(indent + "\t");
    }
}
