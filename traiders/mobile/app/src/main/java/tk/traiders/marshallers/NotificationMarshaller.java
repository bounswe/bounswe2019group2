package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.NClob;
import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.ArticleConstants;
import tk.traiders.constants.NotificationConstants;
import tk.traiders.models.Article;
import tk.traiders.models.Like;
import tk.traiders.models.Notification;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class NotificationMarshaller {

    public static Notification unmarshall(String response){

        Notification notification = null;

        try {

            JSONObject notificationAsJson = new JSONObject(response);

            String url = notificationAsJson.getString(NotificationConstants.URL);
            User user = UserMarshaller.unmarshall(notificationAsJson.getString(NotificationConstants.USER));
            String message = notificationAsJson.getString(NotificationConstants.MESSAGE);
            String referenceObject = notificationAsJson.getString(NotificationConstants.REFERENCE_OBJECT);
            String referenceReferenceUrl = notificationAsJson.getString(NotificationConstants.REFERENCE_URL);
            boolean seen = notificationAsJson.getBoolean(NotificationConstants.SEEN);
            int id = notificationAsJson.getInt(NotificationConstants.ID);

            notification = new Notification()
                    .setUrl(url)
                    .setUser(user)
                    .setMessage(message)
                    .setReferenceObject(referenceObject)
                    .setReferenceUrl(referenceReferenceUrl)
                    .setSeen(seen)
                    .setId(id);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return notification;
    }

    public static List<Notification> unmarshallList(String response) {

        List<Notification> notificationList = new ArrayList<>();

        try {
            JSONArray notificationListAsJson = new JSONArray(response);
            for(int i = 0; i < notificationListAsJson.length(); i++){
                notificationList.add(unmarshall(notificationListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return notificationList;

    }
}
