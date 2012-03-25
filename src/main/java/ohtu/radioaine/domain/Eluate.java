package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.*;

/**
 * Entity for eluate. Used to create table Eluate to DB.
 *
 * @author rmjheino
 */
@Entity
public class Eluate implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
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
    @OneToMany
    @JoinColumn(name = "ELUATE_GENERATORS")
    private List<Batch> generators;
    @OneToMany
    @JoinColumn(name = "ELUATE_OTHERS")
    private List<Batch> others;
//    @OneToMany
//    @JoinColumn(name = "ELUATE_KITS")
//    private List<Batch> kits;

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

//    public List<Batch> getKits() {
//        return kits;
//    }
//
//    public void setKits(List<Batch> kits) {
//        this.kits = kits;
//    }

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

    public List<Batch> getOthers() {
        return others;
    }

    public void setOthers(List<Batch> other) {
        this.others = other;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
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
