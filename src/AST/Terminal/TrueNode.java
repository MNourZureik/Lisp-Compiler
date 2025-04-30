package AST.Terminal;

import AST.ASTNode;

public class TrueNode implements ASTNode {
    @Override
    public String prettyPrint(String indent) {
        return indent + "True";
    }
}
