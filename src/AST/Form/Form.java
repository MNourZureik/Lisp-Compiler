package AST.Form;

import AST.ASTNode;

public class Form implements ASTNode {
    ASTNode form;
    public Form(ASTNode form) {
        this.form = form;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Form:\n" + form.prettyPrint(indent + "\t");
    }
}
