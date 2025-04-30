package AST.Macros;

import AST.ASTNode;

import java.util.ArrayList;

public class MacroLetNode implements ASTNode {
    ArrayList<ASTNode> macroLetDef;
    ArrayList<ASTNode> body;

    public MacroLetNode(){
        this.macroLetDef = new ArrayList<>();
        this.body = new ArrayList<>();
    }

    public void addBody(ASTNode form){
        body.add(form);
    }

    public void addMacroLetDef(ASTNode macroLetDef){
        this.macroLetDef.add(macroLetDef);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("MACROLET node:\n");
        for (ASTNode astNode : this.macroLetDef) {
            sb.append(astNode.prettyPrint(indent + "\t\t"));
        }
        for (ASTNode astNode : this.body) {
            sb.append(astNode.prettyPrint(indent + "\t\t"));
        }
        return sb.toString();
    }
}
