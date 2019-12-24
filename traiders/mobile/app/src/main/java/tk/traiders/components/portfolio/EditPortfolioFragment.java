package tk.traiders.components.portfolio;

import android.os.Bundle;
import android.provider.ContactsContract;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.Spinner;
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
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Text;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.SignUpActivity;
import tk.traiders.components.annotation.AnnotationFragment;
import tk.traiders.marshallers.AnnotationMarshaller;
import tk.traiders.marshallers.EquipmentMarshaller;
import tk.traiders.models.Annotation;
import tk.traiders.models.Equipment;

public class EditPortfolioFragment extends DialogFragment {

    private static final String URL = "https://api.traiders.tk/portfolio/";

    private RequestQueue requestQueue;

    private EditText editText;
    private ImageView imageView;
    private LinearLayout linearLayout;
    private Button button;

    public static EditPortfolioFragment newInstance(String url) {
        EditPortfolioFragment editPortfolioFragment = new EditPortfolioFragment();
        Bundle args = new Bundle();
        args.putString("url", url);
        editPortfolioFragment.setArguments(args);
        return editPortfolioFragment;
    }


    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        getDialog().setTitle("Edit Portfolio");

        editText = view.findViewById(R.id.editText);
        editText.setEnabled(false);
        imageView = view.findViewById(R.id.imageView);

        imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });

        linearLayout = view.findViewById(R.id.linearLayout);
        linearLayout.setVisibility(View.VISIBLE);


    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        requestQueue = Volley.newRequestQueue(getActivity());
        return inflater.inflate(R.layout.fragment_create_portfolio, container);
    }

    @Override
    public void onStart() {
        super.onStart();
        //getDialog().getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        getDialog().setCanceledOnTouchOutside(true);

    }

    private void doRequest(){

        JSONObject jsonObject = new JSONObject();

        try {
            jsonObject.put("name", name);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, URL, jsonObject, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                Toast.makeText(getContext(), "portfolio created", Toast.LENGTH_SHORT).show();
                button.setEnabled(true);
                dismiss();
            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                button.setEnabled(true);
                Toast.makeText(getContext(), "An error occured creating portfolio", Toast.LENGTH_SHORT).show();
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
}
