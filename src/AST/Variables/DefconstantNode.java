package AST.Variables;

import AST.ASTNode;

public class DefconstantNode implements ASTNode {
    String constantName;
    String docString;
    ASTNode value;


    public DefconstantNode(String constantName, String docString, ASTNode value){
        this.constantName = constantName;
        this.docString = docString;
        this.value = value;
    }


    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("DEFCONSTANT node:\n");
        sb.append(indent).append("\t").append("constantName: ").append(this.constantName).append("\n");
        sb.append(indent).append("\t").append("Documentation: ").append(this.docString).append("\n");
        sb.append(indent).append("\t").append("Value: \n").append(this.value.prettyPrint(indent + "\t\t"));
        return sb.toString();
    }
}
