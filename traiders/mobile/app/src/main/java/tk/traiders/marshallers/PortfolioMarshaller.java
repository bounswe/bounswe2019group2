package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.constants.PortfolioConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Like;
import tk.traiders.models.Portfolio;
import tk.traiders.models.PortfolioItem;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class PortfolioMarshaller {

    public static Portfolio unmarshall(String response){

        Portfolio portfolio = null;

        try {

            JSONObject portfolioAsJson = new JSONObject(response);

            String url = portfolioAsJson.getString(PortfolioConstants.URL);
            int id = portfolioAsJson.getInt(PortfolioConstants.ID);
            String name = portfolioAsJson.getString(PortfolioConstants.NAME);
            User user = UserMarshaller.unmarshall(portfolioAsJson.getString(PortfolioConstants.USER));
            String isFollowing = portfolioAsJson.getString(PortfolioConstants.IS_FOLLOWING);
            List<PortfolioItem> portfolioItems = PortfolioItemMarshaller.unmarshallList(portfolioAsJson.getString(PortfolioConstants.PORTFOLIO_ITEMS));

            portfolio = new Portfolio()
                    .setUrl(url)
                    .setId(id)
                    .setName(name)
                    .setUser(user)
                    .setIsFollowing(isFollowing)
                    .setPortfolioItemList(portfolioItems);

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
