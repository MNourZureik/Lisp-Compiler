package AST.Loops;

import AST.ASTNode;

public class ReturnClause implements ASTNode {
    private final ASTNode returnValue; // The form after RETURN, can be null

    public ReturnClause(ASTNode returnValue) {
        this.returnValue = returnValue;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("ReturnClause:\n");
        if (returnValue != null) {
            sb.append(returnValue.prettyPrint(indent + "\t"));
        } else {
            sb.append(indent).append("\tNo return value");
        }
        return sb.toString();
    }
}
