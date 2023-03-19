package util;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.WeekFields;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author Pham Nhat Quang CE170036 (FPTU CANTHO)
 */
public class Utility {

    /**
     * Returns the current date or time in a specified format as a string.
     *
     * @param type A string argument that specifies the desired output format.
     * This can be either "date" to obtain the date in the format of
     * year-month-day, or any other string to obtain the time in the format of
     * hours:minutes:seconds.
     * @return A string that represents the current date or time in the
     * specified format.
     */
    public static String getCurrentDateOrTime(String type) {
        // Get the current date and time
        Date current = new Date();

        // Set the output format based on the input argument
        String format = type.equalsIgnoreCase("date") ? "yyyy-MM-dd" : "HH:mm:ss";

        // Create a new instance of the SimpleDateFormat class with the desired format
        SimpleDateFormat formatter = new SimpleDateFormat(format);

        // Use the formatter to format the current date and time
        String res = formatter.format(current);

        // Return the formatted date or time as a string
        return res;
    }

    /**
     * Returns the current date or time in a specified format as a string.
     *
     * @param type A string argument that specifies the desired output format.
     * This can be either "date" to obtain the date in the format of
     * year-month-day, or any other string to obtain the time in the format of
     * hours:minutes:seconds.
     * @return A string that represents the current date or time in the
     * specified format.
     */
    public static String getDateOrTime(Date input, String type) {
        // Get the current date and time
//        Date current = new Date();

        // Set the output format based on the input argument
        String format = type.equalsIgnoreCase("date") ? "yyyy-MM-dd" : "HH:mm:ss";

        // Create a new instance of the SimpleDateFormat class with the desired format
        SimpleDateFormat formatter = new SimpleDateFormat(format);

        // Use the formatter to format the current date and time
        String res = formatter.format(input);

        // Return the formatted date or time as a string
        return res;
    }

    /**
     * Appends the given status and message parameters to a URL string and
     * returns the resulting string. The new parameters are added to the URL
     * string as query parameters following the original ones.
     *
     * @param url The URL string to append the status and message parameters to.
     * @param status The value of the "status" parameter to be appended to the
     * URL string.
     * @param message The value of the "message" parameter to be appended to the
     * URL string.
     * @return A new string representing the updated URL with the appended
     * parameters.
     */
    public static String appendStatus(String url, String status, String message) {
        StringBuilder sb = new StringBuilder(url);
        if (url.contains("?")) {
            sb.append("&");
        } else {
            sb.append("?");
        }
        sb.append("status=").append(status);
        sb.append("&message=").append(URLEncoder.encode(message, StandardCharsets.UTF_8));
        return sb.toString();
    }

    /**
     * Converts a given java.util.Date object to a java.time.LocalDate object
     * using the system default time zone.
     *
     * @param date The java.util.Date object to be converted.
     * @return A java.time.LocalDate object representing the same date as the
     * input Date object.
     */
    public static LocalDate convertDateToLocalDate(Date date) {
        return date.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
    }

    /**
     * Returns the week date of a given java.time.LocalDate object, where the
     * week date represents the number of days since the start of the week, with
     * Monday as day 0.
     *
     * @param date The java.time.LocalDate object to get the week date of.
     * @return An integer representing the week date of the input LocalDate
     * object.
     */
    public static int getWeekDate(LocalDate date) {
        WeekFields weekFields = WeekFields.of(Locale.getDefault());
        return date.get(weekFields.dayOfWeek()) == 7 ? 0 : date.get(weekFields.dayOfWeek());
    }
}
