package AST.Variables;

import AST.ASTNode;

import java.util.ArrayList;
import java.util.List;

public class SetfNode implements ASTNode {
    private final List<Pair<ASTNode, ASTNode>> assignments;

    public SetfNode() {
        this.assignments = new ArrayList<>();
    }

    public void addAssignment(ASTNode target, ASTNode value) {
        assignments.add(new Pair<>(target, value));
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("SetfExpression:\n");
        for (Pair<ASTNode, ASTNode> assignment : assignments) {
            sb.append(indent).append("  Target:\n");
            sb.append(assignment.getKey().prettyPrint(indent + "    ")).append("\n");
            sb.append(indent).append("  Value:\n");
            sb.append(assignment.getValue().prettyPrint(indent + "    ")).append("\n");
        }
        return sb.toString();
    }

    // Helper class for storing target-value pairs
    private static class Pair<K, V> {
        private final K key;
        private final V value;

        public Pair(K key, V value) {
            this.key = key;
            this.value = value;
        }

        public K getKey() {
            return key;
        }

        public V getValue() {
            return value;
        }
    }
}
