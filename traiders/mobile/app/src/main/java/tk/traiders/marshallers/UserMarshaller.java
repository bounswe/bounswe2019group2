package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.UserConstants;
import tk.traiders.models.Event;
import tk.traiders.models.User;
import tk.traiders.utils.MarshallerUtils;

public class UserMarshaller {

    public static User unmarshall(String response) {

        User user = null;

        try {

            JSONObject userAsJson = new JSONObject(response);

            String url = userAsJson.getString(UserConstants.URL);
            String id = userAsJson.getString(UserConstants.ID);
            String username = userAsJson.getString(UserConstants.USERNAME);
            String firstName = userAsJson.getString(UserConstants.FIRST_NAME);
            String lastName = userAsJson.getString(UserConstants.LAST_NAME);
            String email = userAsJson.getString(UserConstants.EMAIL);
            String dateJoined = userAsJson.getString(UserConstants.DATE_JOINED);
            boolean trader = userAsJson.getBoolean(UserConstants.IS_TRADER);
            String iban = userAsJson.getString(UserConstants.IBAN);
            String city = userAsJson.getString(UserConstants.CITY);
            String country = userAsJson.getString(UserConstants.COUNTRY);
            boolean profilePrivate = userAsJson.getBoolean(UserConstants.IS_PRIVATE);
            int avatarId = userAsJson.getInt(UserConstants.AVATAR);

            user = new User(url, id, username, firstName, lastName, email, dateJoined, trader, iban, city, country, profilePrivate, avatarId);

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return user;

    }

    public static List<User> unmarshallList(String response) {

        List<User> users = new ArrayList<>();

        try {
            JSONArray usersAsJson = new JSONArray(response);
            for(int i = 0; i < usersAsJson.length(); i++){
                users.add(unmarshall(usersAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return users;

    }
}
