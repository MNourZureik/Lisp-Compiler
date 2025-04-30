package AST.Loops.DoNode;

import AST.ASTNode;

public class TestClause implements ASTNode {
    private final ASTNode test;
    private final ASTNode returnValue;

    public TestClause(ASTNode test, ASTNode returnValue) {
        this.test = test;
        this.returnValue = returnValue;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Test: \n" + test.prettyPrint(indent + "  ") +
                (returnValue != null ? "\nReturn: " + returnValue.prettyPrint(indent + "  ") : "");
    }
}
