package AST.Decisions;

import AST.ASTNode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CaseNode implements ASTNode {
    ASTNode keyValue;
    Map<ASTNode, ArrayList<ASTNode>> conditions;
    public CaseNode(ASTNode keyValue){
        this.keyValue = keyValue;
        conditions = new HashMap<>();
    }
    public void addCondition(ASTNode key, ArrayList<ASTNode> statements){
        conditions.put(key, statements);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("Case Statement:\n");
        sb.append(indent).append('\t').append("Key Value:\n");
        sb.append(keyValue.prettyPrint(indent+"\t\t")).append('\n');
        for (Map.Entry<ASTNode, ArrayList<ASTNode>> entry : conditions.entrySet()) {
            sb.append(indent).append('\t').append("Key:\n");
            sb.append(entry.getKey().prettyPrint(indent + "\t\t")).append('\n');
            sb.append(indent).append('\t').append("Statements:\n");
            for (ASTNode statement : entry.getValue()) {
                sb.append(statement.prettyPrint(indent + "\t\t")).append('\n');
            }
        }
        return sb.toString();
    }
}
