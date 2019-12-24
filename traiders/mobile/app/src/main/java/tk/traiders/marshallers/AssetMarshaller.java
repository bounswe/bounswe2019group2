package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.constants.AssetConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Asset;
import tk.traiders.models.Like;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class AssetMarshaller {

    public static Asset unmarshall(String response){

        Asset asset = null;

        try {

            JSONObject assetAsJson = new JSONObject(response);

            String url = assetAsJson.getString(AssetConstants.URL);
            int id = assetAsJson.getInt(AssetConstants.ID);
            String equipment = assetAsJson.getString(AssetConstants.EQUIPMENT);
            double amount = assetAsJson.getDouble(AssetConstants.AMOUNT);
            User user = UserMarshaller.unmarshall(assetAsJson.getString(AssetConstants.USER));
            int onHoldForInvestment = assetAsJson.getInt(AssetConstants.ON_HOLD_FOR_INVESTMENT);

            asset = new Asset()
                    .setUrl(url)
                    .setId(id)
                    .setEquipment(equipment)
                    .setAmount(amount)
                    .setUser(user)
                    .setOnHoldForInvestment(onHoldForInvestment);



        } catch (JSONException e) {
            e.printStackTrace();
        }

        return asset;
    }

    public static List<Asset> unmarshallList(String response) {

        List<Asset> AssetList = new ArrayList<>();

        try {
            JSONArray assetListAsJson = new JSONArray(response);
            for(int i = 0; i < assetListAsJson.length(); i++){
                AssetList.add(unmarshall(assetListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return AssetList;

    }
}
