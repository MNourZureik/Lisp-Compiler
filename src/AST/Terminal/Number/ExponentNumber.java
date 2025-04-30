package AST.Terminal.Number;

import AST.ASTNode;

public class ExponentNumber implements ASTNode {
    String value;

    public ExponentNumber(String value) {
        this.value = value;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Exponent Number: "+value;
    }
}
