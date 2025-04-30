package AST.Macros;

import AST.ASTNode;
import AST.Functions.ParameterListNode;

import java.util.ArrayList;

public class MacroLetDefNode implements ASTNode {
    ArrayList<ASTNode> body;
    ParameterListNode parameterList;

    public MacroLetDefNode(ParameterListNode parameterListNode){
        this.parameterList = new ParameterListNode();
        this.body = new ArrayList<>();
    }

    public void addChild(ASTNode child){
        this.body.add(child);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("MACROLETDEF node:\n");
        sb.append(indent).append("\t").append(parameterList.prettyPrint(""));
        sb.append(indent).append("\t").append("BODY :\n");
        for (ASTNode astNode : this.body) {
            sb.append(astNode.prettyPrint(indent + "\t\t"));
        }
        return sb.toString();
    }
}
