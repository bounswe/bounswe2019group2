package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.LikeConstants;
import tk.traiders.models.Like;
import tk.traiders.utils.MarshallerUtils;

public class LikeMarshaller {

    public static Like unmarshall(String response){

        response = MarshallerUtils.convertToUTF8(response);


        Like like = null;

        try {

            JSONObject likeAsJson = new JSONObject(response);

            String url = likeAsJson.getString(LikeConstants.URL);
            String user = likeAsJson.getString(LikeConstants.USER);
            String article = likeAsJson.getString(LikeConstants.ARTICLE);

            like = new Like(url, user, article);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return like;
    }

    public static List<Like> unmarshallList(String response) {

        response = MarshallerUtils.convertToUTF8(response);


        List<Like> likeList = new ArrayList<>();

        try {
            JSONArray likeListAsJson = new JSONArray(response);
            for(int i = 0; i < likeListAsJson.length(); i++){
                likeList.add(unmarshall(likeListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return likeList;

    }
}
