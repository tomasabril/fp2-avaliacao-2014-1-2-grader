/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package utfpr.ct.dainf.if62c.avaliacao;

/**
 *
 * @author Wilson
 */
public class PoliLinear extends Polinomio {

    public PoliLinear(Number a, Number b) {
        super(new Number[]{ a, b });
        
        /* OU
        coef = new Number[2];
        coef[0] = coef;
        coef[1] = b;
        */
    }
    
    @Override
    public double[] getRaizes() throws RaizException {
        if (coef[0].doubleValue() == 0.0)
            throw new RaizException(this);
        return new double[] { -coef[1].doubleValue() / coef[0].doubleValue() };
    }
    
}
