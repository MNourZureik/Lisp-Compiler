package AST.Variables.LetNode;

import AST.ASTNode;

import java.util.List;

public class LetNode implements ASTNode {
    private final boolean isLetStar; // true if LET_STAR, false if LET
    private final List<LetBinding> bindings;
    private final ASTNode body;

    public LetNode(boolean isLetStar, List<LetBinding> bindings, ASTNode body) {
        this.isLetStar = isLetStar;
        this.bindings = bindings;
        this.body = body;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append(isLetStar ? "Let*" : "Let").append(" Expression:\n");
        sb.append(indent).append("Bindings:\n");
        for (LetBinding binding : bindings) {
            sb.append(binding.prettyPrint(indent + "\t")).append("\n");
        }
        sb.append(indent).append("Body:\n");
        sb.append(body.prettyPrint(indent + "\t"));
        return sb.toString();
    }
}
