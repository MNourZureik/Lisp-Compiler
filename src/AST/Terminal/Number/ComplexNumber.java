package AST.Terminal.Number;

import AST.ASTNode;

public class ComplexNumber implements ASTNode {
    ASTNode real;
    ASTNode imaginary;

    public ComplexNumber(ASTNode real, ASTNode imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    @Override
    public String prettyPrint(String indent) {
        String sb = indent + "Complex Number:\n" +
                indent + "\t" + "Real = " + real.prettyPrint(" ") + "\n" +
                indent + "\t" + "Imaginary = " + imaginary.prettyPrint(" ");
        return sb;
    }

}
