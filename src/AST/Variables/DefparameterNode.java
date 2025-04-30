package AST.Variables;

import AST.ASTNode;

public class DefparameterNode implements ASTNode {
    String paramterName;
    String docString;
    ASTNode value;


    public DefparameterNode(String paramterName, String docString, ASTNode value){
        this.paramterName = paramterName;
        this.docString = docString;
        this.value = value;
    }


    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("DEFPARAMETER node:\n");
        sb.append(indent).append("\t").append("paramterName: ").append(this.paramterName).append("\n");
        sb.append(indent).append("\t").append("Documentation: ").append(this.docString).append("\n");
        sb.append(indent).append("\t").append("Value: \n").append(this.value.prettyPrint(indent + "\t\t"));
        return sb.toString();
    }
}
