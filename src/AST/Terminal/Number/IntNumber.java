package AST.Terminal.Number;

import AST.ASTNode;

public class IntNumber implements ASTNode {
    int value;

    public IntNumber(int value) {
        this.value = value;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Integer Number: " + value;
    }
}
