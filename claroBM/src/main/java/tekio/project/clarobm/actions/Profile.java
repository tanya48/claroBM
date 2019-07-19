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
public class Profile {
    private int pid;
    private String pname;
    private ArrayList<Commands> pc = new ArrayList<>();

    public ArrayList<Commands> getPc() {
        return pc;
    }

    public void setPc(ArrayList<Commands> pc) {
        this.pc = pc;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }    

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }
}
