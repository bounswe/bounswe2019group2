package tk.traiders.marshallers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.constants.AnnotationConstants;
import tk.traiders.constants.ArticleConstants;
import tk.traiders.models.Annotation;
import tk.traiders.models.Article;
import tk.traiders.models.Like;
import tk.traiders.models.User;
import tk.traiders.utils.DateUtils;
import tk.traiders.utils.MarshallerUtils;

public class AnnotationMarshaller {

    public static Annotation unmarshall(String response){

        Annotation annotation = null;

        try {

            JSONObject annotationAsJson = new JSONObject(response);

            String context = annotationAsJson.getString(AnnotationConstants.CONTEXT);
            String id = annotationAsJson.getString(AnnotationConstants.ID);
            String type = annotationAsJson.getString(AnnotationConstants.TYPE);
            String created = DateUtils.getHumanReadableDate(annotationAsJson.getString(AnnotationConstants.CREATED).substring(0,19) + "Z");

            JSONObject bodyAsJson = annotationAsJson.getJSONObject(AnnotationConstants.BODY);
            String body_type = bodyAsJson.getString(AnnotationConstants.TYPE);

            String body_valueOrId;

            if(bodyAsJson.has(AnnotationConstants.VALUE)){
                body_valueOrId = bodyAsJson.getString(AnnotationConstants.VALUE);
            } else if (bodyAsJson.has(AnnotationConstants.ID)){
                body_valueOrId = bodyAsJson.getString(AnnotationConstants.ID);
            } else {
                body_valueOrId = null;
            }

            Annotation.Body body = new Annotation.Body(body_type, body_valueOrId);

            JSONObject targetAsJson = annotationAsJson.getJSONObject(AnnotationConstants.TARGET);

            JSONObject selectorAsJson = targetAsJson.getJSONObject(AnnotationConstants.SELECTOR);

            String selector_type = selectorAsJson.getString(AnnotationConstants.TYPE);
            String selector_value = selectorAsJson.getString(AnnotationConstants.VALUE);

            Annotation.Target.Selector target_selector = new Annotation.Target.Selector(selector_type, selector_value);

            String target_source = targetAsJson.getString(AnnotationConstants.SOURCE);

            Annotation.Target target = new Annotation.Target(target_source, target_selector);

            String creator = annotationAsJson.getString(AnnotationConstants.CREATOR);


            annotation = new Annotation(context, id, type, created, body, target, creator);


        } catch (JSONException e) {
            e.printStackTrace();
        }

        return annotation;
    }

    public static List<Annotation> unmarshallList(String response) {

        List<Annotation> annotationList = new ArrayList<>();

        try {
            JSONArray annotationListAsJson = new JSONArray(response);
            for(int i = 0; i < annotationListAsJson.length(); i++){
                annotationList.add(unmarshall(annotationListAsJson.getString(i)));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return annotationList;

    }
}
