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
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(nullable = false)
    private Long id;
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
    @Column(nullable = false)
    private String name;
    @Column
    private String preparer;
    @OneToMany
    private List<Eluate> eluates;
    @OneToMany
    private List<Batch> solvents;
    @OneToMany
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

    public List<Batch> getSolvents() {
        return solvents;
    }

    public void setSolvents(List<Batch> solvents) {
        this.solvents = solvents;
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

    public Timestamp getTimestamp() {
        return date;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.date = timestamp;
    }

    public long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }
}