/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller.index;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author sai
 */
public class indexController extends MultiActionController {
    public ModelAndView show(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }

     public ModelAndView show_ser(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView("Services");
        return mv;
    }

}
