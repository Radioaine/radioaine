/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.domain;

/**
 *
 * @author jahyvone
 */
public class EluateFormObject {

    private Long id;
    // Descripes radioactive strength
    private double strength;
    private int volume;
    private String timestamp;
    private String signature;
    private String note;
    private int storageLocation;
    
    private Batch generator;
    private Batch solvent;

    public Batch getGenerator() {
        return generator;
    }

    public void setGenerator(Batch generator) {
        this.generator = generator;
    }

    public Batch getSolvent() {
        return solvent;
    }

    public void setSolvent(Batch solvent) {
        this.solvent = solvent;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }
    
    
    
}
