package ohtu.radioaine.tools;

import java.util.ArrayList;
import java.util.List;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Event;
import ohtu.radioaine.domain.Substance;

public class EventHandler {

    private static final String NEWBATCH = "NEWBATCH";
    private static final String UPDATEBATCH = "MODIFYBATCH";
    private static final String NEWSUBSTANCE = "NEWSUBSTANCE";

    public static Event newBatchEvent(Batch batch) {
        Event event = new Event();
        List<Batch> batchList = new ArrayList<Batch>();
        batchList.add(batch);
        event.setBatches(batchList);
        event.setMessage("Uusi erä");
        event.setType(NEWBATCH);
        return event;
    }

    public static Event updateBatchEvent(Batch batch, String name) {
        Event event = new Event();
        List<Batch> batchList = new ArrayList<Batch>();
        batchList.add(batch);
        event.setBatches(batchList);
        event.setMessage(name + " muutti erän tietoja");
        event.setType(UPDATEBATCH);
        return event;
    }

    public static Event newSubstanceEvent(Substance substance) {
        Event event = new Event();
        List<Substance> substanceList = new ArrayList<Substance>();
        substanceList.add(substance);
        event.setSubstances(substanceList);
        event.setMessage("Uusi lääkeaine");
        event.setType(NEWSUBSTANCE);
        return event;
    }
}