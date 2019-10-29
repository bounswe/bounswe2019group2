package tk.traiders.ui.social.children;

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
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import tk.traiders.R;
import tk.traiders.models.Article;
import tk.traiders.ui.markets.adapters.CurrencyAdapter;
import tk.traiders.ui.social.adapters.ArticlesAdapter;

public class ArticlesFragment extends Fragment {

    final private static String URL = "https://api.traiders.tk/articles/";

    private RecyclerView recyclerView_articles;
    private RequestQueue requestQueue;
    private SwipeRefreshLayout swipeRefreshLayout;
    private ProgressBar progressBar_loading;
    private ImageView imageView_error;
    private TextView textView_error;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        View rootView = inflater.inflate(R.layout.fragment_articles, container, false);

        progressBar_loading = rootView.findViewById(R.id.progressBar_loading);
        imageView_error = rootView.findViewById(R.id.imageView_error);
        textView_error = rootView.findViewById(R.id.textView_error);

        progressBar_loading.setVisibility(View.VISIBLE);
        imageView_error.setVisibility(View.GONE);
        textView_error.setVisibility(View.GONE);

        recyclerView_articles = rootView.findViewById(R.id.fragmentArticles_recylerView);

        recyclerView_articles.setVisibility(View.VISIBLE);
        recyclerView_articles.setHasFixedSize(true);
        recyclerView_articles.setLayoutManager(new LinearLayoutManager(getParentFragment().getActivity()));

        swipeRefreshLayout = rootView.findViewById(R.id.swipeRefreshLayout_article);
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

        StringRequest request = new StringRequest(Request.Method.GET, URL, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {

                swipeRefreshLayout.setRefreshing(false);

                String UTF8_response = null;

                try {
                    UTF8_response = new String(response.getBytes("ISO-8859-1"), "UTF-8");
                } catch (UnsupportedEncodingException e) {

                    e.printStackTrace();
                }

                Log.d("response", UTF8_response);

                List<Article> articleList = new ArrayList<>();

                try {
                    JSONArray articleListAsJson = new JSONArray(UTF8_response);
                    for(int i = 0; i < articleListAsJson.length(); i++){
                        JSONObject articleAsJson = (JSONObject) articleListAsJson.get(i);
                        String url = articleAsJson.getString("url");
                        String title  = articleAsJson.getString("title");
                        String created_at = articleAsJson.getString("created_at");
                        String content = articleAsJson.getString("content");
                        String image = articleAsJson.getString("image");
                        String id = articleAsJson.getString("id");
                        articleList.add(new Article(url, title, created_at, content, image, id));
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                textView_error.setVisibility(View.GONE);
                imageView_error.setVisibility(View.GONE);
                progressBar_loading.setVisibility(View.GONE);
                swipeRefreshLayout.setRefreshing(false);
                recyclerView_articles.setVisibility(View.VISIBLE);
                recyclerView_articles.setAdapter(new ArticlesAdapter(getActivity(), articleList));

            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                progressBar_loading.setVisibility(View.GONE);
                imageView_error.setVisibility(View.VISIBLE);
                textView_error.setVisibility(View.VISIBLE);
                recyclerView_articles.setVisibility(View.GONE);
                swipeRefreshLayout.setRefreshing(false);
                Log.d("error",error.toString());
            }
        });

        requestQueue.add(request);
    }
}
