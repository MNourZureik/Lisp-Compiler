package AST.Functions;

import AST.ASTNode;

public class BlockNode implements ASTNode {
    private final String blockName;
    private final ASTNode body;

    public BlockNode(String blockName, ASTNode body) {
        this.blockName = blockName;
        this.body = body;
    }

    public String getBlockName() {
        return blockName;
    }

    public ASTNode getBody() {
        return body;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("BlockNode: ").append(blockName).append("\n");
        sb.append(body.prettyPrint(indent + "\t"));
        return sb.toString();
    }
}
