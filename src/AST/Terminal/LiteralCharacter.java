package AST.Terminal;

import AST.ASTNode;

public class LiteralCharacter implements ASTNode {
    String value;

    public LiteralCharacter(String value) {
        this.value = value;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Literal Character: " + value;
    }
}
