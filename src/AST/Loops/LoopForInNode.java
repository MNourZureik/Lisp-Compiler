package AST.Loops;

import AST.ASTNode;

import java.util.ArrayList;

public class LoopForInNode implements ASTNode {
    String variable;
    ASTNode list;
    ArrayList<ASTNode> statements;
    public LoopForInNode(String variable, ASTNode list) {
        this.variable = variable;
        this.list = list;
        statements = new ArrayList<>();
    }

    public void addStatement(ASTNode statement) {
        statements.add(statement);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("Loop For:\n");
        sb.append(indent).append('\t').append("Loop Variable: ").append(variable).append("\n");
        sb.append(indent).append('\t').append("In List:\n");
        sb.append(list.prettyPrint(indent + "\t\t")).append('\n');
        sb.append(indent).append('\t').append("Statements:\n");
        for (ASTNode statement : statements) {
            sb.append(statement.prettyPrint(indent+"\t\t")).append("\n");
        }
        return sb.toString();
    }
}
