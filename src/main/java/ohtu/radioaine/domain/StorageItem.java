package ohtu.radioaine.domain;

import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Entity
public class StorageItem {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(nullable = false)
    private Long id;
    
//    @Column
//    private List<Batch> batchesList;
    @Column
    private String whereIsItStored;
    @Column
    private String openText;
//    @Column
//    private Date dateArrived;
//    @Column
//    private Date dateToRemove;

//    public List<Batch> getBatchesList() {
//        return batchesList;
//    }
//
//    public void setBatchesList(List<Batch> batchesList) {
//        this.batchesList = batchesList;
//    }

//    public Date getDateArrived() {
//        return dateArrived;
//    }
//
//    public void setDateArrived(Date dateArrived) {
//        this.dateArrived = dateArrived;
//    }
//
//    public Date getDateToRemove() {
//        return dateToRemove;
//    }
//
//    public void setDateToRemove(Date dateToRemove) {
//        this.dateToRemove = dateToRemove;
//    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOpenText() {
        return openText;
    }

    public void setOpenText(String openText) {
        this.openText = openText;
    }

    public String getWhereIsItStored() {
        return whereIsItStored;
    }

    public void setWhereIsItStored(String whereIsItStored) {
        this.whereIsItStored = whereIsItStored;
    }
    
    
    
}
