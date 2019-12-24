package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Like;
import tk.traiders.models.Portfolio;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class PortfolioMarshaller {

    public static Portfolio unmarshall(String response){

        Portfolio portfolio = null;

        try {

            JSONObject portfolioAsJson = new JSONObject(response);

            String url = portfolioAsJson.getString(ArticleConstants.URL);
            String title = portfolioAsJson.getString(ArticleConstants.TITLE);
            String created_at = DateUtils.getHumanReadableDate(portfolioAsJson.getString(ArticleConstants.CREATED_AT).substring(0,19) + "Z");
            String content = portfolioAsJson.getString(ArticleConstants.CONTENT);
            String image = portfolioAsJson.getString(ArticleConstants.IMAGE);
            User author = UserMarshaller.unmarshall(portfolioAsJson.getString(ArticleConstants.AUTHOR));
            String id = portfolioAsJson.getString(ArticleConstants.ID);
            String likeCount = portfolioAsJson.getString(ArticleConstants.NUMBER_OF_LIKES);
            Like like = LikeMarshaller.unmarshall(portfolioAsJson.getString(ArticleConstants.LIKE));

            portfolio = new Portfolio();


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return portfolio;
    }

    public static List<Portfolio> unmarshallList(String response) {

        List<Portfolio> portfolioList = new ArrayList<>();

        try {
            JSONArray portfolioListAsJson = new JSONArray(response);
            for(int i = 0; i < portfolioListAsJson.length(); i++){
                portfolioList.add(unmarshall(portfolioListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return portfolioList;

    }
}
