package tk.traiders.components.annotation;

import android.app.Dialog;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;

public class AnnotationFragment extends DialogFragment {

    private static final String URL = "https://annotation.traiders.tk/annotations/";

    private TextView textView_annotation;
    private EditText editText_annotation;
    private Button button_annotation;

    private RequestQueue requestQueue;

    private String annotation;
    private String articleUrl;
    private String userUrl;
    private int startIndex;
    private int endIndex;

    public AnnotationFragment() {
    }

    public static AnnotationFragment newInstance(String annotation, String articleUrl, String userUrl, int startIndex, int endIndex) {
        AnnotationFragment annotationFragment = new AnnotationFragment();
        Bundle args = new Bundle();
        args.putString("annotation", annotation);
        args.putString("articleUrl", articleUrl);
        args.putString("userUrl", userUrl);
        args.putInt("startIndex", startIndex);
        args.putInt("endIndex", endIndex);

        annotationFragment.setArguments(args);
        return annotationFragment;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_annotation, container);
    }

    @Override
    public void onStart() {
        super.onStart();
        getDialog().getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        getDialog().setCanceledOnTouchOutside(true);

    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        getDialog().setTitle("Annotation");

        annotation = getArguments().getString("annotation", "");
        articleUrl = getArguments().getString("articleUrl", null);
        userUrl = getArguments().getString("userUrl", null);
        startIndex = getArguments().getInt("startIndex", -1);
        endIndex = getArguments().getInt("endIndex", -1);

        if(annotation == null ||articleUrl == null || userUrl == null ||startIndex == -1 || endIndex == -1){
            Toast.makeText(getContext(), "An error occured!", Toast.LENGTH_SHORT).show();
            return;
        }

        textView_annotation = view.findViewById(R.id.textView_annotation);
        editText_annotation = view.findViewById(R.id.editText_annotation);
        button_annotation = view.findViewById(R.id.button_annotation);

        textView_annotation.setText(annotation);

        editText_annotation.requestFocus();
        getDialog().getWindow().setSoftInputMode(
                WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE);

        button_annotation.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String value = editText_annotation.getText().toString();

                if(TextUtils.isEmpty(value)){
                    editText_annotation.setError("cannot be empty");
                    return;
                }

                button_annotation.setEnabled(false);

                JSONObject jsonObject = new JSONObject();

                try {
                    jsonObject.put("body", new JSONObject().put("type", "TextualBody").put("value", value));
                    jsonObject.put("target", new JSONObject().put("source", articleUrl).put("selector", new JSONObject().put("value", "char=" + startIndex + "," + endIndex)));
                    jsonObject.put("creator", userUrl);
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                JsonObjectRequest jsonObjectRequest = new JsonObjectRequest
                        (Request.Method.POST, URL, jsonObject, new Response.Listener<JSONObject>() {

                            @Override
                            public void onResponse(JSONObject response) {
                                Toast.makeText(getContext(), "Annotated!", Toast.LENGTH_SHORT).show();
                                dismiss();
                            }
                        }, new Response.ErrorListener() {

                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Toast.makeText(getContext(), "An error occured!", Toast.LENGTH_SHORT).show();
                            }
                        }){

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String> headers = MainActivity.getAuthorizationHeader(getActivity());
                        return headers != null ? headers : super.getHeaders();
                    }

                };

                requestQueue.add(jsonObjectRequest);
            }
        });
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        requestQueue = Volley.newRequestQueue(getContext());
    }
}
