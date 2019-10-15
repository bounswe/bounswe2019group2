package tk.traiders.marshallers;

import org.json.JSONException;
import org.json.JSONObject;

import tk.traiders.constants.UserConstants;
import tk.traiders.models.User;

public class UserMarshaller {

    public static User toUser(String strJson) {

        User user = new User();

        JSONObject jsonObject = null;

        try {
            jsonObject = new JSONObject(strJson);

            user.setUrl(jsonObject.getString(UserConstants.URL))
                    .setUsername(jsonObject.getString(UserConstants.USERNAME))
                    .setFirst_name(jsonObject.getString(UserConstants.FIRST_NAME))
                    .setLast_name(jsonObject.getString(UserConstants.LAST_NAME))
                    .setEmail(jsonObject.getString(UserConstants.EMAIL))
                    .setDate_joined(jsonObject.getString(UserConstants.DATE_JOINED))
                    .setIs_trader(jsonObject.getBoolean(UserConstants.IS_TRADER))
                    .setPreferred_currency(jsonObject.getString(UserConstants.PREFERRED_CURRENCY));

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return user;
    }
}
