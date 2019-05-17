/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.actions;

import java.util.ArrayList;

/**
 *
 * @author Tanya Tapia
 */
public class Central extends CentralType {
    private int cid;        //central ID
    private String cip;     //ip Original
    private String pip;     //ip Proxy
    private int pport;      //pto Proxy
    private String clli;    //descripcion 
    private int  cuid;      //central id for AD modal and data   
    private String cuname;  //central username for AD modal and data
    private int cports;     //central ports //change for list
    private ArrayList<CentralPorts> cp = new ArrayList<>();

    public int getCuid() {
        return cuid;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public ArrayList<CentralPorts> getCp() {
        return cp;
    }

    public void setCp(ArrayList<CentralPorts> cp) {
        this.cp = cp;
    }

    @Override
    public void setFullDescription(String fullDescription) {
        super.setFullDescription(fullDescription); //To change body of generated methods, choose Tools | Templates.
    }
 
    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCip() {
        return cip;
    }

    public void setCip(String cip) {
        this.cip = cip;
    }

    public String getPip() {
        return pip;
    }

    public void setPip(String pip) {
        this.pip = pip;
    }

    public int getPport() {
        return pport;
    }

    public void setPport(int pport) {
        this.pport = pport;
    }

    public String getClli() {
        return clli;
    }

    public void setClli(String clli) {
        this.clli = clli;
    }

    public int getCports() {
        return cports;
    }

    public void setCports(int cports) {
        this.cports = cports;
    }

    public String getCuname() {
        return cuname;
    }

    public void setCuname(String cuname) {
        this.cuname = cuname;
    }
    
    
}
