/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.actions;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import tekio.project.clarobm.utils.Conexion;

/**
 *
 * @author Tanya Tapia
 */
public class InsertRecords extends ActionSupport {

    //For Central User
    private String mcuname;
    private String mcupass;
    private String lcwt;

    //For Central
    private String mclli;
    private String lc;
    private String mpip;
    private String mpport;
    private String mcip;
    private int mcid;
    private Central central;
    private ArrayList<CentralPorts> cp = new ArrayList<>();

    //For AD User
    private String madname;
    private String lcwu;
    private int madid;
    private int madcid;

    public void setMadcid(int madcid) {
        this.madcid = madcid;
    }

    public void setMadname(String madname) {
        this.madname = madname;
    }

    public void setLcwu(String lcwu) {
        this.lcwu = lcwu;
    }

    public void setMadid(int madid) {
        this.madid = madid;
    }

    public void setCp(ArrayList<CentralPorts> cp) {
        this.cp = cp;
    }

    public void setMcid(int mcid) {
        this.mcid = mcid;
    }

    public void setMclli(String mclli) {
        this.mclli = mclli;
    }

    public void setLc(String lc) {
        this.lc = lc;
    }

    public void setMpip(String mpip) {
        this.mpip = mpip;
    }

    public void setMpport(String mpport) {
        this.mpport = mpport;
    }

    public void setMcip(String mcip) {
        this.mcip = mcip;
    }

    public Central getCentral() {
        return central;
    }

    public void setCentral(Central central) {
        this.central = central;
    }

    public void setLcwt(String lcwt) {
        this.lcwt = lcwt;
    }

    public void setMcuname(String mcuname) {
        this.mcuname = mcuname;
    }

    public void setMcupass(String mcupass) {
        this.mcupass = mcupass;
    }

    //For Central Users
    @Override
    public String execute() throws Exception {
        try {
            Connection conn = Conexion.getConexion();
            String sql = "INSERT INTO usuariocentral(username, password, fk_idCentral) VALUES(?,?,?)";
            PreparedStatement pss = conn.prepareStatement(sql);
            pss.setString(1, mcuname);
            pss.setString(2, mcupass);
            pss.setInt(3, Integer.parseInt(lcwt));
            pss.execute();
            conn.close();
            return SUCCESS;

        } catch (Exception ex) {
            Logger.getLogger(InsertRecords.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR;
        }
    }

    //For AD Users
    public String addADUsers() throws Exception {
        try {
            Connection conn = Conexion.getConexion();
            //For usuarioad table
            String sql = "INSERT INTO usuarioad(username) VALUES(?)";
            PreparedStatement pss = conn.prepareStatement(sql);
            //pss.setString(1, maddom.concat("/").concat(madname));
            pss.setString(1,madname);
            pss.execute();

            //For uasuarioad_has_usuariocentral
            //Getting idUsuarioAD
            String uadid = "SELECT MAX(idUsuarioAD) from usuarioad";
            pss = conn.prepareStatement(uadid);
            ResultSet rs = pss.executeQuery();
            if (rs.next()) {
                madid = rs.getInt(1);
            }
            //Getting fk_idCentral
            String cucid = "SELECT fk_idCentral from usuariocentral where idUsuarioCentral = ?";
            pss = conn.prepareStatement(cucid);
            pss.setInt(1, Integer.parseInt(lcwu));
            rs = pss.executeQuery();
            if (rs.next()) {
                madcid = rs.getInt(1);
            }
            String sql2 = "INSERT INTO usuarioad_has_usuariocentral(fk_idUsuarioAD, fk_idUsuarioCentral, fk_idCentral) values (?,?,?)";
            pss = conn.prepareStatement(sql2);
            pss.setInt(1, madid);
            pss.setInt(2, Integer.parseInt(lcwu));
            pss.setInt(3, madcid);
            pss.execute();
            conn.close();
            return SUCCESS;

        } catch (Exception ex) {
            Logger.getLogger(InsertRecords.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR;
        }
    }

    //For Centrals
    public String addCentrals() throws Exception {
        try {
            Connection conn = Conexion.getConexion();
            String sql = "INSERT INTO central(ipOriginal, ipProxy, puertoProxy, descripcion, fk_idTipoCentral) VALUES(?,?,?,?,?)";
            PreparedStatement pss = conn.prepareStatement(sql);
            pss.setString(1, mcip);
            pss.setString(2, mpip);
            pss.setInt(3, Integer.parseInt(mpport));
            pss.setString(4, mclli.toUpperCase());
            pss.setInt(5, Integer.parseInt(lc));
            pss.execute();

            //For inserting in ports table
            String centralID = "SELECT MAX(idCentral) from central";
            pss = conn.prepareStatement(centralID);
            ResultSet rs = pss.executeQuery();
            if (rs.next()) {
                mcid = rs.getInt(1);
            }
            central = getCentral();
            cp = central.getCp();
            for (CentralPorts c : cp) {
                String sql2 = "INSERT INTO puertos(puertoOriginal, fk_idCentral) values (?,?)";
                pss = conn.prepareStatement(sql2);
                pss.setInt(1, c.getCport());
                pss.setInt(2, mcid);
                pss.execute();
            }
            conn.close();
            return SUCCESS;
        } catch (Exception ex) {
            Logger.getLogger(InsertRecords.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR;
        }
    }

}
