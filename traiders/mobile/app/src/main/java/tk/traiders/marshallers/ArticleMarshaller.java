package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Like;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class ArticleMarshaller {

    public static Article unmarshall(String response){

        Article article = null;

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

            article = new Article(url, title, created_at, content, image, author, id, likeCount, like);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return article;
    }

    public static List<Article> unmarshallList(String response) {

        List<Article> articleList = new ArrayList<>();

        try {
            JSONArray articleListAsJson = new JSONArray(response);
            for(int i = 0; i < articleListAsJson.length(); i++){
                articleList.add(ArticleMarshaller.unmarshall(articleListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return articleList;

    }
}
