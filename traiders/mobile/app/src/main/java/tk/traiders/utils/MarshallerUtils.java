package tk.traiders.utils;

import java.io.UnsupportedEncodingException;

public class MarshallerUtils {

    public static String convertToUTF8(String response){

        String UTF8_response = null;

        try {
            UTF8_response = new String(response.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {

            e.printStackTrace();
        }

        return UTF8_response;

    }
}
