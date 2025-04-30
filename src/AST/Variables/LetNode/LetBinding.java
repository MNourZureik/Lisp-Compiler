package AST.Variables.LetNode;

import AST.ASTNode;

public class LetBinding implements ASTNode {
    private String identifier;
    private ASTNode form;

    public LetBinding(String identifier, ASTNode form) {
        this.identifier = identifier;
        this.form = form;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("LetBinding:\n");
        sb.append(indent).append("  Identifier: ").append(identifier).append("\n");
        if (form != null) {
            sb.append(indent).append("  Form:\n").append(form.prettyPrint(indent + "    "));
        }
        return sb.toString();
    }
}
