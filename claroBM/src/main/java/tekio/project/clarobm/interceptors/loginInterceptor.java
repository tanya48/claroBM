/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.interceptors;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.StrutsStatics;
import org.apache.struts2.dispatcher.SessionMap;

/**
 *
 * @author Tanya Tapia
 */
public class loginInterceptor extends AbstractInterceptor {

    @Override
    public void destroy() {
        super.destroy(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void init() {
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String intercept(ActionInvocation ai) throws Exception {
        ActionContext context = ai.getInvocationContext();
        //for login and register actions ignore checking
        if (context.getName().equalsIgnoreCase("login")) {
            return ai.invoke();   
        }
        SessionMap<String, Object> map = (SessionMap<String, Object>) ai.getInvocationContext().getSession();
        if (map == null) {
            return "login";
        }
        Object user = map.get("username");
        //System.out.println(user);
        if (user == null || user.equals("") || map.isEmpty() || map == null) {
            return "login";
        }
        return ai.invoke(); //To change body of generated methods, choose Tools | Templates.
    }

}
