package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.models.Article;
import tk.traiders.models.User;

public class ArticleMarshaller {

    public static Article unmarshall(String response){

        Article article = null;

        try {

            JSONObject articleAsJson = new JSONObject(response);

            String url = articleAsJson.getString(ArticleConstants.URL);
            String title = articleAsJson.getString(ArticleConstants.TITLE);
            String created_at = articleAsJson.getString(ArticleConstants.CREATED_AT);
            String content = articleAsJson.getString(ArticleConstants.CONTENT);
            String image = articleAsJson.getString(ArticleConstants.IMAGE);
            User author = UserMarshaller.unmarshall(articleAsJson.getString(ArticleConstants.AUTHOR));
            String id = articleAsJson.getString(ArticleConstants.ID);

            article = new Article(url, title, created_at, content, image, author, id);


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
