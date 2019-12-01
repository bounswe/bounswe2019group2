package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.EventConstants;
import tk.traiders.models.Event;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class EventMarshaller {

    public static Event unmarshall(String response){

        Event event = null;

        try {

            JSONObject eventAsJson = new JSONObject(response);

            boolean is_following = eventAsJson.getBoolean(EventConstants.IS_FOLLOWING);
            String url = eventAsJson.getString(EventConstants.URL);
            String id  = eventAsJson.getString(EventConstants.ID);
            String date = DateUtils.getHumanReadableDate(eventAsJson.getString(EventConstants.DATE).substring(0,19) + "Z");
            String country = eventAsJson.getJSONObject(EventConstants.COUNTRY).getString(EventConstants.NAME);
            String countryCode = eventAsJson.getJSONObject(EventConstants.COUNTRY).getString(EventConstants.CODE);
            String calendarId = eventAsJson.getString(EventConstants.CALENDAR_ID);
            String category = eventAsJson.getString(EventConstants.CATEGORY);
            String actual = eventAsJson.getString(EventConstants.ACTUAL);
            String previous = eventAsJson.getString(EventConstants.PREVIOUS);
            String forecast = eventAsJson.getString(EventConstants.FORECAST);
            String sourceURL = eventAsJson.getString(EventConstants.SOURCE_URL);
            int importance = eventAsJson.getInt(EventConstants.IMPORTANCE);
            String eventName = eventAsJson.getString(EventConstants.EVENT);

            event = new Event(is_following, url, id, date, country, countryCode, calendarId, category, actual, previous, forecast, sourceURL, importance, eventName);

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return event;
    }

    public static List<Event> unmarshallList(String response) {

        List<Event> events = new ArrayList<>();

        try {
            JSONArray eventAsJson = new JSONArray(response);
            for(int i = 0; i < eventAsJson.length(); i++){
                events.add(unmarshall(eventAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return events;

    }
}
