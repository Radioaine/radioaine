package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import javax.persistence.*;

/**
 * Entity for a batch of products. Used to create table BATCH to database.
 * @author radioaine
 */
@Entity
public class Batch implements Serializable {

    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private int id;
    @Column(nullable = false)
    private String batchNumber;
    @Column
    private int amount;
    @Column
    private int substanceVolume;

    //Products of this batch are made of this substance
    @ManyToOne
    private Substance substance;
    private Timestamp arrivalDate;
    private Timestamp expDate;
    private boolean qualityCheck;
    
    //Possible radioactivity
    private double strength;
    private String manufacturer;
    private String supplier;
    private String note;
    private int[][] storageLocations = new int[10][2];

    public int[][] getStorageLocations() {
        return storageLocations;
    }

    public void setStorageLocations(int[][] storageLocations) {
        this.storageLocations = storageLocations;
    }
    
    public int getSubstanceVolume() {
        return substanceVolume;
    }

    public void setSubstanceVolume(int substanceVolume) {
        this.substanceVolume = substanceVolume;
    }
    
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
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

    public String getBatchNumber() {
        return batchNumber;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public void setBatchNumber(String batchNumber) {
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

    @Override
    public String toString() {
        return "Batch{" + "id=" + id + ", batchNumber=" + batchNumber + ", amount=" + amount + ", substanceVolume=" + substanceVolume + ", substance=" + substance + ", arrivalDate=" + arrivalDate + ", expDate=" + expDate + ", qualityCheck=" + qualityCheck + ", strength=" + strength + ", manufacturer=" + manufacturer + ", supplier=" + supplier + ", note=" + note + '}';
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
}
