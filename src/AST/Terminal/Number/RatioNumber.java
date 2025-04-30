package AST.Terminal.Number;

import AST.ASTNode;

public class RatioNumber implements ASTNode {
    int numerator;
    int denominator;

    public RatioNumber(int numerator, int denominator) {
        this.numerator = numerator;
        this.denominator = denominator;
    }

    @Override
    public String prettyPrint(String indent) {
        return indent + "Ratio Number: "+numerator+"/"+denominator;
    }
}
