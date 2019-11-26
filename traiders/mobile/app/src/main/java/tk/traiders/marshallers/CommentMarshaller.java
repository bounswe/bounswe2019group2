package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.CommentConstants;
import tk.traiders.models.Comment;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class CommentMarshaller {

    public static Comment unmarshall(String response){

        response = MarshallerUtils.convertToUTF8(response);


        Comment comment = null;

        try {

            JSONObject commentAsJson = new JSONObject(response);

            String id = commentAsJson.getString(CommentConstants.ID);
            String url = commentAsJson.getString(CommentConstants.URL);
            String created_at = DateUtils.getHumanReadableDate(commentAsJson.getString(CommentConstants.CREATED_AT).substring(0,19) + "Z");
            String content = commentAsJson.getString(CommentConstants.CONTENT);
            User author = UserMarshaller.unmarshall(commentAsJson.getString(CommentConstants.AUTHOR));
            String articleOrEquipmentUrl ;
            if(commentAsJson.has(CommentConstants.ARTICLE_URL)){
                articleOrEquipmentUrl = commentAsJson.getString(CommentConstants.ARTICLE_URL);
            } else {
                articleOrEquipmentUrl = commentAsJson.getString(CommentConstants.EQUIPMENT_URL);
            }

            boolean isLiked = commentAsJson.getBoolean(CommentConstants.IS_LIKED);
            int numLikes = commentAsJson.getInt(CommentConstants.NUM_LIKES);

            comment = new Comment(id, url, created_at, content, author, articleOrEquipmentUrl, isLiked, numLikes);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return comment;
    }

    public static List<Comment> unmarshallList(String response) {

        response = MarshallerUtils.convertToUTF8(response);

        List<Comment> commentList = new ArrayList<>();

        try {
            JSONArray articleListAsJson = new JSONArray(response);
            for(int i = 0; i < articleListAsJson.length(); i++){
                commentList.add(unmarshall(articleListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return commentList;

    }
}
