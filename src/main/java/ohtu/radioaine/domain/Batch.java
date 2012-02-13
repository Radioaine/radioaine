package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import javax.persistence.*;

/**
 * Entity for a batch of products. Used to create table BATCH to database.
 * @author rmjheino
 */
@Entity
public class Batch implements Serializable {

    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false)
    private long id;
    @Column(nullable = false)
    private long batchNumber;
    
    //Number of products in this batch
    private int amount;
    
    //Products of this batch are made of this substance
    private Substance substance;
    private Timestamp arrivalDate;
    private Timestamp expDate;
    private boolean qualityCheck;
    
    //Possible radioactivity
    private double strength;
    private String manufacturer;
    private String supplier;
    private String note;
    
    public Timestamp getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Timestamp arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public Timestamp getExpDate() {
        return expDate;
    }

    public void setExpDate(Timestamp expDate) {
        this.expDate = expDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public long getBatchNumber() {
        return batchNumber;
    }
    
    public long getId() {
        return id;
    }

    public void setBatchNumber(long batchNumber) {
        this.batchNumber = batchNumber;
    }

    public String getManufacturer() {
        return manufacturer;
    }
    
    /**
     * Sets the manufacturer
     * @param manufacturer name of the manufacturer
     */
    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public boolean getQualityCheck() {
        return qualityCheck;
    }

    public void setQualityCheck(boolean qualityCheck) {
        this.qualityCheck = qualityCheck;
    }

    public double getStrength() {
        return strength;
    }

    public void setStrength(double strength) {
        this.strength = strength;
    }

    public Substance getSubstance() {
        return substance;
    }

    public void setSubstance(Substance substance) {
        this.substance = substance;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

//    public Date getUseBefore() {
//        return useBefore;
//    }
//
//    public void setUseBefore(Date useBefore) {
//        this.useBefore = useBefore;
//    }
}
