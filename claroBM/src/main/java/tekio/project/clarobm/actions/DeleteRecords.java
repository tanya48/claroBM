/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.actions;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import tekio.project.clarobm.utils.Conexion;

/**
 *
 * @author Tanya Tapia
 */
public class DeleteRecords extends ActionSupport {

    private int cid;
    private int cuid;
    private int uadid;

//    DELETE ALL (checkBox)
    private ArrayList<Integer> id = new ArrayList<>();
    private ArrayList<Integer> idcu = new ArrayList<>();
    private ArrayList<Integer> idad = new ArrayList<>();

    public ArrayList<Integer> getIdad() {
        return idad;
    }

    public ArrayList<Integer> getIdcu() {
        return idcu;
    }

    public ArrayList<Integer> getId() {
        return id;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public void setUadid(int uadid) {
        this.uadid = uadid;
    }

    @Override
    public String execute() throws Exception {

        try {
            Connection conn = Conexion.getConexion();
            String sql = "DELETE from central where idCentral = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.execute();
            conn.close();
            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }

    public String deleteCU() throws Exception {
        try {
            Connection conn = Conexion.getConexion();
            String sql = "DELETE from usuariocentral where idusuariocentral = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cuid);
            ps.execute();
            conn.close();
            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }

    public String deleteAD() throws Exception {
        try {
            //Delete from ad table
            Connection conn = Conexion.getConexion();
            String sql = "DELETE from usuarioad where idusuarioad = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uadid);
            ps.execute();
            //delete relacon from uc_has_uad
            /*String sql2 = "DELETE from usuarioad_has_usuariocentral where fk_idusuarioad = ?";
            ps = conn.prepareStatement(sql2);
            ps.setInt(1, uadid);
            ps.execute();*/
            conn.close();
            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }

    public String deleteAll() throws Exception {
        try {
            //Delete from ad table
            Connection conn = Conexion.getConexion();
            for (int i = 0; i < id.size(); i++) {
                if (!(id.get(i) == null)) {
                    String sql = "DELETE from central where idCentral = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, id.get(i));
                    ps.execute();
                    
                }
            }
            conn.close();
            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }
    public String deleteAllCu() throws Exception {
        try {
            //Delete from ad table
            Connection conn = Conexion.getConexion();
            for (int i = 0; i < idcu.size(); i++) {
                if (!(idcu.get(i) == null)) {
                    String sql = "DELETE from usuariocentral where idUsuarioCentral = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, idcu.get(i));
                    ps.execute();   
                }
            }
            conn.close();
            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }
    public String deleteAllAd() throws Exception {
        try {
            //Delete from ad table
            Connection conn = Conexion.getConexion();
            for (int i = 0; i < idad.size(); i++) {
                if (!(idad.get(i) == null)) {
                    String sql = "DELETE from usuarioad where idUsuarioAd = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, idad.get(i));
                    ps.execute();   
                }
            }
            conn.close();
            return SUCCESS;
        } catch (Exception e) {
            return ERROR;
        }
    }
}
