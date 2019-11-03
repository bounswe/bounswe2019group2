package tk.traiders.ui;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.List;

import tk.traiders.R;
import tk.traiders.utils.MarshallerUtils;

public abstract class ListFragment extends Fragment {

    protected abstract String getURL();
    protected abstract RecyclerView.Adapter getAdapter(String response);

    private RequestQueue requestQueue;
    private RecyclerView recyclerView;
    private SwipeRefreshLayout swipeRefreshLayout;
    private ProgressBar progressBar_loading;
    private ImageView imageView_error;
    private TextView textView_error;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        View rootView = inflater.inflate(R.layout.list_common, container, false);

        progressBar_loading = rootView.findViewById(R.id.progressBar_loading);
        imageView_error = rootView.findViewById(R.id.imageView_error);
        textView_error = rootView.findViewById(R.id.textView_error);

        progressBar_loading.setVisibility(View.VISIBLE);
        imageView_error.setVisibility(View.GONE);
        textView_error.setVisibility(View.GONE);

        recyclerView = rootView.findViewById(R.id.recylerView);

        recyclerView.setVisibility(View.VISIBLE);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(getParentFragment().getActivity()));

        swipeRefreshLayout = rootView.findViewById(R.id.swipeRefreshLayout);
        swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                fetchData();
            }
        });

        requestQueue = Volley.newRequestQueue(getParentFragment().getActivity());

        fetchData();

        return rootView;
    }

    private void fetchData() {

        StringRequest request = new StringRequest(Request.Method.GET, getURL(), new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {

                String UTF8_response = MarshallerUtils.convertToUTF8(response);

                textView_error.setVisibility(View.GONE);
                imageView_error.setVisibility(View.GONE);
                progressBar_loading.setVisibility(View.GONE);
                swipeRefreshLayout.setRefreshing(false);
                recyclerView.setVisibility(View.VISIBLE);
                recyclerView.setAdapter(getAdapter(UTF8_response));

            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                progressBar_loading.setVisibility(View.GONE);
                imageView_error.setVisibility(View.VISIBLE);
                textView_error.setVisibility(View.VISIBLE);
                recyclerView.setVisibility(View.GONE);
                swipeRefreshLayout.setRefreshing(false);
            }
        });

        requestQueue.add(request);
    }
}
