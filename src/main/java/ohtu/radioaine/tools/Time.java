package ohtu.radioaine.tools;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Tools for managing time
 *
 * @author Radioaine
 */
public class Time {

    public static Timestamp getTimestamp() {
        Calendar calendar = Calendar.getInstance();
        Date now = calendar.getTime();
        Timestamp timestamp = new java.sql.Timestamp(now.getTime());
        return timestamp;
    }

    public static Timestamp getTodayDate() {
        Timestamp timestamp = getTimestamp();
        return parseTime(timestamp.toString(), "yyyy-MM-dd");
    }

    public static Timestamp parseTime(String time, String format) {
        DateFormat sdf = new SimpleDateFormat(format);
        Timestamp timestamp = null;
        try {
            Date date = sdf.parse(time);
            timestamp = new java.sql.Timestamp(date.getTime());
        } catch (Exception e) {
            e.printStackTrace();

        }
        return timestamp;
    }

    public static Timestamp parseDate(String time) {
        return parseTime(time, "dd.MM.yyyy");

    }

    public static Timestamp parseTimeStamp(String time) {
        return parseTime(time, "dd.MM.yyyy HH:mm");

    }

    public static Timestamp parseWarningDate(Timestamp time, int days) {
        long day = 84600000;
        Timestamp temp = new Timestamp(time.getTime() - day * days);
        return temp;
    }

    public static Date getWarningDate(int days) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.add(GregorianCalendar.DAY_OF_MONTH, -days);   
        return cal.getTime();
    }
}