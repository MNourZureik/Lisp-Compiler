package AST.Form;

import AST.ASTNode;

public class SharpQuotedForm implements ASTNode {
    ASTNode form;
    public SharpQuotedForm(ASTNode form) {
        this.form = form;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Sharp Quoted Form:\n" + form.prettyPrint(indent + "\t");
    }
}
