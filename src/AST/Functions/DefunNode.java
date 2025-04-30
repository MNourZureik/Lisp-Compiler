package AST.Functions;

import AST.ASTNode;

import java.util.ArrayList;

public class DefunNode implements ASTNode {
    String functionName;
    String docString;
    ParameterListNode parameterList;
    ArrayList<ASTNode> body;

    public DefunNode(String functionName, String docString, ParameterListNode parameterList){
        this.functionName = functionName;
        this.docString = docString;
        this.parameterList = parameterList;
        body = new ArrayList<>();
    }

    public void addChild(ASTNode statement){
        body.add(statement);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("DEFUN node:\n");
        sb.append(indent).append("\t").append("FunctionName: ").append(functionName).append("\n");
        sb.append(indent).append("\t").append("Documentation: ").append(docString).append("\n");
        sb.append(indent).append("\t").append(parameterList.prettyPrint(""));
        sb.append(indent).append("\t").append("BODY :\n");
        for (ASTNode astNode : this.body) {
            sb.append(astNode.prettyPrint(indent + "\t\t"));
        }
        return sb.toString();
    }
}
