package tk.traiders.ui.markets.children;

import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

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

import tk.traiders.ui.markets.adapters.StockAdapter;


public class StockFragment extends Fragment {

    private ProgressBar progressBar_loading;
    private RecyclerView recyclerView_stock;
    private ImageView imageView_error;
    private TextView textView_error;
    private SwipeRefreshLayout swipeRefreshLayout_stock;

    final private static String URL = "https://api.traiders.tk/parity/latest?category=stock";
    private RequestQueue requestQueue;


    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        View rootView = inflater.inflate(R.layout.fragment_stock, container, false);

        progressBar_loading = rootView.findViewById(R.id.progressBar_loading);
        imageView_error = rootView.findViewById(R.id.imageView_error);
        textView_error = rootView.findViewById(R.id.textView_error);

        progressBar_loading.setVisibility(View.VISIBLE);
        imageView_error.setVisibility(View.GONE);
        textView_error.setVisibility(View.GONE);

        swipeRefreshLayout_stock = rootView.findViewById(R.id.swipeRefreshLayout_stock);

        swipeRefreshLayout_stock.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                fetchData();
            }
        });

        recyclerView_stock = rootView.findViewById(R.id.recylerView_stock);

        recyclerView_stock.setVisibility(View.VISIBLE);
        recyclerView_stock.setHasFixedSize(true);
        recyclerView_stock.setLayoutManager(new LinearLayoutManager(getParentFragment().getActivity()));

        requestQueue = Volley.newRequestQueue(getParentFragment().getActivity());

        fetchData();

        return rootView;
    }

    private void fetchData() {

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

                textView_error.setVisibility(View.GONE);
                imageView_error.setVisibility(View.GONE);
                progressBar_loading.setVisibility(View.GONE);
                swipeRefreshLayout_stock.setRefreshing(false);
                recyclerView_stock.setVisibility(View.VISIBLE);
                recyclerView_stock.setAdapter(new StockAdapter(elements));
            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                progressBar_loading.setVisibility(View.GONE);
                imageView_error.setVisibility(View.VISIBLE);
                textView_error.setVisibility(View.VISIBLE);
                recyclerView_stock.setVisibility(View.GONE);
                swipeRefreshLayout_stock.setRefreshing(false);
                Log.d("error",error.toString());
            }
        });

        requestQueue.add(request);
    }


}
