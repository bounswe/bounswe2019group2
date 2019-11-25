package tk.traiders.marshallers;

import org.json.JSONException;
import org.json.JSONObject;

import tk.traiders.constants.UserConstants;
import tk.traiders.models.User;
import tk.traiders.utils.MarshallerUtils;

public class UserMarshaller {

    public static User unmarshall(String response) {

        response = MarshallerUtils.convertToUTF8(response);

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
}
