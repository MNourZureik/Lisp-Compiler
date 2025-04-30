package AST.Macros;

import AST.ASTNode;
import AST.Functions.ParameterListNode;

import java.util.ArrayList;

public class DefmacroNode implements ASTNode {
    String macroName;
    String docString;
    ParameterListNode parameterList;
    ArrayList<ASTNode> forms;

    public DefmacroNode(String macroName, String docString, ParameterListNode parameterListNode){
        this.macroName = macroName;
        this.docString = docString;
        this.parameterList = parameterListNode;
        this.forms=  new ArrayList<>();
    }

    public void addChild(ASTNode form){
        this.forms.add(form);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("DEFMACRO node:\n");
        sb.append(indent).append("\t").append("MacroName: ").append(this.macroName).append("\n");
        sb.append(indent).append("\t").append("Documentation: ").append(docString).append("\n");
        sb.append(indent).append("\t").append(parameterList.prettyPrint(""));
        sb.append(indent).append("\t").append("BODY :\n");
        for (ASTNode form : this.forms) {
            sb.append(form.prettyPrint(indent + "\t\t"));
        }
        return sb.toString();
    }
}
