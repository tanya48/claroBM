/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import tekio.project.clarobm.utils.Conexion;

/**
 *
 * @author Tanya Tapia
 */
public class FetchRecords extends ActionSupport {

    private ArrayList<Central> listCentrals = new ArrayList<>();            //ArrayList for centrals
    private ArrayList<Central> listCentralwT = new ArrayList<>();           //ArrayList for centrals with central type
    private ArrayList<Central> listCentralwU = new ArrayList<>();           //ArrayList for centrals with central users
    private ArrayList<CentralUser> listCentralUsers = new ArrayList<>();    //ArrayList for centrals users
    private ArrayList<AdUser> listADUsers = new ArrayList<>();              //ArrayList for AD users
    private ArrayList<CentralType> listCentralType = new ArrayList<>();     //ArrayList for AD users
    private ArrayList<CentralPorts> cp = new ArrayList<>();                 //ArrayList for central ports
    private ArrayList<CentralPorts> cp2 = new ArrayList<>();                 //ArrayList for central ports UPDATE
    private int cid;                                                        //For central Update
    private Central centralU;                                               //For central Update
    private int cuid;                                                       //For central user Update
    private CentralUser centralUser;                                        //For central user Update
    private int uadid;                                                      //For ad user Update
    private AdUser adUser;                                                  //For ad user Update

   // Map<String,Object> session = ActionContext.getContext().getSession();
    public ArrayList<CentralPorts> getCp() {
        return cp;
    }

    public ArrayList<CentralPorts> getCp2() {
        return cp2;
    }

    public void setUadid(int uadid) {
        this.uadid = uadid;
    }

    public AdUser getAdUser() {
        return adUser;
    }

    public CentralUser getCentralUser() {
        return centralUser;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public Central getCentralU() {
        return centralU;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public ArrayList<Central> getListCentrals() {
        return listCentrals;
    }

    public ArrayList<CentralUser> getListCentralUsers() {
        return listCentralUsers;
    }

    public ArrayList<AdUser> getListADUsers() {
        return listADUsers;
    }

    public ArrayList<CentralType> getListCentralType() {
        return listCentralType;
    }

    public ArrayList<Central> getListCentralwU() {
        return listCentralwU;
    }

    public ArrayList<Central> getListCentralwT() {
        return listCentralwT;
    }

    @Override
    public String execute() throws Exception {
            try {
                // System.out.println(":"+session.get("username"));
                Connection con = Conexion.getConexion();
                String centrals = "select c.ipOriginal, c.ipProxy, c.puertoProxy, c.idCentral, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd, p.puertoOriginal from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) join puertos p on (c.idCentral = p.fk_idCentral) group by c.puertoProxy";
                PreparedStatement ps = con.prepareStatement(centrals);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String ports = "select puertoOriginal from puertos p where fk_idCentral = ?";
                    PreparedStatement pss = con.prepareStatement(ports);
                    pss.setInt(1, rs.getInt("idCentral"));
                    ResultSet rss = pss.executeQuery();
                    cp = new ArrayList<>();
                    while (rss.next()) {
                        CentralPorts cpp = new CentralPorts();
                        cpp.setCport(rss.getInt("puertoOriginal"));
                        cp.add(cpp);
                    }
                    Central central = new Central();
                    central.setCid(rs.getInt("idCentral"));
                    central.setCip(rs.getString("ipOriginal"));
                    central.setPip(rs.getString("ipProxy"));
                    central.setPport(rs.getInt("puertoProxy"));
                    central.setClli(rs.getString("cd"));
                    central.setFullDescription(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                    central.setCp(cp);
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

    public String getCentralA() throws Exception {
        try {
            Connection con = Conexion.getConexion();
            String centrals = "select c.ipOriginal, c.ipProxy, c.puertoProxy, c.idCentral, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd, p.puertoOriginal from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) join puertos p on (c.idCentral = p.fk_idCentral) where c.idCentral = ?";
            PreparedStatement ps = con.prepareStatement(centrals);
            //System.out.println("HOLAAA " + cid);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String ports = "select puertoOriginal from puertos p where fk_idCentral = ?";
                PreparedStatement pss = con.prepareStatement(ports);
                pss.setInt(1, cid);
                ResultSet rss = pss.executeQuery();
                cp = new ArrayList<>();
                while (rss.next()) {
                    CentralPorts cpp = new CentralPorts();
                    cpp.setCport(rss.getInt("puertoOriginal"));
                    cp.add(cpp);
                }
                centralU = new Central();
                centralU.setCid(rs.getInt("idCentral"));
                centralU.setCip(rs.getString("ipOriginal"));
                centralU.setPip(rs.getString("ipProxy"));
                centralU.setPport(rs.getInt("puertoProxy"));
                centralU.setClli(rs.getString("cd"));
                centralU.setFullDescription(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
                centralU.setCp(cp);
                cp2 = cp;
                //System.out.println(cp2.size());
                centralU.setCp2(cp2);
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

    public String getUsersC() throws Exception {
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

    public String getCUA() throws Exception {
        try {
            //Central users data table
            Connection con = Conexion.getConexion();
            String centralUsers = "select uc.idusuariocentral, uc.username, c.descripcion as cd, tc.descripcion as tcd, tc.tecnologia from usuariocentral uc join central c on (uc.fk_idCentral = c.idCentral) "
                    + "join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) where uc.idusuariocentral = ?";
            PreparedStatement ps = con.prepareStatement(centralUsers);
            ps.setInt(1, cuid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                centralUser = new CentralUser();
                centralUser.setCuid(rs.getInt("idusuariocentral"));
                centralUser.setCuname(rs.getString("username"));
                centralUser.setClli(rs.getString("cd"));
                centralUser.setFullDescription(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
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
        //return SUCCESS;
    }

    public String getUsersAD() throws Exception {
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
            String centrals = "select c.idCentral, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd, uc.idUsuarioCentral, uc.username from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) join usuariocentral uc on (uc.fk_idcentral = c.idcentral) group by uc.idUsuarioCentral";
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

    public String getADA() throws Exception {
        try {
            //Ad users data table
            Connection con = Conexion.getConexion();
            String adUsers = "select uad.idusuarioad, uad.username as un, uc.username as udn, c.descripcion as cd, tc.descripcion as tcd, tc.tecnologia from usuarioad uad join usuarioad_has_usuariocentral uu on (uu.fk_idUsuarioAD = uad.idUsuarioAD) join "
                    + "usuariocentral uc on (uc.idusuariocentral = uu.fk_idusuariocentral) join central c on (c.idcentral = uc.fk_idcentral) join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) where uad.idusuarioad = ? ";
            PreparedStatement ps = con.prepareStatement(adUsers);
            ps.setInt(1, uadid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                adUser = new AdUser();
                adUser.setUadid(rs.getInt("idusuarioad"));
                adUser.setUadname(rs.getString("un"));
                adUser.setCuname(rs.getString("udn"));
                adUser.setClli(rs.getString("cd"));
                adUser.setFullDescription(rs.getString("tecnologia").concat(" ").concat(rs.getString("tcd")));
            }

            //AD Users select modal (Central + central users)
            String centrals = "select c.idCentral, c.descripcion as cd, tc.tecnologia, tc.descripcion as tcd, uc.idUsuarioCentral, uc.username from central c join tipocentral tc on (c.fk_idTipoCentral = tc.idTipoCentral) join usuariocentral uc on (uc.fk_idcentral = c.idcentral) group by uc.idUsuarioCentral";
            ps = con.prepareStatement(centrals);
            rs = ps.executeQuery();
            while (rs.next()) {
                Central central = new Central();
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
