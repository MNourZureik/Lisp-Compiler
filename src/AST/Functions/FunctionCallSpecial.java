package AST.Functions;

import AST.ASTNode;

import java.util.ArrayList;
import java.util.List;

public class FunctionCallSpecial implements ASTNode {
    private final String functionName; // The name of the function (IDENTIFIER)
    private final List<ASTNode> arguments; // The arguments (forms)

    public FunctionCallSpecial(String functionName, List<ASTNode> arguments) {
        this.functionName = functionName;
        this.arguments = arguments != null ? arguments : new ArrayList<>();
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("FunctionCallSpecial: ").append(functionName).append("\n");
        for (ASTNode arg : arguments) {
            sb.append(arg.prettyPrint(indent + "\t")).append("\n");
        }
        return sb.toString().trim();
    }
}
