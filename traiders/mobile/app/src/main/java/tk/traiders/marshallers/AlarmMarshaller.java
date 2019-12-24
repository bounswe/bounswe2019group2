package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.AlarmConstants;
import tk.traiders.models.Alarm;
import tk.traiders.models.User;

public class AlarmMarshaller {

    public static Alarm unmarshall(String response){

        Alarm alarm = null;

        try {

            JSONObject alertAsJson = new JSONObject(response);

            User user = UserMarshaller.unmarshall(alertAsJson.getString(AlarmConstants.USER));
            String baseSymbol = alertAsJson.getString(AlarmConstants.BASE_SYMBOL);
            String targetSymbol = alertAsJson.getString(AlarmConstants.TARGET_SYMBOL);
            double ratio = alertAsJson.getDouble(AlarmConstants.RATIO);
            boolean increasing = alertAsJson.getBoolean(AlarmConstants.INCREASING);

            alarm = new Alarm()
                    .setUser(user)
                    .setBaseSymbol(baseSymbol)
                    .setTargetSymbol(targetSymbol)
                    .setRatio(ratio)
                    .setIncreasing(increasing);

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return alarm;
    }

    public static List<Alarm> unmarshallList(String response) {

        List<Alarm> alarmList = new ArrayList<>();

        try {
            JSONArray alertListAsJson = new JSONArray(response);
            for(int i = 0; i < alertListAsJson.length(); i++){
                alarmList.add(unmarshall(alertListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return alarmList;

    }
}
