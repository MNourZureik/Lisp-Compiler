package AST.Loops;

import AST.ASTNode;

import java.util.ArrayList;

public class LoopForFromToNode implements ASTNode {
    String variable;
    ASTNode startValue;
    ASTNode endValue;
    ASTNode changeValue;
    ArrayList<ASTNode> statements;
    public LoopForFromToNode(String variable, ASTNode startValue, ASTNode endValue) {
        this.variable = variable;
        this.startValue = startValue;
        this.endValue = endValue;
        statements = new ArrayList<>();
    }
    public void addChangeValue(ASTNode changeValue) {
        this.changeValue = changeValue;
    }
    public void addStatement(ASTNode statement) {
        statements.add(statement);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("Loop For:\n");
        sb.append(indent).append('\t').append("Loop Variable: ").append(variable).append("\n");
        sb.append(indent).append('\t').append("StartValue:\n");
        sb.append(startValue.prettyPrint(indent + "\t\t")).append('\n');
        sb.append(indent).append('\t').append("EndValue:\n");
        sb.append(endValue.prettyPrint(indent + "\t\t")).append('\n');
        if (changeValue != null) {
            sb.append(indent).append('\t').append("ChangeValue:\n");
            sb.append(changeValue.prettyPrint(indent + "\t\t")).append('\n');
        }
        sb.append(indent).append('\t').append("Statements:\n");
        for (ASTNode statement : statements) {
            sb.append(statement.prettyPrint(indent+"\t\t")).append("\n");
        }
        return sb.toString();
    }
}
