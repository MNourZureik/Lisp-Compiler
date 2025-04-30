package AST.Functions;

import AST.ASTNode;

import java.util.ArrayList;

public class FunctionNode implements ASTNode {
    ASTNode name;
    ArrayList<ASTNode> parameters;


    public FunctionNode(ASTNode name) {
        this.name = name;
        this.parameters = new ArrayList<>();
    }

    public void addChild(ASTNode parameter){
        parameters.add(parameter);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("Function:\n");
        sb.append(name.prettyPrint(indent+'\t')).append("\n");
        sb.append(indent).append("\t").append("Parameters:\n");
        for (ASTNode child : parameters) {
            if(child!=null){
                sb.append(child.prettyPrint(indent+"\t\t")).append("\n");
            }
        }
        return sb.toString();
    }
}
