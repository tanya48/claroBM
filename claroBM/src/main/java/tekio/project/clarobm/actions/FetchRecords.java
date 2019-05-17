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
    ArrayList<Central> listCentralwT = new ArrayList<Central>();     //ArrayList for centrals with central type
    ArrayList<Central> listCentralwU = new ArrayList<Central>();     //ArrayList for centrals with central users
    ArrayList<CentralUser> listCentralUsers= new ArrayList<CentralUser>();     //ArrayList for centrals users
    ArrayList<AdUser> listADUsers = new ArrayList<AdUser>();     //ArrayList for AD users
    ArrayList<CentralType> listCentralType = new ArrayList<CentralType>();     //ArrayList for AD users
    ArrayList<CentralPorts> listCentralPorts;     //ArrayList for AD users
    

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

    public ArrayList<Central> getListCentralwT() {
        return listCentralwT;
    }

    public void setListCentralwT(ArrayList<Central> listCentralwT) {
        this.listCentralwT = listCentralwT;
    }

    public ArrayList<CentralPorts> getListCentralPorts() {
        return listCentralPorts;
    }

    public void setListCentralPorts(ArrayList<CentralPorts> listCentralPorts) {
        this.listCentralPorts = listCentralPorts;
    }
       
    
    
    @Override
    public String execute() throws Exception {
        try {
            Connection con = Conexion.getConexion();
            String centrals = "select c.ipOriginal, c.ipProxy, c.puertoProxy, c.idCentral, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd, p.puertoOriginal from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) join puertos p on (c.idCentral = p.fk_idCentral)";
            PreparedStatement ps = con.prepareStatement(centrals);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String ports = "select puertoOriginal from puertos p where fk_idCentral = ?";
                PreparedStatement pss = con.prepareStatement(ports);
                pss.setInt(1, rs.getInt("idCentral"));
                ResultSet rss = pss.executeQuery();
                System.out.println("-------");
                while(rss.next())
                {
                    listCentralPorts = new ArrayList<CentralPorts>(); 
                    CentralPorts cpp = new CentralPorts();
                    cpp.setCport(rss.getInt("puertoOriginal"));
                    System.out.println(rss.getInt("puertoOriginal"));
                    listCentralPorts.add(cpp);
                    
                }
                
                Central central = new Central();
                central.setCid(rs.getInt("idCentral"));
                central.setCip(rs.getString("ipOriginal"));
                central.setPip(rs.getString("ipProxy"));
                central.setPport(rs.getInt("puertoProxy"));
                central.setClli(rs.getString("cd"));
                central.setFullDescription(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                central.setCports(rs.getInt("puertoOriginal"));
                central.setCp(listCentralPorts);
                listCentrals.add(central);
            }
            
            //Central type modal
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
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String getUsersC() {
        try {
            //Central users data table
            Connection con = Conexion.getConexion();
            String centralUsers = "select uc.idusuariocentral, uc.username, c.descripcion as cd, tc.descripcion as tcd, tc.tecnologia from usuariocentral uc join central c on (uc.fk_idCentral = c.idCentral) "
                    + "join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral)";
            PreparedStatement ps = con.prepareStatement(centralUsers);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CentralUser cu = new CentralUser();
                cu.setCuid(rs.getInt("idusuariocentral"));
                cu.setCuname(rs.getString("username"));
                cu.setClli(rs.getString("cd"));
                cu.setFullDescription(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                listCentralUsers.add(cu);
            }
            
            //Central Users select modal (Central + central type)
            String centrals = "select c.idCentral, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) group by c.descripcion";
            ps = con.prepareStatement(centrals);
            rs = ps.executeQuery();
            while (rs.next()) {
                Central central = new Central();
                central.setCid(rs.getInt("idCentral"));
                central.setClli(rs.getString("cd"));
                central.setFullDescription(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                listCentralwT.add(central);
            }
            con.close();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
    public String getUsersAD() {
        try {
            //Ad users data table
            Connection con = Conexion.getConexion();
            String adUsers = "select uad.idusuarioad, uad.username as un, uc.username as udn, c.descripcion as cd, tc.descripcion as tcd, tc.tecnologia from usuarioad uad join usuarioad_has_usuariocentral uu on (uu.fk_idUsuarioAD = uad.idUsuarioAD) join "
                    + "usuariocentral uc on (uc.idusuariocentral = uu.fk_idusuariocentral) join central c on (c.idcentral = uc.fk_idcentral) join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral)";
            PreparedStatement ps = con.prepareStatement(adUsers);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AdUser adu = new AdUser();
                adu.setUadid(rs.getInt("idusuarioad"));
                adu.setUadname(rs.getString("un"));
                adu.setCuname(rs.getString("udn"));
                adu.setClli(rs.getString("cd"));
                adu.setFullDescription(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                listADUsers.add(adu);
            }
            
            //AD Users select modal (Central + central users)
            String centrals = "select c.idCentral, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd, uc.idUsuarioCentral, uc.username from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) join usuariocentral uc on (uc.fk_idcentral = c.idcentral) group by uc.username";
            ps = con.prepareStatement(centrals);
            rs = ps.executeQuery();
            while (rs.next()) {
                Central central = new Central();
                //central.setCid(rs.getInt("idCentral"));
                central.setCuid(rs.getInt("idUsuarioCentral"));
                central.setCuname(rs.getString("username"));
                central.setClli(rs.getString("cd"));
                central.setFullDescription(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                listCentralwU.add(central);
            }
            con.close();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

}
