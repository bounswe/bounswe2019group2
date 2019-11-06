package tk.traiders.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateUtils {

    public static final SimpleDateFormat defaultDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
    public static final SimpleDateFormat humanReadableDateFormat = new SimpleDateFormat("MMM d, yyyy", Locale.ENGLISH);

    public static String getHumanReadableDate(String dateAsString) {

        try {
            return humanReadableDateFormat.format(defaultDateFormat.parse(dateAsString.replaceAll("Z$", "+0000")));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return null;
    }
}
