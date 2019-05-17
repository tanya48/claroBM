/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.actions;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Map;
import tekio.project.clarobm.utils.Conexion;

/**
 *
 * @author Tanya Tapia
 */
public class DeleteRecords extends ActionSupport {
    
    private int cid;
    private int cuid;
    private int uadid;
    private int ccid;

    public int getCcid() {
        return ccid;
    }

    public void setCcid(int ccid) {
        this.ccid = ccid;
    }
//    private Map<Integer, Boolean> options;
//
//    public Map<Integer, Boolean> getOptions() {
//        return options;
//    }
//
//    public void setOptions(Map<Integer, Boolean> options) {
//        this.options = options;
//    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getCuid() {
        return cuid;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public int getUadid() {
        return uadid;
    }

    public void setUadid(int uadid) {
        this.uadid = uadid;
    }
    
    @Override
    public String execute() throws Exception {
        
        try{
            Connection conn = Conexion.getConexion();
            String sql = "DELETE from central where idCentral = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.execute();
            conn.close();
            return SUCCESS;
        }catch(Exception e){
            return ERROR;
        }
    }
    
    public String deleteCU()
    {
        try{
            Connection conn = Conexion.getConexion();
            String sql = "DELETE from usuariocentral where idusuariocentral = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cuid);
            ps.execute();
            conn.close();
            return SUCCESS;
        }catch(Exception e){
            return ERROR;
        }
    }
    public String deleteAD()
    {
        try{
            //Delete from ad table
            Connection conn = Conexion.getConexion();
            String sql = "DELETE from usuarioad where idusuarioad = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uadid);
            ps.execute();
            //delete relacon from uc_has_uad
            String sql2 = "DELETE from usuarioad_has_usuariocentral where fk_idusuarioad = ?";
            ps = conn.prepareStatement(sql2);
            ps.setInt(1, uadid);
            ps.execute();
            conn.close();
            return SUCCESS;
        }catch(Exception e){
            return ERROR;
        }
    }
    public String deleteAll()
    {
        try{
            //Delete from ad table
            //System.out.println(ccid);
//            Connection conn = Conexion.getConexion();
//            String sql = "DELETE from usuarioad where idusuarioad = ?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, uadid);
//            ps.execute();
//            //delete relacon from uc_has_uad
//            String sql2 = "DELETE from usuarioad_has_usuariocentral where fk_idusuarioad = ?";
//            ps = conn.prepareStatement(sql2);
//            ps.setInt(1, uadid);
//            ps.execute();
//            conn.close();
            return SUCCESS;
        }catch(Exception e){
            return ERROR;
        }
    }
}
