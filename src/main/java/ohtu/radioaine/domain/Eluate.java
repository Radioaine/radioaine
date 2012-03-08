/*
 * 
 */

package ohtu.radioaine.domain;

import javax.persistence.*;

/**
 * Entity for eluate. Used to create table Eluate to DB. Extends Product
 * @author rmjheino
 */
@Entity
public class Eluate extends Product {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(nullable = false)
    private Long id;
    // Descripes radioactive strength
    private double strength;
    private double activity;
    private String creator;
    private String note;
    private int[][] storageLocations = new int[10][2];
    
    @OneToOne
    private Substance generator;
    @OneToOne
    private Substance solvent;

    public Substance getGenerator() {
        return generator;
    }

    public void setGenerator(Substance generator) {
        this.generator = generator;
    }

    public Substance getSolvent() {
        return solvent;
    }

    public void setSolvent(Substance solvent) {
        this.solvent = solvent;
    }
    
    public double getActivity() {
        return activity;
    }

    public void setActivity(double activity) {
        this.activity = activity;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int[][] getStorageLocations() {
        return storageLocations;
    }

    public void setStorageLocations(int[][] storageLocations) {
        this.storageLocations = storageLocations;
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

}
