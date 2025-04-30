package AST.Functions;

import AST.ASTNode;

public class ReturnFromNode implements ASTNode {
    private final String identifier;
    private final ASTNode form;

    public ReturnFromNode(String identifier, ASTNode form) {
        this.identifier = identifier;
        this.form = form;
    }

    public String getIdentifier() {
        return identifier;
    }

    public ASTNode getForm() {
        return form;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("ReturnFromNode:\n");
        sb.append(indent).append("\tIdentifier: ").append(identifier).append("\n");
        if (form != null) {
            sb.append(form.prettyPrint(indent + "\t"));
        }
        return sb.toString();
    }
}
