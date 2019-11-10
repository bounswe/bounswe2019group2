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

public class CommentMarshaller {

    public static Comment unmarshall(String response){

        Comment comment = null;

        try {

            JSONObject articleCommentAsJson = new JSONObject(response);

            String id = articleCommentAsJson.getString(CommentConstants.ID);
            String url = articleCommentAsJson.getString(CommentConstants.URL);
            String created_at = DateUtils.getHumanReadableDate(articleCommentAsJson.getString(CommentConstants.CREATED_AT).substring(0,19) + "Z");
            String content = articleCommentAsJson.getString(CommentConstants.CONTENT);
            User author = UserMarshaller.unmarshall(articleCommentAsJson.getString(CommentConstants.AUTHOR));
            String articleUrl = articleCommentAsJson.getString(CommentConstants.ARTICLE_URL);

            comment = new Comment(id, url, created_at, content, author, articleUrl);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return comment;
    }

    public static List<Comment> unmarshallList(String response) {

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
