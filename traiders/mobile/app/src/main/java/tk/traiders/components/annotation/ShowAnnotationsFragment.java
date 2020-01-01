package tk.traiders.components.annotation;

import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.core.content.ContextCompat;
import androidx.core.util.Pair;
import androidx.fragment.app.DialogFragment;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.w3c.dom.Text;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.marshallers.AnnotationMarshaller;
import tk.traiders.marshallers.UserMarshaller;
import tk.traiders.models.Annotation;
import tk.traiders.models.User;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;

public class ShowAnnotationsFragment extends DialogFragment {

    private static final String URL_ANNOTATIONS = "https://annotation.traiders.tk/annotations/";

    private String articleUrl;
    private int selectedStartIndex;
    private int selectedEndIndex;
    private RequestQueue requestQueue;
    private LinearLayout linearLayout;

    private ProgressBar progressBar;

    private TextView textView;

    private List<Pair<Integer, Integer>> pairs = new ArrayList<>();
    private List<Annotation> annotations = new ArrayList<>();

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        getDialog().setTitle("Annotation");

        textView = view.findViewById(R.id.textView);
        linearLayout = view.findViewById(R.id.linearLayout);
        progressBar = view.findViewById(R.id.progressBar);

        articleUrl = getArguments().getString("articleUrl", null);
        selectedStartIndex = getArguments().getInt("selectedStartIndex", -1);
        selectedEndIndex = getArguments().getInt("selectedEndIndex", -1);


    }


    public static ShowAnnotationsFragment newInstance(String articleUrl, int startIndex, int endIndex) {
        ShowAnnotationsFragment showAnnotationsFragment = new ShowAnnotationsFragment();
        Bundle args = new Bundle();
        args.putString("articleUrl", articleUrl);
        args.putInt("selectedStartIndex", startIndex);
        args.putInt("selectedEndIndex", endIndex);
        showAnnotationsFragment.setArguments(args);
        return showAnnotationsFragment;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        requestQueue = Volley.newRequestQueue(getActivity());
        return inflater.inflate(R.layout.fragment_show_annotations, container);
    }

    @Override
    public void onStart() {
        super.onStart();
        getDialog().getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        getDialog().setCanceledOnTouchOutside(true);
        fetchAnnotations();

    }

    private void fetchAnnotations(){

        StringRequest request = new StringRequest(Request.Method.GET, URL_ANNOTATIONS, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                List<Annotation> annotationList = AnnotationMarshaller.unmarshallList(response);
                List<Annotation> filteredAnnotationList = new ArrayList<>();
                for(Annotation annotation: annotationList){
                    if(annotation != null){
                        if(annotation.getTarget().getSource().equals(articleUrl)){
                            filteredAnnotationList.add(annotation);
                        }
                    }
                }

                List<Annotation> selectedAnnotationList = new ArrayList<>();


                for(Annotation annotation: filteredAnnotationList) {
                    if(!annotation.getBody().getType().equals("TextualBody")){
                        continue;
                    }
                    String value = annotation.getTarget().getSelector().getValue();
                    int indexOfEqualSign = value.indexOf("=");
                    int indexOfComma = value.indexOf(",");
                    int startIndex = Integer.valueOf(value.substring(indexOfEqualSign + 1, indexOfComma));
                    int endIndex = Integer.valueOf(value.substring(indexOfComma + 1));

                    if(ShowAnnotationsFragment.this.selectedStartIndex <=startIndex && endIndex <= ShowAnnotationsFragment.this.selectedEndIndex){
                        selectedAnnotationList.add(annotation);
                    }

                }

                TextView textView = new TextView(getActivity());

                progressBar.setVisibility(View.GONE);

                textView.setText("Annotations");
                textView.setTextColor(ContextCompat.getColor(getActivity(), android.R.color.black));
                textView.setTextSize(24);
                textView.setGravity(Gravity.CENTER);
                textView.setPadding(8,8,8,8);
                linearLayout.addView(textView);


                for(Annotation annotation: selectedAnnotationList){
                    View rootView= View.inflate(getContext(), R.layout.annotation_list_item, null);

                    TextView textView_content = rootView.findViewById(R.id.textView_content);
                    TextView textView_createdBy = rootView.findViewById(R.id.textView_createdBy);
                    TextView textView_createdAt = rootView.findViewById(R.id.textView_createdAt);

                    textView_content.setText(annotation.getBody().getValue());

                    textView_createdBy.setText(annotation.getCreator() != null ? annotation.getCreator().substring(annotation.getCreator().indexOf("/users/") + 6) : "");

                    if(annotation.getCreator() != null){
                        getUsername(textView_createdBy, annotation.getCreator());
                    }


                    textView_createdAt.setText(annotation.getCreatedAt() != null ? annotation.getCreatedAt() : "");

                    linearLayout.addView(rootView);
                }

                /*

                for(Annotation annotation: selectedAnnotationList) {
                    TextView textViewAnnotation  = new TextView(getActivity());
                    textViewAnnotation.setText(annotation.getBody().getValue());
                    textView.setPadding(8,8,8,8);
                    textView.setTextSize(20);
                    linearLayout.addView(textViewAnnotation);
                }


                 */

            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getActivity(), "An error occured fetching annotations", Toast.LENGTH_SHORT).show();
                error.printStackTrace();
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = MainActivity.getAuthorizationHeader(getActivity());
                return headers != null ? headers : super.getHeaders();
            }
        };

        requestQueue.add(request);


    }

    private void getUsername(TextView textView, String userUrl){

        StringRequest request = new StringRequest(Request.Method.GET, userUrl, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                User user = UserMarshaller.unmarshall(response);
                if(user != null){
                    textView.setText(user.getUsername());
                }
            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getContext(), "an error occured getting username!", Toast.LENGTH_SHORT).show();
                error.printStackTrace();
            }
        }) {

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = MainActivity.getAuthorizationHeader(getContext());
                return headers != null ? headers : super.getHeaders();
            }
        };

        requestQueue.add(request);

    }
}
