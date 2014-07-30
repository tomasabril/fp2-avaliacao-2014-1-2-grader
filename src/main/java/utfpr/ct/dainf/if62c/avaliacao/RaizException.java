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
public class RaizException extends Exception {

    public RaizException(Polinomio p) {
        super(String.format("Polinômio '%s' não tem raízes", p));
    }
    
}
