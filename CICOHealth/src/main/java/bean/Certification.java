/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
@Entity
@Table(name = "certification")
@NamedQueries({
    @NamedQuery(name = "Certification.findAll", query = "SELECT c FROM Certification c")})
public class Certification implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "certID")
    private String certID;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "certName")
    private String certName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "certIssuer")
    private String certIssuer;
    @Basic(optional = false)
    @NotNull
    @Column(name = "certDate")
    @Temporal(TemporalType.DATE)
    private Date certDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "certPhoto")
    private String certPhoto;
    @JoinColumn(name = "userID", referencedColumnName = "userID")
    @ManyToOne(optional = false)
    private String userID;

    public Certification() {
    }

    public Certification(String certID) {
        this.certID = certID;
    }

    public Certification(String certID, String certName, String certIssuer, Date certDate, String certPhoto) {
        this.certID = certID;
        this.certName = certName;
        this.certIssuer = certIssuer;
        this.certDate = certDate;
        this.certPhoto = certPhoto;
    }

    public String getCertID() {
        return certID;
    }

    public void setCertID(String certID) {
        this.certID = certID;
    }

    public String getCertName() {
        return certName;
    }

    public void setCertName(String certName) {
        this.certName = certName;
    }

    public String getCertIssuer() {
        return certIssuer;
    }

    public void setCertIssuer(String certIssuer) {
        this.certIssuer = certIssuer;
    }

    public Date getCertDate() {
        return certDate;
    }

    public void setCertDate(Date certDate) {
        this.certDate = certDate;
    }

    public String getCertPhoto() {
        return certPhoto;
    }

    public void setCertPhoto(String certPhoto) {
        this.certPhoto = certPhoto;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (certID != null ? certID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Certification)) {
            return false;
        }
        Certification other = (Certification) object;
        if ((this.certID == null && other.certID != null) || (this.certID != null && !this.certID.equals(other.certID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.Certification[ certID=" + certID + " ]";
    }
    
}
