package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.constants.ParityConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Equipment;
import tk.traiders.models.Like;
import tk.traiders.models.Parity;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class ParityMarshaller {

    public static Parity unmarshall(String response){

        response = MarshallerUtils.convertToUTF8(response);


        Parity parity = null;

        try {

            JSONObject parityAsJson = new JSONObject(response);

            String url = parityAsJson.getString(ParityConstants.URL);
            String id = parityAsJson.getString(ParityConstants.ID);
            Equipment baseEquipment = EquipmentMarshaller.unmarshall(parityAsJson.getString(ParityConstants.BASE_EQUIPMENT));
            Equipment targetEquipment = EquipmentMarshaller.unmarshall(parityAsJson.getString(ParityConstants.TARGET_EQUIPMENT));
            Double ratio = parityAsJson.getDouble(ParityConstants.RAITO);
            Double open = parityAsJson.getDouble(ParityConstants.OPEN);
            Double close = parityAsJson.getDouble(ParityConstants.CLOSE);
            Double high = parityAsJson.getDouble(ParityConstants.HIGH);
            Double low = parityAsJson.getDouble(ParityConstants.LOW);
            String date = DateUtils.getHumanReadableDate(parityAsJson.getString(ParityConstants.DATE).substring(0,19) + "Z");

            parity = new Parity(url, id, baseEquipment, targetEquipment, ratio, open, close, high, low, date);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return parity;
    }

    public static List<Parity> unmarshallList(String response) {

        response = MarshallerUtils.convertToUTF8(response);

        List<Parity> parityList = new ArrayList<>();

        try {
            JSONArray parityListAsJson = new JSONArray(response);
            for(int i = 0; i < parityListAsJson.length(); i++){
                parityList.add(unmarshall(parityListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return parityList;

    }
}
