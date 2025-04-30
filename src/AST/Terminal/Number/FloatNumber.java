package AST.Terminal.Number;

import AST.ASTNode;

public class FloatNumber implements ASTNode {
    float value;

    public FloatNumber(float value) {
        this.value = value;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Float Number: "+value;
    }
}
