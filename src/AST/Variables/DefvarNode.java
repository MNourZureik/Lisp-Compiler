package AST.Variables;

import AST.ASTNode;

public class DefvarNode implements ASTNode {
    String varName;
    String docString;
    ASTNode value;


    public DefvarNode(String varName, String docString, ASTNode value){
        this.varName = varName;
        this.docString = docString;
        this.value = value;
    }


    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("DEFVAR node:\n");
        sb.append(indent).append("\t").append("varName: ").append(this.varName).append("\n");
        sb.append(indent).append("\t").append("Documentation: ").append(this.docString).append("\n");
        if(this.value != null)
            sb.append(indent).append("\t").append("Value: \n").append(this.value.prettyPrint(indent + "\t\t"));
        return sb.toString();
    }


}
