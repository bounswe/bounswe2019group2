package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.constants.CountryConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Country;
import tk.traiders.models.Like;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class CountryMarshaller {

    public static Country unmarshall(String response){

        response = MarshallerUtils.convertToUTF8(response);


        Country country = null;

        try {

            JSONObject countryAsJson = new JSONObject(response);

            String name = countryAsJson.getString(CountryConstants.NAME);
            String code = countryAsJson.getString(CountryConstants.CODE);
            country = new Country(name, code);

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return country;
    }

    public static List<Country> unmarshallList(String response) {

        response = MarshallerUtils.convertToUTF8(response);

        List<Country> countryList = new ArrayList<>();

        try {
            JSONArray countryListAsJson = new JSONArray(response);
            for(int i = 0; i < countryListAsJson.length(); i++){
                countryList.add(unmarshall(countryListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return countryList;

    }
}
