package AST.Loops;

import AST.ASTNode;

import java.util.List;

public class DoListNode implements ASTNode {
    private final String loopVariable;
    private final ASTNode iterable;
    private final List<ASTNode> body;

    public DoListNode(String loopVariable, ASTNode iterable, List<ASTNode> body) {
        this.loopVariable = loopVariable;
        this.iterable = iterable;
        this.body = body;
    }

    public String getLoopVariable() {
        return loopVariable;
    }

    public ASTNode getIterable() {
        return iterable;
    }

    public List<ASTNode> getBody() {
        return body;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("DolistExpression:\n");
        sb.append(indent).append("\tLoop Variable: ").append(loopVariable).append("\n");
        sb.append(indent).append("\tIterable:\n").append(iterable.prettyPrint(indent + "\t\t")).append("\n");
        sb.append(indent).append("\tBody:\n");
        for (ASTNode statement : body) {
            sb.append(statement.prettyPrint(indent + "\t\t")).append("\n");
        }
        return sb.toString();
    }
}
