package bean;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class ProgramInventory {
    private String ProgramID;
    private String UserID;

    public ProgramInventory() {
    }

    public ProgramInventory(String ProgramID, String UserID) {
        this.ProgramID = ProgramID;
        this.UserID = UserID;
    }
    

    public String getProgramID() {
        return ProgramID;
    }

    public void setProgramID(String ProgramID) {
        this.ProgramID = ProgramID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }
    
    
}
