package AST.Functions;

import AST.ASTNode;

import java.util.ArrayList;

public class ParameterListNode implements ASTNode {
    ArrayList<String> parameters;

    public ParameterListNode(){
        parameters = new ArrayList<>();
    }

    public void addChild(String paramter){
        this.parameters.add(paramter);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("ParameterList node:\n");
        //sb.append(indent + "\t\t\t\t\t").append("Parameters:\n");
        for (String parameter : parameters) {
            if(parameter!=null){
                sb.append(indent).append("\t\t\t\t\t").append("parameter: ").append(parameter).append("\n");
            }
        }
        return sb.toString();
    }
}
