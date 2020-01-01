package tk.traiders.components.asset;

import android.os.Bundle;
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
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.SignUpActivity;
import tk.traiders.marshallers.AnnotationMarshaller;
import tk.traiders.marshallers.EquipmentMarshaller;
import tk.traiders.models.Annotation;
import tk.traiders.models.Equipment;

public class CreateAssetFragment extends DialogFragment {

    private static final String URL = "https://api.traiders.tk/asset/";

    private RequestQueue requestQueue;
    private Spinner spinner;
    private EditText editText;
    private Button button;
    private double amount;

    private List<String> equipmentNames = new ArrayList<>();
    private List<String> equipmentSymbols = new ArrayList<>();

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        getDialog().setTitle("Create Asset");

        editText = view.findViewById(R.id.editText);
        button = view.findViewById(R.id.button);
        spinner = view.findViewById(R.id.spinner);
        button.setEnabled(false);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(TextUtils.isEmpty(editText.getText().toString())){
                    editText.setError("enter an amount");
                    return;
                }

                amount =  Double.valueOf(editText.getText().toString() );

                button.setEnabled(false);

                doRequest();

            }
        });
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        requestQueue = Volley.newRequestQueue(getActivity());
        return inflater.inflate(R.layout.create_asset_fragment, container);
    }

    @Override
    public void onStart() {
        super.onStart();
        fetchEquipments();
        //getDialog().getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        getDialog().setCanceledOnTouchOutside(true);

    }

    private void doRequest(){

        JSONObject jsonObject = new JSONObject();

        try {
            jsonObject.put("amount", amount);
            jsonObject.put("equipment", equipmentSymbols.get(spinner.getSelectedItemPosition()));
        } catch (JSONException e) {
            e.printStackTrace();
        }

        JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, URL, jsonObject, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                Toast.makeText(getContext(), "asset created", Toast.LENGTH_SHORT).show();
                button.setEnabled(true);
                dismiss();
            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                button.setEnabled(true);
                Toast.makeText(getContext(), "An error occured creating asset", Toast.LENGTH_SHORT).show();
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

    private void fetchEquipments(){

        StringRequest request = new StringRequest(Request.Method.GET, "https://api.traiders.tk/equipment/", new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                List<Equipment> equipmentList = EquipmentMarshaller.unmarshallList(response);
                for(Equipment equipment: equipmentList){
                    equipmentSymbols.add(equipment.getSymbol());
                    equipmentNames.add(equipment.getName());
                }
                Collections.reverse(equipmentNames);
                Collections.reverse(equipmentSymbols);

                spinner.setAdapter(new ArrayAdapter<String>(getContext(), android.R.layout.simple_spinner_item, equipmentNames));
                spinner.setSelection(0);
                button.setEnabled(true);

            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getActivity(), "An error occured fetching equipments", Toast.LENGTH_SHORT).show();
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
