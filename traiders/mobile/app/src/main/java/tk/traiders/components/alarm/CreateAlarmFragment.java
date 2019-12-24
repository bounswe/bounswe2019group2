package tk.traiders.components.alarm;

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
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.SignUpActivity;
import tk.traiders.marshallers.AnnotationMarshaller;
import tk.traiders.marshallers.EquipmentMarshaller;
import tk.traiders.models.Annotation;
import tk.traiders.models.Equipment;

public class CreateAlarmFragment extends DialogFragment {

    private static final String URL = "https://annotation.traiders.tk/alert/";

    private RequestQueue requestQueue;
    private ArrayList<String> equipmentSymbols = new ArrayList<>();
    private ArrayList<String> equipmentNames = new ArrayList<>();
    private String baseSymbol;
    private String targetSymbol;

    private Spinner spinner_base;
    private Spinner spinner_target;
    private EditText editText_ratio;
    private Button button_up;
    private Button button_down;
    private ImageView button_swap;


    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        spinner_base = view.findViewById(R.id.spinner_base);
        spinner_target = view.findViewById(R.id.spinner_target);
        editText_ratio = view.findViewById(R.id.editText_ratio);
        button_up = view.findViewById(R.id.button_up);
        button_down = view.findViewById(R.id.button_down);
        button_swap = view.findViewById(R.id.imageView_swap);
        button_swap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int temp = spinner_base.getSelectedItemPosition();
                spinner_base.setSelection(spinner_target.getSelectedItemPosition());
                spinner_target.setSelection(temp);
            }
        });
        button_up.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String ratio = editText_ratio.getText().toString();

                if(TextUtils.isEmpty(ratio)){
                    editText_ratio.setError("enter a ratio!");
                    return;
                }

                double ratiod = Double.valueOf(ratio);

                button_up.setEnabled(false);
                button_down.setEnabled(false);

                String baseSymbol = equipmentSymbols.get(spinner_base.getSelectedItemPosition());
                String targetSymbol = equipmentSymbols.get(spinner_target.getSelectedItemPosition());

                JSONObject jsonObject = new JSONObject();

                try {
                    jsonObject.put("base_symbol", baseSymbol);
                    jsonObject.put("target_symbol", targetSymbol);
                    jsonObject.put("ratio", ratiod);
                    jsonObject.put("increasing", true);

                } catch (JSONException e) {
                    e.printStackTrace();
                }


                JsonObjectRequest postRequest = new JsonObjectRequest(Request.Method.POST, URL, jsonObject,
                        new Response.Listener<JSONObject>()
                        {
                            @Override
                            public void onResponse(JSONObject response) {
                                // response
                                Toast.makeText(getContext(), "Alarm created!", Toast.LENGTH_SHORT).show();
                                button_down.setEnabled(true);
                                button_up.setEnabled(true);
                                dismiss();
                            }
                        },
                        new Response.ErrorListener()
                        {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Toast.makeText(getContext(), "An error occured!", Toast.LENGTH_SHORT).show();
                                error.printStackTrace();
                                button_down.setEnabled(true);
                                button_up.setEnabled(true);
                            }
                        }
                ){
                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        return MainActivity.getAuthorizationHeader(getContext());
                    }
                };

                requestQueue.add(postRequest);

            }
        });

        button_down.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String ratio = editText_ratio.getText().toString();

                if(TextUtils.isEmpty(ratio)){
                    editText_ratio.setError("enter a ratio!");
                    return;
                }

                double ratiod = Double.valueOf(ratio);

                button_up.setEnabled(false);
                button_down.setEnabled(false);

                String baseSymbol = equipmentSymbols.get(spinner_base.getSelectedItemPosition());
                String targetSymbol = equipmentSymbols.get(spinner_target.getSelectedItemPosition());

                JSONObject jsonObject = new JSONObject();

                try {
                    jsonObject.put("base_symbol", baseSymbol);
                    jsonObject.put("target_symbol", targetSymbol);
                    jsonObject.put("ratio", ratiod);
                    jsonObject.put("increasing", false);

                } catch (JSONException e) {
                    e.printStackTrace();
                }


                JsonObjectRequest postRequest = new JsonObjectRequest(Request.Method.POST, URL, jsonObject,
                        new Response.Listener<JSONObject>()
                        {
                            @Override
                            public void onResponse(JSONObject response) {
                                // response
                                Toast.makeText(getContext(), "Alarm created!", Toast.LENGTH_SHORT).show();
                                button_down.setEnabled(true);
                                button_up.setEnabled(true);
                                dismiss();
                            }
                        },
                        new Response.ErrorListener()
                        {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Toast.makeText(getContext(), "An error occured!", Toast.LENGTH_SHORT).show();
                                error.printStackTrace();
                                button_down.setEnabled(true);
                                button_up.setEnabled(true);
                            }
                        }
                ){
                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        return MainActivity.getAuthorizationHeader(getContext());
                    }
                };

                requestQueue.add(postRequest);
            }
        });

        getDialog().setTitle("Create Alarm");

    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        requestQueue = Volley.newRequestQueue(getActivity());
        return inflater.inflate(R.layout.fragment_create_alarm, container);
    }

    @Override
    public void onStart() {
        super.onStart();
        //getDialog().getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        getDialog().setCanceledOnTouchOutside(true);
        fetchEquipments();

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


                spinner_base.setAdapter(new ArrayAdapter<String>(getContext(), android.R.layout.simple_spinner_item, equipmentNames));
                spinner_target.setAdapter(new ArrayAdapter<String>(getContext(), android.R.layout.simple_spinner_item, equipmentNames));
                spinner_base.setSelection(0);
                spinner_target.setSelection(0);

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
