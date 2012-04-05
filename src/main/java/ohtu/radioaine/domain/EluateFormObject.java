package ohtu.radioaine.domain;

import javax.validation.constraints.NotNull;

public class EluateFormObject {

    @NotNull(message = "Aktiivisuus ei saa olla tyhjä")
    private String strength;
    @NotNull(message = "Tilavuus ei saa olla tyhjä")
    private int volume;
    @NotNull(message = "Päivämäärä ei saa olla tyhjä")
    private String date;
    @NotNull(message = "Tuntikenttä ei saa olla tyhjä")
    private String hours;
    @NotNull(message = "Minuuttikenttä ei saa olla tyhjä")
    private String minutes;
    @NotNull(message = "Nimi ei saa olla tyhjä")
    private String signature;
    private String note;
    private int unit;
    private Long storageLocation;
    private Long[] generators = new Long[5];
    private Long[] others = new Long[5];
    private Long[] kits = new Long[5];

    public Long[] getKits() {
        return kits;
    }

    public void setKits(Long[] kits) {
        this.kits = kits;
    }

    public Long[] getGenerators() {
        return generators;
    }

    public void setGenerators(Long[] generators) {
        this.generators = generators;
    }

    public Long[] getOthers() {
        return others;
    }

    public void setOthers(Long[] other) {
        this.others = other;
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

    public Long getStorageLocation() {
        return storageLocation;
    }

    public void setStorageLocation(Long storageLocation) {
        this.storageLocation = storageLocation;
    }

    public String getStrength() {
        return strength;
    }

    public void setStrength(String strength) {
        this.strength = strength.replaceAll(",", ".");
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
