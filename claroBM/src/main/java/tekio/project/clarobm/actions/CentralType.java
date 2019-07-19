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
public class CentralType extends Profile {
    
    private int ctid;
    private String descripcion;
    private String tecnologia;
    private String fullDescription;

    @Override
    public String getPname() {
        return super.getPname(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setPname(String pname) {
        super.setPname(pname); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String getFullDescription() {
        return fullDescription;
    }

    public void setFullDescription(String fullDescription) {
        this.fullDescription = fullDescription;
    }

    public int getCtid() {
        return ctid;
    }

    public void setCtid(int ctid) {
        this.ctid = ctid;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTecnologia() {
        return tecnologia;
    }

    public void setTecnologia(String tecnologia) {
        this.tecnologia = tecnologia;
    }  
    
}
