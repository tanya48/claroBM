/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 *
 * @author Tanya Tapia
 */
public class loginAction extends ActionSupport {

    private String username;
    private String password;
    Map<String,Object> session = ActionContext.getContext().getSession();

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public String execute() throws Exception {
        if (username.equals("tanya") && password.equals("tapia")) {
            //System.out.println("si es");
            session.put("username", username);
            return SUCCESS;
        }else
        {
            session.put("username", null);
            return ERROR;
        }
    }

}
