Feature: Scans application for packages and classes
    As a CS teacher
    I want to test students' programming assignments
    In order to find out if classes have been correctly created

    Background:
        Given the main class is 'Avaliacao2'
        Given the maximum grade is 2
    
    Scenario: Declare main class in default package (0.1)
        Given I report 'STARTING GRADING...'
        Given I report 'GRADING TASK 2...'
        Given class 'Avaliacao2' exists somewhere store class in <clazz>
        Then award .05 points
        Given the class <clazz> is in the 'default' package
        Then award .05 points

    Scenario: Declare abstract class Polinomio (0.1)
        Given I report 'GRADING TASK 3...'
        Given class 'Polinomio' exists somewhere store class in <policlass>
        Given the class <policlass> is in the 'utfpr.ct.dainf.if62c.avaliacao' package
        Then award .05 points
        And class <policlass> has 'abstract' modifier
        Then award .05 points

    Scenario: Declare protected Number[] coef in class Polinomic (0.1)
        Given I report 'GRADING TASK 4...'
        Given class 'Polinomio' exists somewhere store class in <policlass>
        And class <policlass> declares field 'coef' save in <coefField>
        And field <coefField> is of type '[Ljava.lang.Number;'
        Then award .05 points
        Given field <coefField> has 'protected' modifier
        Then award .05 points

    Scenario: Declare protected default constructor for class Polinomio (0.1)
        Given I report 'GRADING TASK 5...'
        Given class 'Polinomio' exists somewhere store class in <policlass>
        And class <policlass> declares 'Polinomio()' constructor save in <polidc>
        Then award .05 points
        Given member <polidc> has 'protected' modifier
        Then award .05 points

    Scenario: Declare public constructor Polinomio(Number[]) for class Polinomic (0.2)
        Given I report 'GRADING TASK 6...'
        Given class 'Polinomio' exists somewhere store class in <policlass>
        And class <policlass> declares 'Polinomio(java.lang.Number[])' constructor save in <polic>
        Given member <polic> has 'public' modifier 
        Then award .05 points
        Given I import <policlass>
        And I evaluate 'public class PoliTest extends Polinomio { public PoliTest(Number[] a) { super(a); } public Number[] getRaizes() { return null; } }'
        And I evaluate 'int testNumCoefs = (int)(Math.random() * 10 + 2)'
        And I evaluate 'new PoliTest(new Number[testNumCoefs])'
        And I report 'Object of class Polinomio instantiated with Polinomio(Number[])'
        Then award .05 points
        Given evaluating 'new PoliTest(new Number[1])' throws instance of 'java.lang.IllegalArgumentException' save in <poliexcept>
        Then award .05 points
        Given I evaluate 'expMsg = poliexcept.getMessage()'
        And <expMsg> matches regex '^.*[Pp]olin[oô]mio\s+inv[aá]lido.*$' with 'Pattern.CASE_INSENSITIVE' option
        Then award .05 points

    Scenario: Overload toString() method in class Polinomio.
              It should return something like "+1x^3-2x^2+1x^1-1x^0" (0.1)
        Given I report 'GRADING TASK 7...'
        Given class 'Polinomio' exists somewhere store class in <policlass>
        Given I import <policlass>
        And I evaluate 'public class PoliTest extends Polinomio { public PoliTest(Number[] a) { super(a); } public Number[] getRaizes() { return null; } }'
        And I evaluate 'Double atest = Math.random() * 10, btest = Math.random() * 10, ctest = Math.random() * 10;'
        And I evaluate 'PoliTest poliobj = new PoliTest(new Number[] { atest, btest, ctest })'
        And I evaluate 'String polistr = poliobj.toString()'
        And I report 'Polinomio.toString() implemented'
        Then award .05 points
        Given <polistr> matches regex '^\s*[0-9,.+-]+\s*x\s*\^\s*2\s*[0-9,.+-]+\s*x\s*\^\s*1\s*[0-9,.+-]+\s*x\s*\^\s*0\s*$'
        Then award .05 points

    Scenario: Declare getGrau() method in class Polinomio.
              Checks if the correct value is returned.
        Given I report 'GRADING TASK 8...'
        Given class 'Polinomio' exists somewhere store class in <policlass>
        Given I import <policlass>
        And I evaluate 'public class PoliTest extends Polinomio { public PoliTest(Number[] a) { super(a); } public Number[] getRaizes() { return null; } }'
        And I evaluate 'int coefCount = (int)(Math.random() * 10 + 2);'
        And I evaluate 'PoliTest poliobj1 = new PoliTest(new Number[coefCount])'
        And I evaluate 'int poliDegree = poliobj1.getGrau();'
        And I report 'Polinomio.getGrau() implemented'
        Then award .05 points
        Given expression 'poliDegree + 1' evaluates to <coefCount>
        Then award .05 points

    Scenario: Declcare public poli(double x) in class Polinomio.
              Check if it returns the correct value.
        Given I report 'GRADING TASK 9...'
        Given class 'Polinomio' exists somewhere store class in <policlass>
        Given I import <policlass>
        And I evaluate 'public class PoliTest extends Polinomio { public PoliTest(Number[] a) { super(a); } public Number[] getRaizes() { return null; } }'
        And I evaluate 'Double atest = Math.random() * 10, btest = Math.random() * 10, ctest = Math.random() * 10, xtest = Math.random();'
        And I evaluate 'PoliTest poliobj2 = new PoliTest(new Number[] { atest, btest, ctest })'
        And I evaluate 'double px = poliobj2.poli(xtest)'
        And I report 'Polinomio.poli(double x) declared'
        Then award .1 points
        Given I evaluate 'double pxTest = atest * xtest * xtest + btest * xtest + ctest'
        And expression 'Math.abs(px - pxTest) < 0.00001' evaluates to <true> 
        Then award .1 points
        
    Scenario: Declcare abstract double[] getRaizes() in class Polinomio.
        Given I report 'GRADING TASK 10...'
        Given class 'Polinomio' exists somewhere store class in <policlass>
        Given I import <policlass>
        And class <policlass> declares 'getRaizes()' method save in <getraizes>
        And member <getraizes> has 'abstract' modifier
        And member <getraizes> has 'public' modifier
        Then award .05 points
        Given method <getraizes> returns type '[D'
        Then award .05 points        

    Scenario: Implement class RaizException extends java.lang.Exception.
        Given I report 'GRADING TASK 11...'
        Given class 'RaizException' exists somewhere store class in <raizexclass>
        Then award .05 points
        Given the class <raizexclass> is in the 'utfpr.ct.dainf.if62c.avaliacao' package
        Then award .05 points
        Given class <raizexclass> declares 'RaizException(utfpr.ct.dainf.if62c.avaliacao.Polinomio)' constructor save in <polic>
        Then award .05 points
        Given class 'Polinomio' exists somewhere store class in <policlass>
        Given I import <policlass>
        And I evaluate 'public class PoliTest extends Polinomio { public PoliTest(Number[] a) { super(a); } public Number[] getRaizes() { return null; } }'
        And I evaluate 'Double atest = Math.random() * 10, btest = Math.random() * 10, ctest = Math.random() * 10, xtest = Math.random();'
        And I evaluate 'PoliTest poliobj3 = new PoliTest(new Number[] { atest, btest, ctest })'
        And I import <raizexclass>
        And I evaluate 'RaizException excepTest = new RaizException(poliobj3);'
        And I evaluate 'excepMsg = excepTest.getMessage();'
        And <excepMsg> matches regex '^\s*[Pp]olin[oô]mio\s+.+$' with 'Pattern.CASE_INSENSITIVE' option
        And I evaluate 'regexValue = "^.+" + String.valueOf((int)((atest - Math.floor(atest)) * 100000)) + ".+$"'
        And <excepMsg> matches regex <regexValue> with 'Pattern.CASE_INSENSITIVE' option
        And I evaluate 'regexValue = "^.+" + String.valueOf((int)((btest - Math.floor(btest)) * 100000)) + ".+$"'
        And <excepMsg> matches regex <regexValue> with 'Pattern.CASE_INSENSITIVE' option
        And I evaluate 'regexValue = "^.+" + String.valueOf((int)((ctest - Math.floor(ctest)) * 100000)) + ".+$"'
        And <excepMsg> matches regex <regexValue> with 'Pattern.CASE_INSENSITIVE' option
        Then award .05 points

    Scenario: Implement class PoliLinear extends Polinomio.
        Given I report 'GRADING TASK 12...'
        Given class 'PoliLinear' exists somewhere store class in <polilinclass>
        And I import <polilinclass>
        And expression 'polilinclass.getSuperclass()' evaluates to <Polinomio.class>
        And class <polilinclass> declares 'PoliLinear(java.lang.Number,java.lang.Number)' constructor save in <polilinc>
        Then award .05 points
        Given I evaluate 'Double atest = Math.random() * 10, btest = Math.random() * 10'
        And I evaluate 'PoliLinear poliLinTest = new PoliLinear(atest, btest)'
        And I get field 'coef' value in super class of <poliLinTest> save in <coefVal>
        And expression 'coefVal[0]' evaluates to <atest>
        And expression 'coefVal[1]' evaluates to <btest>
        Then award .05 points

    Scenario: Overload method getRaizes() in class PoliLinear extends Polinomio.
        Given I report 'GRADING TASK 13...'
        Given class 'PoliLinear' exists somewhere store class in <polilinclass>
        And class <polilinclass> declares 'getRaizes()' method save in <getraizes>
        And method <getraizes> returns type '[D'
        Then award .05 points
        Given I evaluate 'Double atest = Math.random() * 10 + 1, btest = Math.random() * 10 + 1'
        And I evaluate 'PoliLinear poliLinTest = new PoliLinear(atest, btest)'
        And I evaluate 'rootsTest = poliLinTest.getRaizes();'
        And I evaluate 'double root0 = -btest/atest'
        And expression 'Math.abs(rootsTest[0]-root0) < 0.00001' evaluates to <true>
        Then award .05 points
        Given I evaluate 'atest = 0.0;'
        And I evaluate 'poliLinTest = new PoliLinear(atest, btest)'
        And evaluating 'poliLinTest.getRaizes()' throws instance of 'utfpr.ct.dainf.if62c.avaliacao.RaizException' save in <poliexcept>
        Then award .1 points
        
    Scenario: Implement class PoliQuad extends Polinomio.
        Given I report 'GRADING TASK 14...'
        Given class 'PoliQuad' exists somewhere store class in <poliquadclass>
        And I import <poliquadclass>
        And expression 'poliquadclass.getSuperclass()' evaluates to <Polinomio.class>
        And class <poliquadclass> declares 'PoliQuad(java.lang.Number,java.lang.Number,java.lang.Number)' constructor save in <poliquadc>
        Then award .05 points
        Given I evaluate 'Double atest = Math.random() * 10, btest = Math.random() * 10, ctest = Math.random() * 10'
        And I evaluate 'PoliQuad poliQuadTest = new PoliQuad(atest, btest, ctest)'
        And I get field 'coef' value in super class of <poliQuadTest> save in <coefVal>
        And expression 'coefVal[0]' evaluates to <atest>
        And expression 'coefVal[1]' evaluates to <btest>
        And expression 'coefVal[2]' evaluates to <ctest>
        Then award .05 points

    Scenario: Overload method getRaizes() in class PoliQuad extends Polinomio.
        Given I report 'GRADING TASK 15...'
        Given class 'PoliQuad' exists somewhere store class in <poliquadclass>
        And class <poliquadclass> declares 'getRaizes()' method save in <getraizes>
        And method <getraizes> returns type '[D'
        Then award .05 points
        Given I evaluate 'Double atest = Math.random() * 10 + 1, ctest = Math.random() * 10 + 1, btest = 3*Math.sqrt(atest*ctest)'
        And I evaluate 'PoliQuad poliQuadTest = new PoliQuad(atest, btest, ctest)'
        And I evaluate 'rootsTest = poliQuadTest.getRaizes();'
        And I evaluate 'double root0 = (-btest - Math.sqrt(5*atest*ctest))/(2*atest)'
        And expression 'Math.abs(rootsTest[0]-root0) < 0.00001 || Math.abs(rootsTest[1]-root0) < 0.00001' evaluates to <true>
        Then award .05 points
        Given I evaluate 'double root1 = (-btest + Math.sqrt(5*atest*ctest))/(2*atest)'
        And expression 'Math.abs(rootsTest[0]-root1) < 0.00001 || Math.abs(rootsTest[1]-root1) < 0.00001' evaluates to <true>
        Then award .05 points
        Given I evaluate 'btest = Math.sqrt(atest*ctest);'
        And I evaluate 'poliQuadTest = new PoliQuad(atest, btest, ctest)'
        And evaluating 'poliQuadTest.getRaizes()' throws instance of 'utfpr.ct.dainf.if62c.avaliacao.RaizException' save in <poliexcept>
        Then award .05 points

    Scenario: Run program and check for correct output.
        Given I report 'GRADING TASK 16...'
        Given class 'Avaliacao2' exists somewhere store class in <clazz>
        And I import <clazz>
        Given I set output to <mainout>
        And I evaluate 'Avaliacao2.main(new String[0])'
        And I set output to <default>
        And I evaluate 'outstr = mainout.toString()'
        And expression 'outstr.trim().isEmpty()' evaluates to <false>
        Then award .05 points
        And <outstr> matches regex '^.*0.*$' with 'Pattern.DOTALL' option
        And <outstr> matches regex '^.*-1.*$' with 'Pattern.DOTALL' option
        And <outstr> matches regex '^.*333.*$' with 'Pattern.DOTALL' option
        And <outstr> matches regex '^.*66.*$' with 'Pattern.DOTALL' option
        Then award .05 points

    Scenario: Report final grade.
        Given I report grade formatted as 'FINAL GRADE: %.1f'
