import AST.ASTBuilderVisitor;
import AST.ASTNode;
import antlr.LispLexer;
import antlr.LispParser;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Objects;

public class Main {
    public static void main(String[] args) throws Exception {
        FileReader fileReader = new FileReader("src/Test/t.lisp");
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        StringBuilder fileInput = new StringBuilder();
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            fileInput.append(line).append("\n");
        }
        bufferedReader.close();
        ANTLRInputStream input = new ANTLRInputStream(fileInput.toString());
        LispLexer lexer = new LispLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        tokens.fill();
        printTokens(tokens);
        LispParser parser = new LispParser(tokens);
        ParseTree progContext = parser.program();
        System.out.println(progContext.toStringTree(parser)); // Print the parse tree in string format
        ASTBuilderVisitor visitor = new ASTBuilderVisitor();
        ASTNode ast = visitor.visit(progContext);
        System.out.println(ast.prettyPrint(""));
//        for (String semanticError : visitor.semanticErrors) {
//            System.out.println(semanticError);
//        }
    }

    private static void printTokens(CommonTokenStream tokens) {
        System.out.printf("%-15s %-20s %-15s %-20s %-20s%n", "Type", "Token Name", "Line", "Position", "Token Text");
        // Iterate through the tokens and print details for each token
        System.out.println("-".repeat(100));
        for (Token token : tokens.getTokens()) {
            int tokenType = token.getType(); // Get the token type as an integer
            String tokenName = LispLexer.VOCABULARY.getSymbolicName(tokenType); // Get the symbolic name of the token type
            int tokenLine = token.getLine(); // Get the line number where the token appears
            int charPosition = token.getCharPositionInLine(); // Get the character position in the line
            String tokenText = token.getText(); // Get the actual text of the token

            if (Objects.equals(tokenName, "EOF")) {
                System.out.println("/".repeat(100));
            }
            System.out.printf("%-15d %-20s %-15d %-20d %-20s%n", tokenType, tokenName, tokenLine, charPosition, tokenText);
        }
    }
}
