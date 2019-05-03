/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.actions;

import com.opensymphony.xwork2.ActionSupport;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.FilenameUtils;
import tekio.project.clarobm.utils.Conexion;

/**
 *
 * @author Tanya Tapia
 */
public class addCentral extends ActionSupport {

    private String clli;
    private String cip;
    private int cports;
    private String pip;
    private int pports;

    public String getClli() {
        return clli;
    }

    public void setClli(String clli) {
        this.clli = clli;
    }

    public String getCip() {
        return cip;
    }

    public void setCip(String cip) {
        this.cip = cip;
    }

    public int getCports() {
        return cports;
    }

    public void setCports(int cports) {
        this.cports = cports;
    }

    public String getPip() {
        return pip;
    }

    public void setPip(String pip) {
        this.pip = pip;
    }

    public int getPports() {
        return pports;
    }

    public void setPports(int pports) {
        this.pports = pports;
    }
    
    

    @Override
    public String execute() throws Exception {
        System.out.print("ENTRE AL EXECUTE");
        if (!clli.isEmpty()) {
            System.out.print("ENTRE AL IF");
            try {
                Connection conn = Conexion.getConexion();
                String sql = "INSERT INTO Central(ipOriginal, ipProxy, puertoProxy, descripcion,fk_idTipoCentral) VALUES(?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, cip);
                ps.setString(2, pip);
                ps.setInt(3, pports);
                ps.setString(4, clli);
                ps.setInt(5, 1);
                ps.execute();
                //el binaryStream almacena bytes, con java obtienes el inputstream.
                return SUCCESS;

            } catch (Exception ex) {
                Logger.getLogger(addCentral.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            addActionError("Fill all the gaps.");
            return ERROR;
        }
        return ERROR; //To change body of generated methods, choose Tools | Templates.
    }

}
