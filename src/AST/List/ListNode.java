package AST.List;

import AST.ASTNode;

import java.util.ArrayList;

public class ListNode implements ASTNode {
    ArrayList<ASTNode> children;

    public ListNode() {
        children = new ArrayList<>();
    }
    public void addChild(ASTNode child) {
        children.add(child);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("List:\n");
        for (ASTNode child : children) {
            if(child!=null){
                sb.append(child.prettyPrint(indent+"\t")).append("\n");
            }
        }
        return sb.toString();
    }
}
