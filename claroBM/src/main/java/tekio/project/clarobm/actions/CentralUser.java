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
public class CentralUser extends Central {
    private int cuid;       //central user id
    private String cuname;  //central user username
    
    @Override
    public void setClli(String clli) {
        super.setClli(clli); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setFullDescription(String fullDescription) {
        super.setFullDescription(fullDescription); //To change body of generated methods, choose Tools | Templates.
    }
    
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
    
}
