package tk.traiders.ui.search.children;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.KeyboardShortcutGroup;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.components.article.ViewArticleActivity;
import tk.traiders.components.article.adapters.CommentAdapter;
import tk.traiders.marshallers.ArticleMarshaller;
import tk.traiders.marshallers.CommentMarshaller;
import tk.traiders.marshallers.EquipmentMarshaller;
import tk.traiders.marshallers.EventMarshaller;
import tk.traiders.marshallers.UserMarshaller;
import tk.traiders.models.Article;
import tk.traiders.models.Comment;
import tk.traiders.models.Equipment;
import tk.traiders.models.Event;
import tk.traiders.models.User;
import tk.traiders.ui.social.adapters.ArticlesAdapter;
import tk.traiders.ui.social.adapters.EquipmentAdapter;
import tk.traiders.ui.social.adapters.EventsAdapter;
import tk.traiders.ui.social.adapters.UsersAdapter;
import tk.traiders.utils.MarshallerUtils;

public class RecommendationsFragment extends Fragment {

    private String URL = "https://api.traiders.tk/recommendation/";

    private RequestQueue requestQueue;


    private ImageView imageView_search_articles;
    private RecyclerView recyclerView_search_articles;

    private ImageView imageView_search_events;
    private RecyclerView recyclerView_search_events;

    private ImageView imageView_search_users;
    private RecyclerView recyclerView_search_users;

    private ImageView imageView_search_equipment;
    private RecyclerView recyclerView_search_equipment;

    private ImageView imageView_search_parities;
    private RecyclerView recyclerView_search_parities;

    private boolean isShowingArticles = false;
    private boolean isShowingEvents = false;
    private boolean isShowingUsers = false;
    private boolean isShowingEquipment = false;
    private boolean isShowingParities = false;

    private TextView textView_articlesCount;
    private TextView textView_eventsCount;
    private TextView textView_usersCount;
    private TextView textView_paritiesCount;
    private TextView textView_equipmentCount;

    private ImageView imageView_search;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestQueue = Volley.newRequestQueue(getParentFragment().getActivity());

    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        View rootView = inflater.inflate(R.layout.fragment_recommendations, container, false);

        imageView_search = rootView.findViewById(R.id.imageView_search);

        imageView_search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                imageView_search.setEnabled(false);
                getRecommendations();
            }
        });

        imageView_search_articles = rootView.findViewById(R.id.imageView_search_articles);

        imageView_search_articles.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(isShowingArticles) {
                    recyclerView_search_articles.setVisibility(View.GONE);
                    imageView_search_articles.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_down_24dp));
                    isShowingArticles = false;
                } else {
                    recyclerView_search_articles.setVisibility(View.VISIBLE);
                    imageView_search_articles.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_up_24dp));
                    isShowingArticles = true;
                }
            }
        });

        recyclerView_search_articles = rootView.findViewById(R.id.recylerView_search_articles);

        recyclerView_search_articles.setHasFixedSize(true);
        recyclerView_search_articles.setLayoutManager(new LinearLayoutManager(getParentFragment().getActivity()));

        imageView_search_events = rootView.findViewById(R.id.imageView_search_events);

        imageView_search_events.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(isShowingEvents) {
                    recyclerView_search_events.setVisibility(View.GONE);
                    imageView_search_events.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_down_24dp));
                    isShowingEvents = false;
                } else {
                    recyclerView_search_events.setVisibility(View.VISIBLE);
                    imageView_search_events.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_up_24dp));
                    isShowingEvents = true;
                }
            }
        });

        recyclerView_search_events = rootView.findViewById(R.id.recylerView_search_events);

        recyclerView_search_events.setHasFixedSize(true);
        recyclerView_search_events.setLayoutManager(new LinearLayoutManager(getParentFragment().getActivity()));

        imageView_search_users = rootView.findViewById(R.id.imageView_search_users);

        imageView_search_users.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(isShowingUsers) {
                    recyclerView_search_users.setVisibility(View.GONE);
                    imageView_search_users.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_down_24dp));
                    isShowingUsers = false;
                } else {
                    recyclerView_search_users.setVisibility(View.VISIBLE);
                    imageView_search_users.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_up_24dp));
                    isShowingUsers = true;
                }
            }
        });

        recyclerView_search_users = rootView.findViewById(R.id.recylerView_search_users);

        recyclerView_search_users.setHasFixedSize(true);
        recyclerView_search_users.setLayoutManager(new LinearLayoutManager(getParentFragment().getActivity()));

        imageView_search_equipment = rootView.findViewById(R.id.imageView_search_equipment);

        imageView_search_equipment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(isShowingEquipment) {
                    recyclerView_search_equipment.setVisibility(View.GONE);
                    imageView_search_equipment.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_down_24dp));
                    isShowingEquipment = false;
                } else {
                    recyclerView_search_equipment.setVisibility(View.VISIBLE);
                    imageView_search_equipment.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_up_24dp));
                    isShowingEquipment = true;
                }
            }
        });

        recyclerView_search_equipment = rootView.findViewById(R.id.recylerView_search_equipment);

        recyclerView_search_equipment.setHasFixedSize(true);
        recyclerView_search_equipment.setLayoutManager(new LinearLayoutManager(getParentFragment().getActivity()));

        imageView_search_parities = rootView.findViewById(R.id.imageView_search_parity);

        imageView_search_parities.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(isShowingParities) {
                    recyclerView_search_parities.setVisibility(View.GONE);
                    imageView_search_parities.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_down_24dp));
                    isShowingParities = false;
                } else {
                    recyclerView_search_parities.setVisibility(View.VISIBLE);
                    imageView_search_parities.setImageDrawable(ContextCompat.getDrawable(getContext(), R.drawable.ic_keyboard_arrow_up_24dp));
                    isShowingParities = true;
                }
            }
        });

        recyclerView_search_parities = rootView.findViewById(R.id.recylerView_search_parity);

        recyclerView_search_parities.setHasFixedSize(true);
        recyclerView_search_parities.setLayoutManager(new LinearLayoutManager(getParentFragment().getActivity()));

        textView_articlesCount = rootView.findViewById(R.id.textView_search_articlesCount);
        textView_eventsCount = rootView.findViewById(R.id.textView_search_eventsCount);
        textView_usersCount = rootView.findViewById(R.id.textView_search_usersCount);
        textView_equipmentCount = rootView.findViewById(R.id.textView_search_equipmentCount);
        textView_paritiesCount = rootView.findViewById(R.id.textView_search_parityCount);

        getRecommendations();

        return rootView;
    }

    @Override
    public void onResume() {
        super.onResume();
    }

    private void getRecommendations(){

        StringRequest request = new StringRequest(Request.Method.GET, URL, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {

                try {
                    imageView_search.setEnabled(true);

                    String responseAsUTF8 = MarshallerUtils.convertToUTF8(response);

                    JSONObject searchResultsAsJsonObject = new JSONObject(responseAsUTF8);

                    String searchResponseForArticles = searchResultsAsJsonObject.getString("articles");

                    List<Article> articleList = ArticleMarshaller.unmarshallList(searchResponseForArticles);

                    textView_articlesCount.setText(articleList.size() + " Articles");

                    recyclerView_search_articles.setAdapter(new ArticlesAdapter(getContext(), articleList));

                    String searchResponseForEvents = searchResultsAsJsonObject.getString("events");

                    List<Event> eventList = EventMarshaller.unmarshallList(searchResponseForEvents);

                    textView_eventsCount.setText(eventList.size() + " Events");

                    recyclerView_search_events.setAdapter(new EventsAdapter(getContext(), eventList));

                    String searchResponseForUsers = searchResultsAsJsonObject.getString("users");

                    List<User> userList = UserMarshaller.unmarshallList(searchResponseForUsers);

                    textView_usersCount.setText(userList.size() + " Users");

                    recyclerView_search_users.setAdapter(new UsersAdapter(getContext(), userList));

                    String searchResponseForEquipment = searchResultsAsJsonObject.getString("equipments");

                    List<Equipment> equipmentList = EquipmentMarshaller.unmarshallList(searchResponseForEquipment);

                    textView_equipmentCount.setText(equipmentList.size() + " Equipment");

                    recyclerView_search_equipment.setAdapter(new EquipmentAdapter(getContext(), equipmentList));

                    textView_paritiesCount.setText(0 + " Parities");


                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                imageView_search.setEnabled(true);
                Toast.makeText(getContext(), "An error occured fetching recommendations!", Toast.LENGTH_SHORT).show();
                error.printStackTrace();
            }
        }){
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                return MainActivity.getAuthorizationHeader(getContext());
            }
        };

        requestQueue.add(request);

        Toast.makeText(getContext(), "Fetching recommendations...", Toast.LENGTH_LONG).show();

    }


}
