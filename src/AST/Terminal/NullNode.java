package AST.Terminal;

import AST.ASTNode;

public class NullNode implements ASTNode {
    @Override
    public String prettyPrint(String indent) {
        return indent + "NULL";
    }
}
