package AST.Form;

import AST.ASTNode;

import java.util.ArrayList;
import java.util.List;

public class BodyForms implements ASTNode {
    private final List<ASTNode> forms;

    public BodyForms() {
        this.forms = new ArrayList<>();
    }

    public void addForm(ASTNode form) {
        forms.add(form);
    }

    public List<ASTNode> getForms() {
        return forms;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("BodyForms:\n");
        for (ASTNode form : forms) {
            sb.append(form.prettyPrint(indent + "\t")).append("\n");
        }
        return sb.toString();
    }
}
