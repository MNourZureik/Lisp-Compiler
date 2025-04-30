package AST.Variables;

import AST.ASTNode;

import java.util.Map;

public class SetqNode implements ASTNode {
    Map<String, ASTNode> variables;

    public void addChild(String name, ASTNode value) {
        variables.put(name, value);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("SETQ Node:\n");
        for (Map.Entry<String, ASTNode> variable : variables.entrySet()) {
            sb.append(indent).append('\t').append("Name: ").append(variable.getKey()).append('\n');
            sb.append(indent).append('\t').append("Value: ").append('\n');
            sb.append(variable.getValue().prettyPrint(indent + "\t\t")).append('\n');
        }
        return sb.toString();
    }
}
