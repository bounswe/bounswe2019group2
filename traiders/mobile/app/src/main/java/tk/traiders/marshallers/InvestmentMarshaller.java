package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Investment;
import tk.traiders.models.Like;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class InvestmentMarshaller {

    public static Investment unmarshall(String response){

        Investment investment = null;

        try {

            JSONObject investmentAsJson = new JSONObject(response);

            String url = investmentAsJson.getString(ArticleConstants.URL);
            String title = investmentAsJson.getString(ArticleConstants.TITLE);
            String created_at = DateUtils.getHumanReadableDate(investmentAsJson.getString(ArticleConstants.CREATED_AT).substring(0,19) + "Z");
            String content = investmentAsJson.getString(ArticleConstants.CONTENT);
            String image = investmentAsJson.getString(ArticleConstants.IMAGE);
            User author = UserMarshaller.unmarshall(investmentAsJson.getString(ArticleConstants.AUTHOR));
            String id = investmentAsJson.getString(ArticleConstants.ID);
            String likeCount = investmentAsJson.getString(ArticleConstants.NUMBER_OF_LIKES);
            Like like = LikeMarshaller.unmarshall(investmentAsJson.getString(ArticleConstants.LIKE));

            investment = new Investment();


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return investment;
    }

    public static List<Investment> unmarshallList(String response) {

        List<Investment> investmentList = new ArrayList<>();

        try {
            JSONArray investmentListAsJson = new JSONArray(response);
            for(int i = 0; i < investmentListAsJson.length(); i++){
                investmentList.add(unmarshall(investmentListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return investmentList;

    }
}
