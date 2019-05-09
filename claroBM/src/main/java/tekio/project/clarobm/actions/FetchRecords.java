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

    ArrayList<Central> listCentrals = new ArrayList<Central>();     //ArrayList for centrals
    ArrayList<Central> listCentralwU = new ArrayList<Central>();     //ArrayList for centrals with central users
    ArrayList<CentralUser> listCentralUsers= new ArrayList<CentralUser>();     //ArrayList for centrals users
    ArrayList<AdUser> listADUsers = new ArrayList<AdUser>();     //ArrayList for AD users
    ArrayList<CentralType> listCentralType = new ArrayList<CentralType>();     //ArrayList for AD users

    public ArrayList<Central> getListCentrals() {
        return listCentrals;
    }

    public void setListCentrals(ArrayList<Central> listCentrals) {
        this.listCentrals = listCentrals;
    }

    public ArrayList<CentralUser> getListCentralUsers() {
        return listCentralUsers;
    }

    public void setListCentralUsers(ArrayList<CentralUser> listCentralUsers) {
        this.listCentralUsers = listCentralUsers;
    }

    public ArrayList<AdUser> getListADUsers() {
        return listADUsers;
    }

    public void setListADUsers(ArrayList<AdUser> listADUsers) {
        this.listADUsers = listADUsers;
    }

    public ArrayList<CentralType> getListCentralType() {
        return listCentralType;
    }

    public void setListCentralType(ArrayList<CentralType> listCentralType) {
        this.listCentralType = listCentralType;
    }

    public ArrayList<Central> getListCentralwU() {
        return listCentralwU;
    }

    public void setListCentralwU(ArrayList<Central> listCentralwU) {
        this.listCentralwU = listCentralwU;
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
                listCentrals.add(central);
                i++;
            }
            String centralUsers = "select * from tipocentral";
            ps = con.prepareStatement(centralUsers);
            rs = ps.executeQuery();
            while (rs.next()) {
                CentralType ct = new CentralType();
                ct.setCtid(rs.getInt("idTipoCentral"));
                ct.setDescripcion(rs.getString("descripcion"));
                ct.setTecnologia(rs.getString("tecnologia"));
                listCentralType.add(ct);
            }
            con.close();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    public String getUsersC() {
        try {
            Connection con = Conexion.getConexion();
            String centralUsers = "select uc.username, c.descripcion as cd, tc.descripcion as tcd, tc.tecnologia from usuariocentral uc join central c on (uc.fk_idCentral = c.idCentral) "
                    + "join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral)";
            PreparedStatement ps = con.prepareStatement(centralUsers);
            ResultSet rs = ps.executeQuery();
            int j = 0;
            while (rs.next() && j < 7) {
                CentralUser cu = new CentralUser();
                cu.setCuname(rs.getString("username"));
                cu.setCuclli(rs.getString("cd"));
                cu.setCuctype(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                listCentralUsers.add(cu);
                j++;
            }
            
            //Central Users select modal
            String centrals = "select c.idCentral, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) group by c.descripcion";
            ps = con.prepareStatement(centrals);
            rs = ps.executeQuery();
            while (rs.next()) {
                Central central = new Central();
                central.setCid(rs.getInt("idCentral"));
                central.setClli(rs.getString("cd"));
                central.setCtype(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                listCentralwU.add(central);
            }

            con.close();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    public String getUsersAD() {
        try {
            Connection con = Conexion.getConexion();
            String adUsers = "select uad.username, c.descripcion from usuarioad uad join usuarioad_has_usuariocentral uu on (uu.fk_idUsuarioAD = uad.idUsuarioAD) join "
                    + "usuariocentral uc on (uc.idusuariocentral = uu.fk_idusuariocentral) join central c on (c.idcentral = uc.fk_idcentral)";
            PreparedStatement ps = con.prepareStatement(adUsers);
            ResultSet rs = ps.executeQuery();
            int k = 0;
            while (rs.next() && k < 8) {
                AdUser adu = new AdUser();
                adu.setUadname(rs.getString("username"));
                adu.setUadclli(rs.getString("descripcion"));
                listADUsers.add(adu);
                k++;
            }
            
//            String centrals = "select c.idCentral, c.puertoProxy, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral)";
//            ps = con.prepareStatement(centrals);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Central central = new Central();
//                central.setCid(rs.getInt("idCentral"));
//                central.setPport(rs.getInt("puertoProxy"));
//                central.setClli(rs.getString("cd"));
//                central.setCtype(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
//                listCentralwU.add(central);
//            }

            con.close();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

//    public String getCentrals() {
//        try {
//            Connection con = Conexion.getConexion();
//            String centralUsers = "select * from tipocentral";
//            PreparedStatement ps = con.prepareStatement(centralUsers);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                CentralType ct = new CentralType();
//                ct.setCtid(rs.getInt("idTipoCentral"));
//                ct.setDescripcion(rs.getString("descripcion"));
//                ct.setTecnologia(rs.getString("tecnologia"));
//                listCentral.add(ct);
//            }
//            con.close();
//            return "success";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "error";
//        }
//    }

}
