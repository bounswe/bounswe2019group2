package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
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

            JSONObject articleAsJson = new JSONObject(response);

            String url = articleAsJson.getString(ArticleConstants.URL);
            String title = articleAsJson.getString(ArticleConstants.TITLE);
            String created_at = DateUtils.getHumanReadableDate(articleAsJson.getString(ArticleConstants.CREATED_AT).substring(0,19) + "Z");
            String content = articleAsJson.getString(ArticleConstants.CONTENT);
            String image = articleAsJson.getString(ArticleConstants.IMAGE);
            User author = UserMarshaller.unmarshall(articleAsJson.getString(ArticleConstants.AUTHOR));
            String id = articleAsJson.getString(ArticleConstants.ID);
            String likeCount = articleAsJson.getString(ArticleConstants.NUMBER_OF_LIKES);
            Like like = LikeMarshaller.unmarshall(articleAsJson.getString(ArticleConstants.LIKE));

            asset = new Asset();


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
