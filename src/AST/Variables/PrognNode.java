package AST.Variables;

import AST.ASTNode;

import java.util.List;

public class PrognNode implements ASTNode {
    private final List<ASTNode> bodyForms;

    public PrognNode(List<ASTNode> bodyForms) {
        this.bodyForms = bodyForms;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("Progn Expression:\n");
        for (ASTNode form : bodyForms) {
            sb.append(form.prettyPrint(indent + "\t")).append("\n");
        }
        return sb.toString();
    }
}
