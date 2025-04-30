package AST.Loops;

import AST.ASTNode;

import java.util.ArrayList;

public class LoopNode implements ASTNode {
    ArrayList<ASTNode> statements;
    public LoopNode() {
        statements = new ArrayList<>();
    }
    public void addStatement(ASTNode statement) {
        statements.add(statement);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("Loop:\n");
        sb.append(indent).append('\t').append("Statements:\n");
        for (ASTNode statement : statements) {
           sb.append(statement.prettyPrint(indent+"\t\t")).append("\n");
        }
        return sb.toString();
    }
}
