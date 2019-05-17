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
public class AdUser extends Central {
    private int uadid;      // AD id
    private String uadname; // AD username
    
    @Override
    public void setCuname(String cuname) {
        super.setCuname(cuname); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setClli(String clli) {
        super.setClli(clli); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setFullDescription(String fullDescription) {
        super.setFullDescription(fullDescription); //To change body of generated methods, choose Tools | Templates.
    }
    
   
    public int getUadid() {
        return uadid;
    }

    public void setUadid(int uadid) {
        this.uadid = uadid;
    }

    

    public String getUadname() {
        return uadname;
    }

    public void setUadname(String uadname) {
        this.uadname = uadname;
    }
    
}
