package util;

import java.text.SimpleDateFormat;
import java.util.Date;

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
    public static String getDateOrTime(String type) {
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
}
