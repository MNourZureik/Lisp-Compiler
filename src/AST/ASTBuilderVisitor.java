package AST;

import AST.Decisions.CaseNode;
import AST.Decisions.CondNode;
import AST.Decisions.IFNode;
import AST.Decisions.WhenNode;
import AST.Form.*;
import AST.Loops.DoNode.DoNode;
import AST.Loops.DoNode.TestClause;
import AST.Loops.DoNode.VariableClause;
import AST.Functions.*;
import AST.List.ListExprNode;
import AST.List.ListNode;
import AST.Macros.MacroLetDefNode;
import AST.Macros.MacroLetNode;
import AST.Variables.LetNode.LetBinding;
import AST.Variables.LetNode.LetNode;
import AST.Loops.*;
import AST.Macros.DefmacroNode;
import AST.Terminal.*;
import AST.Terminal.Number.*;
import AST.Variables.*;
import antlr.*;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class ASTBuilderVisitor extends LispParserBaseVisitor<ASTNode> {
    private final HashSet<String> variables;
    public ArrayList<String> semanticErrors;

    public ASTBuilderVisitor(){
        variables = new HashSet<>();
        semanticErrors = new ArrayList<>();
    }

    @Override
    public ASTNode visitAtom(LispParser.AtomContext ctx) {
        ASTNode atom = visit(ctx.getChild(0));
        return new Atom(atom);
    }

    @Override
    public ASTNode visitTrue(LispParser.TrueContext ctx) {
        return new TrueNode();
    }

    @Override
    public ASTNode visitNull(LispParser.NullContext ctx) {
        return new NullNode();
    }

    @Override
    public ASTNode visitForm(LispParser.FormContext ctx) {
        return new Form(visit(ctx.getChild(0)));
    }

    @Override
    public ASTNode visitProgram(LispParser.ProgramContext ctx) {
       Program program = new Program();
       for(int i=0;i<ctx.getChildCount();i++){
           if(i!=ctx.getChildCount()-1){
               program.addChild(visit(ctx.getChild(i)));
           }
       }
       return program;
    }

    @Override
    public ASTNode visitExponent(LispParser.ExponentContext ctx) {
        return new ExponentNumber(ctx.EXPONENT().getText());
    }

    @Override
    public ASTNode visitInt(LispParser.IntContext ctx) {
        int value = Integer.parseInt(ctx.INT().getText());
        return new IntNumber(value);
    }

    @Override
    public ASTNode visitComplexNumber(LispParser.ComplexNumberContext ctx) {
        ASTNode real = visit(ctx.getChild(2));
        ASTNode imaginary = visit(ctx.getChild(3));
        return new ComplexNumber(real, imaginary);
    }

    @Override
    public ASTNode visitRatio(LispParser.RatioContext ctx) {
        int numerator = Integer.parseInt(ctx.RATIO().getText().split("/")[0]);
        int denominator = Integer.parseInt(ctx.RATIO().getText().split("/")[1]);
        return new RatioNumber(numerator, denominator);
    }

    @Override
    public ASTNode visitIdentifier(LispParser.IdentifierContext ctx) {
        String name = ctx.IDENTIFIER().getText();
        if(!variables.contains(name)){
            semanticErrors.add("Variable "+name+" is not defined");
        }
        return new Identifier(name);
    }

    @Override
    public ASTNode visitLiteralCharacter(LispParser.LiteralCharacterContext ctx) {
        return new LiteralCharacter(ctx.LITERAL_CHARACTER().getText());
    }

    @Override
    public ASTNode visitString(LispParser.StringContext ctx) {
        return new StringNode(ctx.STRING().getText());
    }

    @Override
    public ASTNode visitFloatNumber(LispParser.FloatNumberContext ctx) {
        float value = Float.parseFloat(ctx.FLOAT_NUM().getText());
        return new FloatNumber(value);
    }

    @Override
    public ASTNode visitWhenExpr(LispParser.WhenExprContext ctx) {
        ASTNode condition = visit(ctx.form());
        WhenNode whenNode = new WhenNode(condition);
        for (int i=0;i<ctx.bodyForms().form().size();i++){
            ASTNode statement = visit(ctx.bodyForms().form().get(i));
            whenNode.addStatement(statement);
        }
        return whenNode;
    }

    @Override
    public ASTNode visitFunctionNode(LispParser.FunctionNodeContext ctx) {
        ASTNode functionName = null;
        if (ctx.functionName()!=null){
            functionName = visit(ctx.functionName());
        }else if(ctx.lambdaExpr()!=null){
            functionName =  visit(ctx.lambdaExpr());
        }
        FunctionNode node = new FunctionNode(functionName);
        for (int i =0; i < ctx.form().size(); i++){
            ASTNode parameter = visit(ctx.form(i));
            node.addChild(parameter);
        }
        return node;
    }

    @Override
    public ASTNode visitFunctionName(LispParser.FunctionNameContext ctx) {
        String tokenName;

        Token token = ctx.getStart();
        int tokenType = token.getType();

        tokenName = LispLexer.VOCABULARY.getSymbolicName(tokenType);

        if(tokenName.equals("IDENTIFIER")){
            String name = ctx.getChild(0).getText();
            if(!variables.contains(name)){
                semanticErrors.add("Function "+name+" is not defined");
            }
            tokenName=ctx.getChild(0).getText();
        }

        return new FunctionName(tokenName);
    }

    @Override
    public ASTNode visitQuotedForm(LispParser.QuotedFormContext ctx) {
        return new QuotedForm(visit(ctx.getChild(1)));
    }

    @Override
    public ASTNode visitBackQuotedForm(LispParser.BackQuotedFormContext ctx) {
        return new BackQuotedForm(visit(ctx.getChild(1)));
    }

    @Override
    public ASTNode visitSharpQuotedForm(LispParser.SharpQuotedFormContext ctx) {
        return new SharpQuotedForm(visit(ctx.getChild(1)));
    }

    @Override
    public ASTNode visitIfExpr(LispParser.IfExprContext ctx) {
        IFNode ifNode;
        ASTNode condition = visit(ctx.getChild(1));
        ifNode = new IFNode(condition);
        ASTNode trueBranch;

        if(ctx.getChild(2) instanceof TerminalNode){
            int tokenType = ((TerminalNode) ctx.getChild(2)).getSymbol().getType();
            if(tokenType == LispLexer.DO || tokenType==LispLexer.THEN){
                if(ctx.getChild(3)!=null){
                    trueBranch = visit(ctx.getChild(3));
                    ifNode.addTrueBranch(trueBranch);
                }

            }
        }else{
            trueBranch = visit(ctx.getChild(2));
            ifNode.addTrueBranch(trueBranch);
            if(ctx.getChildCount()==4){
                ASTNode falseBranch = visit(ctx.getChild(3));
                ifNode.addFalseBranch(falseBranch);
            }
        }
        return ifNode;
    }

    @Override
    public ASTNode visitCondExpr(LispParser.CondExprContext ctx) {
        CondNode condNode= new CondNode();
        for (int i=0;i<ctx.condClause().size();i++){
            ASTNode condition = visit(ctx.condClause(i).form());
            ArrayList<ASTNode> statements = new ArrayList<>();
            for (int j=0;j<ctx.condClause(i).bodyForms().form().size();j++){
                ASTNode statement = visit(ctx.condClause(i).bodyForms().form().get(j));
                statements.add(statement);
            }
            condNode.addCondition(condition, statements);
        }
        return condNode;
    }

    @Override
    public ASTNode visitCaseExpr(LispParser.CaseExprContext ctx) {
        ASTNode keyValue = visit(ctx.form());
        CaseNode caseNode = new CaseNode(keyValue);
        for (int i=0;i<ctx.caseClause().size();i++){
            ASTNode condition = visit(ctx.caseClause(i).getChild(1));
            ArrayList<ASTNode> statements = new ArrayList<>();
            for (int j=0;j<ctx.caseClause(i).bodyForms().form().size();j++){
                ASTNode statement = visit(ctx.caseClause(i).bodyForms().form().get(j));
                statements.add(statement);
            }
            caseNode.addCondition(condition, statements);
        }
        return caseNode;
    }

    @Override
    public ASTNode visitLoopExpr(LispParser.LoopExprContext ctx) {
        LoopNode loopNode = new LoopNode();
        for (int i=0;i<ctx.list().size();i++){
            ASTNode statement = visit(ctx.list(i));
            loopNode.addStatement(statement);
        }
        return loopNode;
    }

    @Override
    public ASTNode visitLoopForFromToExpr(LispParser.LoopForFromToExprContext ctx) {
        String variable = ctx.IDENTIFIER().getText();
        ASTNode startValue = visit(ctx.form().get(0));
        ASTNode endValue = visit(ctx.form().get(1));
        LoopForFromToNode loopForNode = new LoopForFromToNode(variable, startValue, endValue);
        if (ctx.form().size()==3){
            ASTNode changeValue = visit(ctx.form().get(2));
            loopForNode.addChangeValue(changeValue);
        }
        if(!ctx.specialForm().isEmpty()){
            for (int i=0;i<ctx.specialForm().size();i++){
                ASTNode statement = visit(ctx.specialForm(i));
                loopForNode.addStatement(statement);
            }
        }
        if(!ctx.functionCall().isEmpty()){
            for (int i=0;i<ctx.functionCall().size();i++){
                ASTNode statement = visit(ctx.functionCall(i));
                loopForNode.addStatement(statement);
            }
        }
        if (ctx.doClause()!=null){
            for (int i=0;i<ctx.doClause().bodyForms().form().size();i++){
                ASTNode statement = visit(ctx.doClause().bodyForms().form().get(i));
                loopForNode.addStatement(statement);
            }
        }
        return loopForNode;
    }

    @Override
    public ASTNode visitLoopForInExpr(LispParser.LoopForInExprContext ctx) {
        String variable = ctx.IDENTIFIER().getText();
        ASTNode list = visit(ctx.form());
        LoopForInNode loopForNode = new LoopForInNode(variable, list);
        if(!ctx.specialForm().isEmpty()){
            for (int i=0;i<ctx.specialForm().size();i++){
                ASTNode statement = visit(ctx.specialForm(i));
                loopForNode.addStatement(statement);
            }
        }
        if(!ctx.functionCall().isEmpty()){
            for (int i=0;i<ctx.functionCall().size();i++){
                ASTNode statement = visit(ctx.functionCall(i));
                loopForNode.addStatement(statement);
            }
        }
        if (ctx.doClause()!=null){
            for (int i=0;i<ctx.doClause().bodyForms().form().size();i++){
                ASTNode statement = visit(ctx.doClause().bodyForms().form().get(i));
                loopForNode.addStatement(statement);
            }
        }
        return loopForNode;
    }

    @Override
    public ASTNode visitList(LispParser.ListContext ctx) {
        ListNode listNode = new ListNode();
        if(ctx.functionCall()!=null){
            ASTNode child = visit(ctx.functionCall());
            listNode.addChild(child);
        }
        if (ctx.specialForm()!=null){
            ASTNode child = visit(ctx.specialForm());
            listNode.addChild(child);
        }
        for (int i=0;i<ctx.form().size();i++){
            ASTNode child = visit(ctx.form(i));
            listNode.addChild(child);
        }
        return listNode;
    }

    @Override
    public ASTNode visitDefunExpr(LispParser.DefunExprContext ctx) {
        ParameterListNode parameterListNode = (ParameterListNode) visitParameterList(ctx.parameterList());
        String functionName = ctx.IDENTIFIER().getText(),
        docString = null;

        if(ctx.STRING() != null){
            docString = ctx.STRING().getText();
        }

        DefunNode defunNode = new DefunNode(functionName,docString,parameterListNode);

        for (LispParser.ListContext listContext : ctx.list()) {
            defunNode.addChild(visitList(listContext));
        }

        return defunNode;
    }

    @Override
    public ASTNode visitParameterList(LispParser.ParameterListContext ctx) {
        ParameterListNode parameterListNode = new ParameterListNode();
        if(ctx.getChildCount() < 2)
            return parameterListNode;
        for(int i = 1;i<ctx.getChildCount()-1;++i)
            parameterListNode.addChild(ctx.getChild(i).getText());
        return parameterListNode;
    }

    @Override
    public ASTNode visitSetqExpr(LispParser.SetqExprContext ctx) {
        SetqNode setq = new SetqNode();
        for (int i=0;i<ctx.IDENTIFIER().size();i++){
            variables.add(ctx.IDENTIFIER(i).getText());
            setq.addChild(ctx.IDENTIFIER(i).getText(),visit(ctx.form(i)));
        }
        return setq;
    }

    @Override
    public ASTNode visitDoExpr(LispParser.DoExprContext ctx) {
        DoNode doExpression = new DoNode();

        // Process variable clauses
        for (LispParser.VariableClauseContext varCtx : ctx.variableClause()) {
            String variable = varCtx.IDENTIFIER().getText();
            ASTNode initialValue = visit(varCtx.form(0));
            ASTNode updateValue = visit(varCtx.form(1));
            doExpression.addVariable(new VariableClause(variable, initialValue, updateValue));
        }

        // Process test clause
        LispParser.TestClauseContext testCtx = ctx.testClause();
        if (testCtx != null) {
            ASTNode test = visit(testCtx.form(0));
            ASTNode returnValue = testCtx.form().size() > 1 ? visit(testCtx.form(1)) : null;
            doExpression.setTestClause(new TestClause(test, returnValue));
        }

        // Process body expressions
        for (LispParser.FormContext bodyCtx : ctx.form()) {
            ASTNode bodyForm = visit(bodyCtx);
            doExpression.addBodyForm(bodyForm);
        }

        return doExpression;
    }


    @Override
    public ASTNode visitDotimesNode(LispParser.DotimesNodeContext ctx) {
        // Retrieve the identifier and range
        String variableName = ctx.IDENTIFIER().getText();
        ASTNode range = visit(ctx.form(0));

        // Create the DotimesExpression instance
        DoTimesNode dotimesExpression = new DoTimesNode(variableName, range);

        // Visit and add body statements
        for (int i = 1; i < ctx.form().size(); i++) {
            ASTNode statement = visit(ctx.form(i));
            if (statement != null) {
                dotimesExpression.addStatement(statement);
            }
        }
        return dotimesExpression;
    }

    @Override
    public ASTNode visitDoListExpr(LispParser.DoListExprContext ctx) {
        // Extract the loop variable
        String loopVariable = ctx.IDENTIFIER().getText();

        // Visit the iterable form
        ASTNode iterable = visit(ctx.form(0));

        // Visit the body forms
        List<ASTNode> body = new ArrayList<>();
        for (int i = 1; i < ctx.form().size(); i++) {
            body.add(visit(ctx.form(i)));
        }

        // Construct and return the DolistExpression node
        return new DoListNode(loopVariable, iterable, body);
    }

    @Override
    public ASTNode visitBlockExpr(LispParser.BlockExprContext ctx) {
        // Extract block name (IDENTIFIER)
        String blockName = ctx.IDENTIFIER().getText();

        // Visit the bodyForms node
        ASTNode bodyNode = visit(ctx.bodyForms());

        // Create and return a BlockExpression node
        return new BlockNode(blockName, bodyNode);
    }

    @Override
    public ASTNode visitBodyForms(LispParser.BodyFormsContext ctx) {
        BodyForms bodyForms = new BodyForms();

        // Visit each form and add it to the BodyForms node
        for (LispParser.FormContext formCtx : ctx.form()) {
            ASTNode formNode = visit(formCtx);
            if (formNode != null) {
                bodyForms.addForm(formNode);
            }
        }

        return bodyForms;
    }

    @Override
    public ASTNode visitReturnFromExpr(LispParser.ReturnFromExprContext ctx) {
        String identifier = ctx.IDENTIFIER().getText();
        ASTNode formNode = ctx.form() != null ? visit(ctx.form()) : null;

        return new ReturnFromNode(identifier, formNode);
    }

    @Override
    public ASTNode visitLetExpr(LispParser.LetExprContext ctx) {
        // Determine if this is LET or LET_STAR
        boolean isLetStar = ctx.LET_STAR() != null;

        // Visit all let bindings
        List<LetBinding> bindings = new ArrayList<>();
        for (LispParser.LetBindingContext bindingCtx : ctx.letBinding()) {
            bindings.add((LetBinding) visit(bindingCtx));
        }

        // Visit the body forms
        ASTNode body = visit(ctx.bodyForms());

        // Create and return a LetExpr node
        return new LetNode(isLetStar, bindings, body);
    }


    @Override
    public ASTNode visitLetBinding(LispParser.LetBindingContext ctx) {
        String identifier = ctx.IDENTIFIER().getText();
        ASTNode value = ctx.form() != null ? visit(ctx.form()) : null;

        return new LetBinding(identifier, value);
    }


    @Override
    public ASTNode visitPrognExpr(LispParser.PrognExprContext ctx) {
        // Visit all the body forms and collect them as ASTNodes
        List<ASTNode> bodyForms = new ArrayList<>();
        for (var formCtx : ctx.bodyForms().form()) {
            bodyForms.add(visit(formCtx));
        }

        // Return a new PrognExpr node with the collected body forms
        return new PrognNode(bodyForms);
    }

    @Override
    public ASTNode visitLambdaExpr(LispParser.LambdaExprContext ctx) {
        // Get the "LAMBDA" keyword text
        String lambdaKeyword = ctx.LAMBDA().getText();

        // Visit the parameter list
        List<ASTNode> parameters = new ArrayList<>();
        for (var param : ctx.parameterList().children) { // Assuming parameterList has children
            parameters.add(visit(param));
        }

        // Visit the body forms
        ASTNode body = visit(ctx.bodyForms());

        // Create and return a LambdaExpr node
        return new LambdaNode(lambdaKeyword, parameters, body);
    }

    @Override
    public ASTNode visitSetfExpr(LispParser.SetfExprContext ctx) {
        SetfNode setfExpression = new SetfNode();

        // Loop through all pairs of forms in the context
        for (int i = 0; i < ctx.form().size(); i += 2) {
            ASTNode target = visit(ctx.form(i));   // Visit the target form
            ASTNode value = visit(ctx.form(i + 1)); // Visit the value form
            setfExpression.addAssignment(target, value);
        }

        return setfExpression;
    }

    @Override
    public ASTNode visitReturnClause(LispParser.ReturnClauseContext ctx) {
        ASTNode returnValue = null;

        // Check if the optional `form` exists and visit it
        if (ctx.form() != null) {
            returnValue = visit(ctx.form());
        }

        // Create and return the ReturnClause AST node
        return new ReturnClause(returnValue);
    }

    @Override
    public ASTNode visitListExp(LispParser.ListExpContext ctx) {
        // Visit the first form
        ASTNode firstForm = visit(ctx.form(0));

        // Visit the remaining forms
        List<ASTNode> otherForms = new ArrayList<>();
        for (int i = 1; i < ctx.form().size(); i++) {
            otherForms.add(visit(ctx.form(i)));
        }

        // Construct the ListExpression node
        return new ListExprNode(firstForm, otherForms);
    }

    @Override
    public ASTNode visitFunctionCallSpecial(LispParser.FunctionCallSpecialContext ctx) {
        // Get the function name (IDENTIFIER)
        String functionName = ctx.IDENTIFIER().getText();

        // Visit each argument (form) and collect into a list
        List<ASTNode> arguments = new ArrayList<>();
        for (LispParser.FormContext formCtx : ctx.form()) {
            arguments.add(visit(formCtx));
        }

        // Create and return the FunctionCallSpecial node
        return new FunctionCallSpecial(functionName, arguments);
    }


    @Override
    public ASTNode visitDefmacroExpr(LispParser.DefmacroExprContext ctx) {
        ParameterListNode parameterListNode = (ParameterListNode) visitParameterList(ctx.parameterList());
        String macroName = ctx.IDENTIFIER().getText(),
                docString = null;

        if(ctx.STRING() != null){
            docString = ctx.STRING().getText();
        }

        DefmacroNode defmacroNode = new DefmacroNode(macroName,docString,parameterListNode);
        for (int i=0;i<ctx.bodyForms().form().size();i++){
            ASTNode statement = visit(ctx.bodyForms().form().get(i));
            defmacroNode.addChild(statement);
        }

        return defmacroNode;
    }

    @Override
    public ASTNode visitDefvarExpr(LispParser.DefvarExprContext ctx) {
        String varName = ctx.IDENTIFIER().getText(),
                docString = null;

        if(ctx.STRING() != null){
            docString = ctx.STRING().getText();
        }

        ASTNode astNode = null;

        try {
            astNode = visit(ctx.form());
        }catch(Exception ignored){

        }

        return new DefvarNode(varName,docString, astNode);
    }

    @Override
    public ASTNode visitDefparameterExpr(LispParser.DefparameterExprContext ctx) {
        String varName = ctx.IDENTIFIER().getText(),
                docString = null;

        if(ctx.STRING() != null){
            docString = ctx.STRING().getText();
        }

        return new DefparameterNode(varName,docString, visit(ctx.form()));
    }

    @Override
    public ASTNode visitDefconstantExpr(LispParser.DefconstantExprContext ctx) {
        String varName = ctx.IDENTIFIER().getText(),
                docString = null;

        if(ctx.STRING() != null){
            docString = ctx.STRING().getText();
        }

        return new DefconstantNode(varName,docString, visit(ctx.form()));
    }

    @Override
    public ASTNode visitMacroletExpr(LispParser.MacroletExprContext ctx) {

        MacroLetNode macroLetNode = new MacroLetNode();

        for (LispParser.MacroletDefContext macroletDefContext : ctx.macroletDef()) {
            macroLetNode.addMacroLetDef(visitMacroletDef(macroletDefContext));
        }

        for (int i=0;i<ctx.bodyForms().form().size();i++){
            ASTNode statement = visit(ctx.bodyForms().form().get(i));
            macroLetNode.addBody(statement);
        }

        return macroLetNode;
    }

    @Override
    public ASTNode visitMacroletDef(LispParser.MacroletDefContext ctx) {
        ParameterListNode parameterListNode = (ParameterListNode) visitParameterList(ctx.parameterList());
        MacroLetDefNode macroLetDefNode = new MacroLetDefNode(parameterListNode);

        for (int i=0;i<ctx.bodyForms().form().size();i++){
            ASTNode statement = visit(ctx.bodyForms().form().get(i));
            macroLetDefNode.addChild(statement);
        }

        return macroLetDefNode;
    }
}
