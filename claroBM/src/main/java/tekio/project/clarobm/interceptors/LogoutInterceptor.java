/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.interceptors;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.StrutsStatics;
import org.apache.struts2.dispatcher.SessionMap;

/**
 *
 * @author Tanya Tapia
 */
public class LogoutInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation ai) throws Exception {
        //System.out.println("entre");
        final ActionContext context = ai.getInvocationContext();
        HttpServletResponse response = (HttpServletResponse) context.get(StrutsStatics.HTTP_RESPONSE);
        SessionMap<String, Object> map = (SessionMap<String, Object>) ai.getInvocationContext().getSession();
        //System.out.println(map.get("username"));
        if (response != null) {
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        }
        if(map != null){
            //System.out.println("entre2");
            map.remove("username");
            map.put("username", null);
            map.invalidate();
        }
        return ai.invoke();//To change body of generated methods, choose Tools | Templates.
    }

}
