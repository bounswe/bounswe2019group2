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

import java.lang.reflect.Method;
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
import tk.traiders.marshallers.PortfolioMarshaller;
import tk.traiders.models.Annotation;
import tk.traiders.models.Equipment;
import tk.traiders.models.Portfolio;
import tk.traiders.models.PortfolioItem;

public class EditPortfolioFragment extends DialogFragment {

    private static final String URL = "https://api.traiders.tk/portfolio/";

    private RequestQueue requestQueue;
    private Integer count;
    private Integer deleteCounter;
    private EditText editText;
    private ImageView imageView;
    private LinearLayout linearLayout;
    private Button button;
    private Portfolio portfolio;
    private List<String> equipmentSymbols = new ArrayList<>();
    private List<String> equipmentNames = new ArrayList<>();

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

        linearLayout = view.findViewById(R.id.linearLayout);
        linearLayout.setVisibility(View.VISIBLE);

        imageView = view.findViewById(R.id.imageView);

        imageView.setEnabled(false);
        imageView.setVisibility(View.VISIBLE);

        button = view.findViewById(R.id.button);

        button.setText("UPDATE");

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                List<Pair<String, String>> pairs = new ArrayList<>();

                for(int i = 0; i < linearLayout.getChildCount(); i++){
                    View view1 = linearLayout.getChildAt(i);

                    Spinner base = view1.findViewById(R.id.spinner_base);
                    Spinner target = view1.findViewById(R.id.spinner_target);

                    String baseEqu = equipmentSymbols.get(base.getSelectedItemPosition());
                    String targetEqu = equipmentSymbols.get(target.getSelectedItemPosition());

                    pairs.add(new Pair<String, String>(baseEqu, targetEqu));

                }

                doDelete(pairs);


            }
        });

        imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                View rootView = View.inflate(getContext(),R.layout.create_portfolio_item_list_item, null);
                Spinner spinner_base = rootView.findViewById(R.id.spinner_base);
                Spinner spinner_target = rootView.findViewById(R.id.spinner_target);
                ImageView imageView1 = rootView.findViewById(R.id.imageView);

                spinner_base.setAdapter(new ArrayAdapter<>(getContext(), android.R.layout.simple_spinner_item, equipmentSymbols));
                spinner_target.setAdapter(new ArrayAdapter<>(getContext(), android.R.layout.simple_spinner_item, equipmentSymbols));

                linearLayout.addView(rootView);

                imageView1.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        linearLayout.removeView(rootView);
                    }
                });

            }
        });




    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        requestQueue = Volley.newRequestQueue(getActivity());
        return inflater.inflate(R.layout.fragment_create_portfolio, container);
    }

    @Override
    public void onStart() {
        super.onStart();
        getDialog().getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        getDialog().setCanceledOnTouchOutside(true);
        fetchEquipments();

    }

    private void doDelete(List<Pair<String, String>> pairs) {

        deleteCounter = portfolio.getPortfolioItemList().size();

        if(deleteCounter == 0){
            doRequest(pairs);
            return;
        }

        for(PortfolioItem portfolioItem : portfolio.getPortfolioItemList()){


            StringRequest stringRequest= new StringRequest(Request.Method.DELETE, portfolioItem.getUrl(), new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    synchronized (deleteCounter){
                        deleteCounter--;
                        if(deleteCounter == 0){
                            doRequest(pairs);
                        }
                    }
                }
            }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(getContext(), "an error occured during deletion", Toast.LENGTH_SHORT).show();
                }
            }){
                @Override
                public Map<String, String> getHeaders() throws AuthFailureError {
                    Map<String, String> headers = MainActivity.getAuthorizationHeader(getActivity());
                    return headers != null ? headers : super.getHeaders();
                }
            };

            requestQueue.add(stringRequest);
        }
    }

    private void doRequest(List<Pair<String, String>> pairs){



        count = pairs.size();

        for(Pair<String, String> pair: pairs) {

            JSONObject jsonObject = new JSONObject();

            try {
                jsonObject.put("base_equipment", pair.first);
                jsonObject.put("target_equipment", pair.second);
                jsonObject.put("portfolio", portfolio.getUrl());

            } catch (JSONException e) {
                e.printStackTrace();
            }


            JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, "https://api.traiders.tk/portfolioitem/", jsonObject, new Response.Listener<JSONObject>() {

                @Override
                public void onResponse(JSONObject response) {
                    synchronized (count){
                        count--;
                        if(count == 0){
                            dismiss();
                            Toast.makeText(getContext(), "portfolio updated", Toast.LENGTH_SHORT).show();
                        }
                    }
                }

            }, new Response.ErrorListener() {

                @Override
                public void onErrorResponse(VolleyError error) {
                    button.setEnabled(true);
                    Toast.makeText(getContext(), "An error occured creating portfolio item", Toast.LENGTH_SHORT).show();
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

    private void fetchEquipments() {

        StringRequest request = new StringRequest(Request.Method.GET, "https://api.traiders.tk/equipment/", new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                List<Equipment> equipmentList = EquipmentMarshaller.unmarshallList(response);
                for (Equipment equipment : equipmentList) {
                    equipmentSymbols.add(equipment.getSymbol());
                    equipmentNames.add(equipment.getName());
                }

                fetchPortfolio(getArguments().getString("url"));

                imageView.setEnabled(true);

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

    private void fetchPortfolio(String url) {

        StringRequest request = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                portfolio = PortfolioMarshaller.unmarshall(response);
                editText.setText(portfolio.getName());

                for(PortfolioItem portfolioItem: portfolio.getPortfolioItemList()){
                    View rootView = View.inflate(getContext(),R.layout.create_portfolio_item_list_item, null);
                    Spinner spinner_base = rootView.findViewById(R.id.spinner_base);
                    spinner_base.setAdapter(new ArrayAdapter<>(getContext(), android.R.layout.simple_spinner_item, equipmentSymbols));
                    spinner_base.setSelection(equipmentSymbols.indexOf(portfolioItem.getBaseEquipment()));
                    Spinner spinner_target = rootView.findViewById(R.id.spinner_target);
                    spinner_target.setAdapter(new ArrayAdapter<>(getContext(), android.R.layout.simple_spinner_item, equipmentSymbols));
                    spinner_target.setSelection(equipmentSymbols.indexOf(portfolioItem.getTargetEquipment()));
                    ImageView imageView1 = rootView.findViewById(R.id.imageView);
                    linearLayout.addView(rootView);
                    imageView1.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            linearLayout.removeView(rootView);
                        }
                    });
                }


            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getActivity(), "An error occured fetching portfolio", Toast.LENGTH_SHORT).show();
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
