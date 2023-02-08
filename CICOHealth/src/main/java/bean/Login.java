/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@Entity
@Table(name = "login")
@NamedQueries({
    @NamedQuery(name = "Login.findAll", query = "SELECT l FROM Login l"),
    @NamedQuery(name = "Login.findByUserID", query = "SELECT l FROM Login l WHERE l.userID = :userID"),
    @NamedQuery(name = "Login.findByUsername", query = "SELECT l FROM Login l WHERE l.username = :username"),
    @NamedQuery(name = "Login.findByPasswordHash", query = "SELECT l FROM Login l WHERE l.passwordHash = :passwordHash"),
    @NamedQuery(name = "Login.findByPasswordSalt", query = "SELECT l FROM Login l WHERE l.passwordSalt = :passwordSalt"),
    @NamedQuery(name = "Login.findByIsGoogleLogin", query = "SELECT l FROM Login l WHERE l.isGoogleLogin = :isGoogleLogin"),
    @NamedQuery(name = "Login.findByIsBanned", query = "SELECT l FROM Login l WHERE l.isBanned = :isBanned")})
public class Login implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "userID")
    private String userID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "passwordHash")
    private String passwordHash;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "passwordSalt")
    private String passwordSalt;
    @Basic(optional = false)
    @NotNull
    @Column(name = "isGoogleLogin")
    private boolean isGoogleLogin;
    @Basic(optional = false)
    @NotNull
    @Column(name = "isBanned")
    private boolean isBanned;
    @JoinColumn(name = "userID", referencedColumnName = "userID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private User user;

    public Login() {
    }

    public Login(String userID) {
        this.userID = userID;
    }

    public Login(String userID, String username, String passwordHash, String passwordSalt, boolean isGoogleLogin, boolean isBanned) {
        this.userID = userID;
        this.username = username;
        this.passwordHash = passwordHash;
        this.passwordSalt = passwordSalt;
        this.isGoogleLogin = isGoogleLogin;
        this.isBanned = isBanned;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getPasswordSalt() {
        return passwordSalt;
    }

    public void setPasswordSalt(String passwordSalt) {
        this.passwordSalt = passwordSalt;
    }

    public boolean getIsGoogleLogin() {
        return isGoogleLogin;
    }

    public void setIsGoogleLogin(boolean isGoogleLogin) {
        this.isGoogleLogin = isGoogleLogin;
    }

    public boolean getIsBanned() {
        return isBanned;
    }

    public void setIsBanned(boolean isBanned) {
        this.isBanned = isBanned;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userID != null ? userID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Login)) {
            return false;
        }
        Login other = (Login) object;
        if ((this.userID == null && other.userID != null) || (this.userID != null && !this.userID.equals(other.userID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.Login[ userID=" + userID + " ]";
    }
    
}
