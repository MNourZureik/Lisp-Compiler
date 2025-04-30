package AST.Functions;

import AST.ASTNode;
import java.util.List;

public class LambdaNode implements ASTNode {
    private final String lambdaKeyword; // Represents the "LAMBDA" keyword
    private final List<ASTNode> parameters; // Represents the parameter list
    private final ASTNode body; // Represents the body of the lambda expression

    public LambdaNode(String lambdaKeyword, List<ASTNode> parameters, ASTNode body) {
        this.lambdaKeyword = lambdaKeyword;
        this.parameters = parameters;
        this.body = body;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("Lambda Expression:\n");
        sb.append(indent).append("  Lambda Keyword: ").append(lambdaKeyword).append("\n");
        sb.append(indent).append("  Parameters:\n");
        for (ASTNode param : parameters) {
            if (param!=null){
                sb.append(param.prettyPrint(indent + "    ")).append("\n");
            }
        }
        sb.append(indent).append("  Body:\n");
        sb.append(body.prettyPrint(indent + "    "));
        return sb.toString();
    }
}
