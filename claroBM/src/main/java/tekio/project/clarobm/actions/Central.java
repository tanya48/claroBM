/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.actions;

/**
 *
 * @author Tanya Tapia
 */
public class Central {
    private int cid;        //central ID
    private String ctype;   //central type
    private String cip;     //ip Original
    private String pip;     //ip Proxy
    private int pport;      //pto Proxy
    private String clli;    //descripcion   
    private int cports;     //central ports //change for list

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

    public String getCtype() {
        return ctype;
    }

    public void setCtype(String ctype) {
        this.ctype = ctype;
    }

    public int getCports() {
        return cports;
    }

    public void setCports(int cports) {
        this.cports = cports;
    }
    
}
