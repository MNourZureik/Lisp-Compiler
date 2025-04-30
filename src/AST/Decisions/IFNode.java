package AST.Decisions;

import AST.ASTNode;

public class IFNode implements ASTNode {
    ASTNode condition;
    ASTNode trueBranch;
    ASTNode falseBranch;
    public IFNode(ASTNode condition) {
        this.condition = condition;
    }
    public void addTrueBranch(ASTNode trueBranch) {
        this.trueBranch = trueBranch;
    }
    public void addFalseBranch(ASTNode falseBranch) {
        this.falseBranch = falseBranch;
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb= new StringBuilder();
        sb.append(indent).append("IF Statement:\n");
        sb.append(indent).append('\t').append("Condition:\n").append(condition.prettyPrint(indent+"\t\t"));
        if(trueBranch!=null){
            sb.append(indent).append('\t').append("True Branch:\n").append(trueBranch.prettyPrint(indent+"\t\t"));
        }
        if(falseBranch != null)
        {
            sb.append(indent).append('\t').append("False Branch:\n").append(falseBranch.prettyPrint(indent+"\t\t"));
        }
        return sb.toString();
    }
}
