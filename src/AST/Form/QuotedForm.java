package AST.Form;

import AST.ASTNode;

public class QuotedForm implements ASTNode {
    ASTNode form;
    public QuotedForm(ASTNode form) {
        this.form = form;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Quoted Form:\n" + form.prettyPrint(indent + "\t");
    }
}
