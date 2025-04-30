package AST.Loops.DoNode;

import AST.ASTNode;

import java.util.ArrayList;
import java.util.List;

public class DoNode implements ASTNode {
    private final List<VariableClause> variables = new ArrayList<>();
    private TestClause testClause;
    private final List<ASTNode> bodyForms = new ArrayList<>();

    public void addVariable(VariableClause variable) {
        variables.add(variable);
    }

    public void setTestClause(TestClause testClause) {
        this.testClause = testClause;
    }

    public void addBodyForm(ASTNode bodyForm) {
        bodyForms.add(bodyForm);
    }

    @Override
    public String prettyPrint(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("DoExpression:\n");
        sb.append(indent).append("  Variables:\n");
        for (VariableClause variable : variables) {
            sb.append(variable.prettyPrint(indent + "    ")).append("\n");
        }
        sb.append(indent).append("  Test Clause:\n");
        if (testClause != null) {
            sb.append(testClause.prettyPrint(indent + "    ")).append("\n");
        }
        sb.append(indent).append("  Body Forms:\n");
        for (ASTNode bodyForm : bodyForms) {
            sb.append(bodyForm.prettyPrint(indent + "    ")).append("\n");
        }
        return sb.toString();
    }
}
