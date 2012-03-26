package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.*;

/**
 * Entity for a batch of products. Used to create table BATCH to database.
 *
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
    @ManyToOne
    private Eluate eluate;
    private Timestamp arrivalDate;
    private Timestamp expDate;
    private int qualityCheck;
    private String signature;
    private double strength;
    private String manufacturer;
    private String supplier;
    private String note;
    private int storageLocationsCount = 10;
    private int[][] storageLocations = new int[storageLocationsCount][2];
    private int status;
    
//    @ManyToOne
//    private List<Storage> storages;
//
//    public List<Storage> getStorages() {
//        return storages;
//    }
//
//    public void setStorages(List<Storage> storages) {
//        this.storages = storages;
//    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public Eluate getEluate() {
        return eluate;
    }

    public void setEluate(Eluate eluate) {
        this.eluate = eluate;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public int[][] getStorageLocations() {
        return storageLocations;
    }

    public void setStorageLocations(int[][] storageLocations) {
        this.storageLocations = storageLocations;
    }

    public int getStorageLocationsCount() {
        return storageLocationsCount;
    }

    public void setStorageLocationsCount(int storageLocationsCount) {
        this.storageLocationsCount = storageLocationsCount;
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

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getQualityCheck() {
        return qualityCheck;
    }

    public void setQualityCheck(int qualityCheck) {
        this.qualityCheck = qualityCheck;
    }

    public double getStrength() {
        return strength;
    }

    public void setStrength(double strength) {
        this.strength = strength;
    }

    public String toStringDB() {
        return "Batch" + "id=" + id + " batchNumber=" + batchNumber + " amount=" + amount + " substanceVolume=" + substanceVolume + " substance=" + substance.getName() + " arrivalDate=" + arrivalDate + " expDate=" + expDate + " qualityCheck=" + qualityCheck + " strength=" + strength + " manufacturer=" + manufacturer + " supplier=" + supplier + " note=" + note;
    }

    public String toStringShow() {
        return "eränumero = " + batchNumber + " määrä = " + amount + " aine = " + substance.getName() + " saapumispvm = " + arrivalDate + " vanhenemispvm = " + expDate + " radioaktiivisuus = " + strength + " valmistaja = " + manufacturer + " toimittaja = " + supplier + " kommentit = " + note;
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

    public int getCurrentStorageLocationsCount() {
        int temp = 0;
        for (int i = 0; i < storageLocations.length; i++) {
            if (storageLocations[i][1] > 0) {
                temp++;
            }
        }
        return temp;
    }
    
    public void useOne(){
        amount--;
    }
}
