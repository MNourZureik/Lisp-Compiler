package AST.Decisions;

import AST.ASTNode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CondNode implements ASTNode {
    Map<ASTNode, ArrayList<ASTNode>> conditions;

    public CondNode() {
        conditions = new HashMap<>();
    }

    public void addCondition(ASTNode condition, ArrayList<ASTNode> statements) {
        conditions.put(condition, statements);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("Cond Statement:\n");
        for (Map.Entry<ASTNode, ArrayList<ASTNode>> entry : conditions.entrySet()) {
            sb.append(indent).append('\t').append("Condition:\n");
            sb.append(entry.getKey().prettyPrint(indent + "\t\t")).append('\n');
            sb.append(indent).append('\t').append("Statements:\n");
            for (ASTNode statement : entry.getValue()) {
                sb.append(statement.prettyPrint(indent + "\t\t")).append('\n');
            }
        }
        return sb.toString();
    }
}
