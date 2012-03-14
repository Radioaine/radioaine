/*
 * 
 */
package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.*;

/**
 * Entity for eluate. Used to create table Eluate to DB. Extends Product
 *
 * @author rmjheino
 */
@Entity
public class Eluate implements Serializable{

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
    @Column
    private String preparer;
    @OneToMany
    private List<Batch> generators;
    @OneToMany
    private List<Batch> solvents;

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public int getStorageLocation() {
        return storageLocation;
    }

    public void setStorageLocation(int storageLocation) {
        this.storageLocation = storageLocation;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }

    public List<Batch> getGenerators() {
        return generators;
    }

    public void setGenerators(List<Batch> generators) {
        this.generators = generators;
    }

    public List<Batch> getSolvents() {
        return solvents;
    }

    public void setSolvents(List<Batch> solvents) {
        this.solvents = solvents;
    }

    public String getsignature() {
        return signature;
    }

    public void setsignature(String signature) {
        this.signature = signature;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
}
