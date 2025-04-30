package AST.Terminal;

import AST.ASTNode;

public class Identifier implements ASTNode {
    String name;

    public Identifier(String name) {
        this.name = name;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Identifier: " + name;
    }
}
