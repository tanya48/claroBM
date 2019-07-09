/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.actions;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import tekio.project.clarobm.utils.Conexion;

/**
 *
 * @author Tanya Tapia
 */
public class checkData extends ActionSupport {
    
    private String mpport;

    public void setMpport(String mpport) {
        this.mpport = mpport;
    }
    
    @Override
    public String execute() throws Exception {
        try {
            Connection con = Conexion.getConexion();
            String centrals = "select idCentral from central where puertoProxy = ?";
            PreparedStatement ps = con.prepareStatement(centrals);
            //System.out.println("HOLAAA " + cid);
            ps.setString(1, mpport);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               return SUCCESS;
            } 
            con.close();
            return ERROR;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
}
