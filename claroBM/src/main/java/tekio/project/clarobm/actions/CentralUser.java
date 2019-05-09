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
public class CentralUser {
    private int cuid;       //central user id
    private String cuname;  //central user username
    private String cuclli;  // central user description
    private String cuctype; //central user central type
    //Central central = new Central();

    public int getCuid() {
        return cuid;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public String getCuname() {
        return cuname;
    }

    public void setCuname(String cuname) {
        this.cuname = cuname;
    }

    public String getCuclli() {
        return cuclli;
    }

    public void setCuclli(String cuclli) {
        this.cuclli = cuclli;
    }

    public String getCuctype() {
        return cuctype;
    }

    public void setCuctype(String cuctype) {
        this.cuctype = cuctype;
    }
    
    
    

    /*public Central getCentral() {
        return central;
    }

    public void setCentral(Central central) {
        this.central = central;
    }  */  

}
