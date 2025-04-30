package AST.List;
import AST.ASTNode;

import java.util.List;

public class ListExprNode implements ASTNode {
    private final ASTNode firstForm; // First form
    private final List<ASTNode> otherForms; // Remaining forms

    public ListExprNode(ASTNode firstForm, List<ASTNode> otherForms) {
        this.firstForm = firstForm;
        this.otherForms = otherForms;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("ListExpression:\n");
        sb.append(indent).append("\tFirst Form:\n").append(firstForm.prettyPrint(indent + "\t\t")).append("\n");
        sb.append(indent).append("\tOther Forms:\n");
        for (ASTNode form : otherForms) {
            sb.append(form.prettyPrint(indent + "\t\t")).append("\n");
        }
        return sb.toString();
    }
}
