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
import java.util.logging.Level;
import java.util.logging.Logger;
import tekio.project.clarobm.utils.Conexion;

/**
 *
 * @author Tanya Tapia
 */
public class UpdateRecords extends ActionSupport {

    //For central
    private String mceclli;
    private String lc;
    private String mcepip;
    private String mcepport;
    private String mcecip;
    private int cid;
    private Central central;
    private ArrayList<CentralPorts> cp = new ArrayList<>();
    private ArrayList<CentralPorts> cp2 = new ArrayList<>();

    //For central users
    private String mcuename;
    private String lcwt;
    private String mcuepass;
    private int cuid;

    //For AD users
    private String madename;
    private int uadid;
    private String lcwu;
    private int madcid;

    public int getUadid() {
        return uadid;
    }

    public void setUadid(int uadid) {
        this.uadid = uadid;
    }

    public void setMadename(String madename) {
        this.madename = madename;
    }

    public void setLcwu(String lcwu) {
        this.lcwu = lcwu;
    }

    public void setMadcid(int madcid) {
        this.madcid = madcid;
    }
    
    public int getCuid() {
        return cuid;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public void setMcuename(String mcuename) {
        this.mcuename = mcuename;
    }

    public void setLcwt(String lcwt) {
        this.lcwt = lcwt;
    }

    public void setMcuepass(String mcuepass) {
        this.mcuepass = mcuepass;
    }

    public void setCp2(ArrayList<CentralPorts> cp2) {
        this.cp2 = cp2;
    }

    public void setMceclli(String mceclli) {
        this.mceclli = mceclli;
    }

    public void setLc(String lc) {
        this.lc = lc;
    }

    public void setMcepip(String mcepip) {
        this.mcepip = mcepip;
    }

    public void setMcepport(String mcepport) {
        this.mcepport = mcepport;
    }

    public void setMcecip(String mcecip) {
        this.mcecip = mcecip;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Central getCentral() {
        return central;
    }

    public void setCentral(Central central) {
        this.central = central;
    }

    public void setCp(ArrayList<CentralPorts> cp) {
        this.cp = cp;
    }

    //For update central
    @Override
    public String execute() throws Exception {
        try {
            Connection conn = Conexion.getConexion();
            String sql = "UPDATE central SET ipOriginal = ?, ipProxy = ?, puertoProxy = ?, descripcion = ?, fk_idTipoCentral = ? WHERE idCentral = ?";
            PreparedStatement pss = conn.prepareStatement(sql);
            pss.setString(1, mcecip);
            pss.setString(2, mcepip);
            pss.setInt(3, Integer.parseInt(mcepport));
            pss.setString(4, mceclli.toUpperCase());
            pss.setInt(5, Integer.parseInt(lc));
            pss.setInt(6, cid);
            pss.execute();

            central = getCentral();
            cp = central.getCp();
            cp2 = central.getCp2();
            for (CentralPorts c : cp) {
                for (CentralPorts cc : cp2) {
                    String sqlp = "select * from puertos where puertoOriginal = ? and fk_idCentral = ?";
                    pss = conn.prepareStatement(sqlp);
                    pss.setInt(1, cc.getCport());
                    pss.setInt(2, cid);
                    ResultSet rs = pss.executeQuery();
                    if (rs.next()) {
                        String sql2 = "UPDATE puertos SET puertoOriginal = ? where fk_idCentral = ? and puertoOriginal = ?";
                        pss = conn.prepareStatement(sql2);
                        pss.setInt(1, c.getCport());
                        pss.setInt(2, cid);
                        pss.setInt(3, cc.getCport());
                        pss.execute();
                        cp2.remove(0);
                        break;
                    }
                }
            }
            conn.close();
            return SUCCESS;
        } catch (Exception ex) {
            Logger.getLogger(InsertRecords.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR;
        }
    }

    public String updateCU() throws Exception {
        try {
            Connection conn = Conexion.getConexion();
            String sql = "UPDATE usuariocentral SET username = ?, password = ?, fk_idCentral= ? WHERE idUsuarioCentral = ?";
            PreparedStatement pss = conn.prepareStatement(sql);
            pss.setString(1, mcuename);
            pss.setString(2, mcuepass);
            pss.setInt(3, Integer.parseInt(lcwt));
            pss.setInt(4, cuid);
            pss.execute();
            conn.close();
            return SUCCESS;
        } catch (Exception ex) {
            Logger.getLogger(InsertRecords.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR;
        }
    }

    public String updateAD() throws Exception {
        try {

            Connection conn = Conexion.getConexion();
            
            //usuarioAD table 
            String sql = "UPDATE usuarioad SET username = ? WHERE idUsuarioAD = ?";
            PreparedStatement pss = conn.prepareStatement(sql);
            pss.setString(1, madename);
            pss.setInt(2, uadid);
            pss.execute();
            System.out.println("ENTRE 22");
            //usuarioad_has_usuariocentral
            String cucid = "SELECT fk_idCentral from usuariocentral where idUsuarioCentral = ?";
            pss = conn.prepareStatement(cucid);
            pss.setInt(1, Integer.parseInt(lcwu));
            ResultSet rs = pss.executeQuery();
            if (rs.next()) {
                madcid = rs.getInt(1);
            }
            String sql2 ="UPDATE usuarioad_has_usuariocentral SET fk_idUsuarioCentral = ?,fk_idCentral= ? WHERE fk_idUsuarioAD = ?";
            pss = conn.prepareStatement(sql2);
            pss.setInt(1, Integer.parseInt(lcwu));
            pss.setInt(2, madcid);
            pss.setInt(3, uadid);
            pss.execute();
            conn.close();
            return SUCCESS;
        } catch (Exception ex) {
            Logger.getLogger(InsertRecords.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR;
        }
    }

}
