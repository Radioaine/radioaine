/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.*;

/**
 * Entity for radiomedicine. Extends Product. Used to create table RadioMedicine
 * to DB
 *
 * @author rmjheino
 */
@Entity
public class RadioMedicine implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false)
    private int id;
    @Column
    private double strength;
    @Column
    private int volume;
    @Column
    private Timestamp date;
    @Column
    private String signature;
    @Column
    private String note;
    @Column
    private int storageLocation;
    private String name;
    @Column
    private String preparer;
    @Column
    private int unit;
    @OneToMany
    @JoinColumn(name = "RADIOMEDICINE_ELUATES")
    private List<Eluate> eluates;
    @OneToMany
    @JoinColumn(name = "RADIOMEDICINE_OTHERS")
    private List<Batch> others;
    @OneToMany
    @JoinColumn(name = "RADIOMEDICINE_KITS")
    private List<Batch> kits;

    public List<Eluate> getEluates() {
        return eluates;
    }

    public void setEluates(List<Eluate> eluates) {
        this.eluates = eluates;
    }

    public List<Batch> getKits() {
        return kits;
    }

    public void setKits(List<Batch> kits) {
        this.kits = kits;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public List<Batch> getOthers() {
        return others;
    }

    public void setOthers(List<Batch> others) {
        this.others = others;
    }

    public Timestamp getTimestamp() {
        return date;
    }
    
    public void setTimestamp(Timestamp timestamp) {
        this.date = timestamp;
    }

    public int getStorageLocation() {
        return storageLocation;
    }

    public void setStorageLocation(int storageLocation) {
        this.storageLocation = storageLocation;
    }

    public double getStrength() {
        return strength;
    }

    public void setStrength(double strength) {
        this.strength = strength;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp timestamp) {
        this.date = timestamp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }
    
        /**
     * Unit used to measure strength
     * @return unit 0 = GBq, 1 = MBq
     */
    public int getUnit() {
        return unit;
    }

    /**
     * Unit used to measure strength
     * @param unit: 0 = GBq, 1 = MBq
     */
    public void setUnit(int unit) {
        this.unit = unit;
    }
    
}