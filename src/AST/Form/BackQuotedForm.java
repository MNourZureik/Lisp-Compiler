package AST.Form;

import AST.ASTNode;

public class BackQuotedForm implements ASTNode {
    ASTNode form;
    public BackQuotedForm(ASTNode form) {
        this.form = form;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Back Quoted Form:\n" + form.prettyPrint(indent + "\t");
    }
}
