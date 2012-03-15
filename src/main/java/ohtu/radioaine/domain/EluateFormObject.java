package ohtu.radioaine.domain;

public class EluateFormObject {

    private double strength;
    private int volume;
    private String date;
    private String hours;
    private String minutes;
    private String signature;
    private String note;
    private int storageLocation;
    private int generators;
    private int solvents;
    private int kits;

    public int getKits() {
        return kits;
    }

    public void setKits(int kits) {
        this.kits = kits;
    }

    public int getGenerators() {
        return generators;
    }

    public void setGenerators(int generators) {
        this.generators = generators;
    }

    public int getSolvents() {
        return solvents;
    }

    public void setSolvents(int solvent) {
        this.solvents = solvent;
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

    public String getDate() {
        return date;
    }

    public void setDate(String timestamp) {
        this.date = timestamp;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getMinutes() {
        return minutes;
    }

    public void setMinutes(String minutes) {
        this.minutes = minutes;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }
}
