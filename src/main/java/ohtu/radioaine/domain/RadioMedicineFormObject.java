package ohtu.radioaine.domain;

public class RadioMedicineFormObject {

    private Long id;
    private double strength;
    private int volume;
    private String date;
    private String hours;
    private String minutes;
    private String signature;
    private String note;
    private int storageLocation;
    private String name;
    private String preparer;
    private int eluate;
    private int solvent;
    private int kit;

    public int getEluates() {
        return eluate;
    }

    public void setEluates(int eluate) {
        this.eluate = eluate;
    }

    public int getKits() {
        return kit;
    }

    public void setKits(int kit) {
        this.kit = kit;
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

    public int getSolvent() {
        return solvent;
    }

    public void setSolvent(int solvent) {
        this.solvent = solvent;
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

    public void setDate(String date) {
        this.date = date;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPreparer() {
        return preparer;
    }

    public void setPreparer(String preparer) {
        this.preparer = preparer;
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
