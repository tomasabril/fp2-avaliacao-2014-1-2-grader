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
public abstract class Polinomio {
    protected Number[] coef;

    protected Polinomio() {    
    }
    
    public Polinomio(Number[] a) {
        if (a.length < 2)
            throw new IllegalArgumentException("Polinômio inválido");
        this.coef = a;
    }
    
    public int getGrau() {
        return coef.length - 1;
    }

    public double poli(double x) {
        double px = coef[coef.length - 1].doubleValue();
        for (int i = 0; i < coef.length - 1; i++) {
            px += coef[i].doubleValue() * Math.pow(x, coef.length-i-1);
        }
        return px;
    }
    
    public abstract double[] getRaizes() throws RaizException;
    
    @Override
    public String toString() {
        StringBuilder s = new StringBuilder();
        for (int i = 0; i < coef.length; i++) {
            s.append(coef[i].doubleValue() > 0 ? "+" : "");
            s.append(coef[i].toString()).append("x^").append(coef.length-i-1);
        }
        return s.toString();
    }
    
}
