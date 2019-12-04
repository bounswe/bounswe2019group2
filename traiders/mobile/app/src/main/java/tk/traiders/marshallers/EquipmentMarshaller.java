package tk.traiders.marshallers;

import android.media.audiofx.DynamicsProcessing;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.constants.EquipmentConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Equipment;
import tk.traiders.models.Like;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class EquipmentMarshaller {

    public static Equipment unmarshall(String response){

        Equipment equipment = null;

        try {

            JSONObject equipmentAsJson = new JSONObject(response);

            String url = equipmentAsJson.getString(EquipmentConstants.URL);
            String id = equipmentAsJson.getString(EquipmentConstants.ID);
            String name = equipmentAsJson.getString(EquipmentConstants.NAME);
            String category = equipmentAsJson.getString(EquipmentConstants.CATEGORY);
            String symbol = equipmentAsJson.getString(EquipmentConstants.SYMBOL);

            equipment = new Equipment(url, id, name, category, symbol);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return equipment;
    }

    public static List<Equipment> unmarshallList(String response) {

        List<Equipment> equipmentList = new ArrayList<>();

        try {
            JSONArray equipmentListAsJson = new JSONArray(response);
            for(int i = 0; i < equipmentListAsJson.length(); i++){
                equipmentList.add(unmarshall(equipmentListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return equipmentList;

    }
}
