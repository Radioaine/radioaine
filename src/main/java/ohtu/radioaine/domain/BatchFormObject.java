package ohtu.radioaine.domain;

import java.util.Date;
import javax.validation.constraints.NotNull;

public class BatchFormObject {

    @NotNull(message = "Eränumero ei saa olla tyhjä")
    private int batchNumber;
    @NotNull(message = "Aine ei saa olla tyhjä")
    private int substance;
    @NotNull(message = "Määrä ei saa olla tyhjä")
    private int amount;
    @NotNull(message = "Saapumispäivä ei saa olla tyhjä")
    private String arrivalDate;
    @NotNull(message = "Vanhenemispäivä ei saa olla tyhjä")
    private String expDate;
    private String note;

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    public String getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(String arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }

    public int getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(int batchNumber) {
        this.batchNumber = batchNumber;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }


    public int getSubstance() {
        return substance;
    }

    public void setSubstance(int substance) {
        this.substance = substance;
    }
}
