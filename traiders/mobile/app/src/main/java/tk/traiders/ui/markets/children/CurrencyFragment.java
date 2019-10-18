package tk.traiders.ui.markets.children;

import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;

import tk.traiders.R;
import tk.traiders.ui.markets.adapters.CurrencyAdapter;


public class CurrencyFragment extends Fragment {

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        View rootView = inflater.inflate(R.layout.fragment_currency, container, false);

        final RecyclerView recyclerView = rootView.findViewById(R.id.recylerView_currency);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(getParentFragment().getActivity()));

        CurrencyAdapter adapter = new CurrencyAdapter(Arrays.asList("USD","TRY","JPN"));

        RequestQueue queue = Volley.newRequestQueue(getParentFragment().getActivity());

        final String URL = "https://api.traiders.tk/parity/";

        StringRequest request = new StringRequest(Request.Method.GET, URL, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                Log.d("response", response);
                ArrayList<String> elements = new ArrayList<>();

                try {
                    JSONArray jsonArray = new JSONArray(response);
                    for(int i = 0; i < jsonArray.length(); i++){
                        JSONObject jsonObject = (JSONObject) jsonArray.get(i);
                        String ratio = jsonObject.getString("ratio");
                        String base_symbol = jsonObject.getJSONObject("base_equipment").getString("symbol");
                        String target_symbol = jsonObject.getJSONObject("target_equipment").getString("symbol");
                        elements.add("1 " + base_symbol + " = " + ratio + " " + target_symbol);
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                recyclerView.setAdapter(new CurrencyAdapter(elements));
            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("error",error.toString());
            }
        });

        queue.add(request);

        return rootView;
    }


}
