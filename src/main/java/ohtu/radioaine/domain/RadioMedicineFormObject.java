package ohtu.radioaine.domain;

import javax.validation.constraints.NotNull;

public class RadioMedicineFormObject {


    @NotNull(message = "Aktiivisuus ei saa olla tyhjä")
    private String strength;
    private int unit;
    @NotNull(message = "Tilavuus ei saa olla tyhjä")
    private String volume;
    @NotNull(message = "Päiväys ei saa olla tyhjä")
    private String date;
    @NotNull(message = "Tunnit ei saa olla tyhjä")
    private String hours;
    @NotNull(message = "Eränumero ei saa olla tyhjä")
    private String minutes;
    @NotNull(message = "Nimi ei saa olla tyhjä")
    private String signature;
    private String note;
    private Long storageLocation;
    private String name;
    private String preparer;
    private Long[] eluates = new Long[5];
    private Long[] others = new Long[5];
    private Long[] kits = new Long[5];

    public Long[] getEluates() {
        return eluates;
    }

    public void setEluates(Long[] eluates) {
        this.eluates = eluates;
    }

    public Long[] getKits() {
        return kits;
    }

    public void setKits(Long[] kits) {
        this.kits = kits;
    }

    public Long[] getOthers() {
        return others;
    }

    public void setOthers(Long[] others) {
        this.others = others;
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

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume.replaceAll(",", ".");
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
