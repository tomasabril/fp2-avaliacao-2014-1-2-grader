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
public class PoliQuad extends Polinomio {

    public PoliQuad(Number a, Number b, Number c) {
        coef = new Number[]{ a, b, c };
    }

    @Override
    public double[] getRaizes() throws RaizException {
        double delta = Math.pow(coef[1].doubleValue(), 2) - 4 * coef[0].doubleValue()
                * coef[2].doubleValue();
        if (delta < 0.0)
            throw new RaizException(this);
        return new double[] {
            (-coef[1].doubleValue() - Math.sqrt(delta)) / (2 * coef[0].doubleValue()),
            (-coef[1].doubleValue() + Math.sqrt(delta)) / (2 * coef[0].doubleValue())
        };
    }    
}
