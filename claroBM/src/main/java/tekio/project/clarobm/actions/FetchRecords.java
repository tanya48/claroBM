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
import tekio.project.clarobm.utils.Conexion;

/**
 *
 * @author Tanya Tapia
 */
public class FetchRecords extends ActionSupport {

    
    ArrayList<Central> list = new ArrayList<Central>();     //ArrayList for centrals
    ArrayList<CentralUser> list2 = new ArrayList<CentralUser>();     //ArrayList for centrals users
    ArrayList<AdUser> list3 = new ArrayList<AdUser>();     //ArrayList for AD users

    public ArrayList<Central> getList() {
        return list;
    }

    public void setList(ArrayList<Central> list) {
        this.list = list;
    }

    public ArrayList<CentralUser> getList2() {
        return list2;
    }

    public void setList2(ArrayList<CentralUser> list2) {
        this.list2 = list2;
    }

    public ArrayList<AdUser> getList3() {
        return list3;
    }

    public void setList3(ArrayList<AdUser> list3) {
        this.list3 = list3;
    }
    

    @Override
    public String execute() throws Exception {
        try {
            Connection con = Conexion.getConexion();
            String centrals = "select c.ipOriginal, c.ipProxy, c.puertoProxy, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd, p.puertoOriginal from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) join puertos p on (c.idCentral = p.fk_idCentral)";
            PreparedStatement ps = con.prepareStatement(centrals);
            ResultSet rs = ps.executeQuery();
            int i = 0;
            while (rs.next() && i < 7) {
                Central central = new Central();
                central.setCip(rs.getString("ipOriginal"));
                central.setPip(rs.getString("ipProxy"));
                central.setPport(rs.getInt("puertoProxy"));
                central.setClli(rs.getString("cd"));
                central.setCtype(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                central.setCports(rs.getInt("puertoOriginal"));
                list.add(central);
                i++;
            }
            
           /* String centralUsers = "select uc.username, c.descripcion from usuariocentral uc join central c on uc.fk_idCentral = c.idCentral";
            ps = con.prepareStatement(centralUsers);
            rs = ps.executeQuery();
            int j = 0;
            while (rs.next() && j < 7) {
                CentralUser cu = new CentralUser();
                cu.setCuname(rs.getString("username"));
                cu.setCuclli(rs.getString("descripcion"));
                list2.add(cu);
                j++;
            }
            
            String adUsers = "select uad.username, c.descripcion from usuarioad uad join usuarioad_has_usuariocentral uu on (uu.fk_idUsuarioAD = uad.idUsuarioAD) join central c on (uu.fk_idCentral = c.idCentral)";
            ps = con.prepareStatement(adUsers);
            rs = ps.executeQuery();
            int k = 0;
            while (rs.next() && k < 8) {
                AdUser adu = new AdUser();
                adu.setUadname(rs.getString("username"));
                adu.setUadclli(rs.getString("descripcion"));
                list3.add(adu);
                k++;
            }*/
            con.close();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }   
    }
    
    public String getUsers(){
        try {
            Connection con = Conexion.getConexion();
            String centralUsers = "select uc.username, c.descripcion from usuariocentral uc join central c on uc.fk_idCentral = c.idCentral";
            PreparedStatement ps = con.prepareStatement(centralUsers);
            ResultSet rs = ps.executeQuery();
            int j = 0;
            while (rs.next() && j < 7) {
                CentralUser cu = new CentralUser();
                cu.setCuname(rs.getString("username"));
                cu.setCuclli(rs.getString("descripcion"));
                list2.add(cu);
                j++;
            }
            
            String adUsers = "select uad.username, c.descripcion from usuarioad uad join usuarioad_has_usuariocentral uu on (uu.fk_idUsuarioAD = uad.idUsuarioAD) join "
                    + "usuariocentral uc on (uc.idusuariocentral = uu.fk_idusuariocentral) join central c on (c.idcentral = uc.fk_idcentral)";
            ps = con.prepareStatement(adUsers);
            rs = ps.executeQuery();
            int k = 0;
            while (rs.next() && k < 8) {
                AdUser adu = new AdUser();
                adu.setUadname(rs.getString("username"));
                adu.setUadclli(rs.getString("descripcion"));
                list3.add(adu);
                k++;
            }
            con.close();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }  
    }

}
