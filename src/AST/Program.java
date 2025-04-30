package AST;

import java.util.ArrayList;

public class Program implements ASTNode {
    ArrayList<ASTNode> children;
    public Program() {
        children = new ArrayList<>();
    }
    public void addChild(ASTNode node) {
        children.add(node);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("Program:\n");
        for (ASTNode child : children) {
            if(child!=null){
                sb.append(child.prettyPrint(indent+"\t")).append("\n");
            }
        }
        return sb.toString();
    }
}
