package AST.Loops;

import AST.ASTNode;

import java.util.ArrayList;
import java.util.List;

public class DoTimesNode implements ASTNode {
    private final String variableName;
    private final ASTNode range;
    private final List<ASTNode> statements;

    public DoTimesNode(String variableName, ASTNode range) {
        this.variableName = variableName;
        this.range = range;
        this.statements = new ArrayList<>();
    }

    public void addStatement(ASTNode statement) {
        statements.add(statement);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("DotimesExpression:\n");
        sb.append(indent).append("\tVariable: ").append(variableName).append("\n");
        sb.append(indent).append("\tRange:\n").append(range.prettyPrint(indent + "\t\t")).append("\n");
        sb.append(indent).append("\tStatements:\n");
        for (ASTNode statement : statements) {
            sb.append(statement.prettyPrint(indent + "\t\t")).append("\n");
        }
        return sb.toString();
    }
}
