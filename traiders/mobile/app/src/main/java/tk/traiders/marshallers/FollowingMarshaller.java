package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.constants.FollowingConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Following;
import tk.traiders.models.Like;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class FollowingMarshaller {

    public static Following unmarshall(String response){

        response = MarshallerUtils.convertToUTF8(response);


        Following following = null;

        try {

            JSONObject followingAsJson = new JSONObject(response);

            String url = followingAsJson.getString(FollowingConstants.URL);
            String id = followingAsJson.getString(FollowingConstants.ID);
            String userFollowing = followingAsJson.getString(FollowingConstants.USER_FOLLOWING);
            String userFollowed = followingAsJson.getString(FollowingConstants.USER_FOLLOWED);
            String status = followingAsJson.getString(FollowingConstants.STATUS);

            following = new Following(url, id, userFollowing, userFollowed, status);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return following;
    }

    public static List<Following> unmarshallList(String response) {

        response = MarshallerUtils.convertToUTF8(response);

        List<Following> followingList = new ArrayList<>();

        try {
            JSONArray followingListAsJson = new JSONArray(response);
            for(int i = 0; i < followingListAsJson.length(); i++){
                followingList.add(unmarshall(followingListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return followingList;

    }
}
