package AST.Terminal;

import AST.ASTNode;

public class FunctionName implements ASTNode {
    public String name;

    public FunctionName(String name) {
        this.name = name;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Function Name : " + name;
    }
}
