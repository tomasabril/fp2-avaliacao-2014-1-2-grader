
import utfpr.ct.dainf.if62c.avaliacao.PoliLinear;
import utfpr.ct.dainf.if62c.avaliacao.PoliQuad;
import utfpr.ct.dainf.if62c.avaliacao.RaizException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Wilson
 */
public class Avaliacao2 {
    public static void main(String[] args) throws RaizException {
        PoliLinear p1 = new PoliLinear(3.0, 2.0);
        double[] r1 = p1.getRaizes();
        System.out.format("Raíz de p1(x) = %s: %f%n", p1, r1[0]);
        System.out.format("p1(%s) = %f%n", r1[0], p1.poli(r1[0]));
        PoliQuad p2 = new PoliQuad(3, 2, -1);
        double[] r2 = p2.getRaizes();
        System.out.format("Raízes de p2(x) %s: %f %f%n", p2, r2[0], r2[1]);
        System.out.format("p2(%s) = %f%n", r2[0], p2.poli(r2[0]));
        System.out.format("p2(%s) = %f%n", r2[1], p2.poli(r2[1]));
    }
}
