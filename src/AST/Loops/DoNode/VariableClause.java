package AST.Loops.DoNode;

import AST.ASTNode;

public class VariableClause implements ASTNode {
    private final String variable;
    private final ASTNode initialValue;
    private final ASTNode updateValue;

    public VariableClause(String variable, ASTNode initialValue, ASTNode updateValue) {
        this.variable = variable;
        this.initialValue = initialValue;
        this.updateValue = updateValue;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Variable: " + variable +
                "\n" + initialValue.prettyPrint(indent + "  ") +
                "\n" + updateValue.prettyPrint(indent + "  ");
    }
}
