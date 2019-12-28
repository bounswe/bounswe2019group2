package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.constants.PortfolioItemConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Like;
import tk.traiders.models.PortfolioItem;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class PortfolioItemMarshaller {

    public static PortfolioItem unmarshall(String response){

        PortfolioItem portfolioItem = null;

        try {

            JSONObject portfolioItemAsJson = new JSONObject(response);

            String url = portfolioItemAsJson.getString(PortfolioItemConstants.URL);
            String targetEquipment = portfolioItemAsJson.getString(PortfolioItemConstants.TARGET_EQUIPMENT);
            String baseEquipment = portfolioItemAsJson.getString(PortfolioItemConstants.BASE_EQUIPMENT);
            String portfolio = portfolioItemAsJson.getString(PortfolioItemConstants.PORTFOLIO);
            int id = portfolioItemAsJson.getInt(PortfolioItemConstants.ID);

            portfolioItem = new PortfolioItem()
                    .setUrl(url)
                    .setTargetEquipment(targetEquipment)
                    .setBaseEquipment(baseEquipment)
                    .setPortfolio(portfolio)
                    .setId(id);

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return portfolioItem;
    }

    public static List<PortfolioItem> unmarshallList(String response) {

        List<PortfolioItem> portfolioItemList = new ArrayList<>();

        try {
            JSONArray portfolioItemListAsJson = new JSONArray(response);
            for(int i = 0; i < portfolioItemListAsJson.length(); i++){
                portfolioItemList.add(unmarshall(portfolioItemListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return portfolioItemList;

    }
}
