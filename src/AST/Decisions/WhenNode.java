package AST.Decisions;

import AST.ASTNode;

import java.util.ArrayList;

public class WhenNode implements ASTNode {
    ASTNode condition;
    ArrayList<ASTNode> statements;
    public WhenNode(ASTNode condition){
        this.condition = condition;
        statements = new ArrayList<>();
    }
    public void addStatement(ASTNode statement){
        statements.add(statement);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("When Statement:\n");
        sb.append(indent).append('\t').append("Condition:\n");
        sb.append(condition.prettyPrint(indent+"\t\t"));
        sb.append(indent).append('\t').append("Statements:\n");
        for (ASTNode statement : statements) {
            if(statement!=null){
                sb.append(statement.prettyPrint(indent+"\t\t")).append('\n');
            }
        }
        return sb.toString();
    }
}
