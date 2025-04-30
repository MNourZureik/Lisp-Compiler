package AST.Terminal;

import AST.ASTNode;

public class StringNode implements ASTNode {
    String value;

    public StringNode(String value) {
        this.value = value;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "String: " + value;
    }
}
