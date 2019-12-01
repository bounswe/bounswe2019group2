package tk.traiders.ui.social.adapters;

import android.content.Context;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.common.api.Api;

import org.w3c.dom.Text;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.constants.EventConstants;
import tk.traiders.marshallers.FollowingMarshaller;
import tk.traiders.marshallers.UserMarshaller;
import tk.traiders.models.Following;
import tk.traiders.models.User;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;

public class UsersAdapter extends RecyclerView.Adapter<UsersAdapter.UsersViewHolder> {

    private String URL = "https://api.traiders.tk/following/";

    private Context context;
    private List<User> userList;
    private RequestQueue requestQueue;

    public UsersAdapter(Context context, List<User> userList) {
        this.context = context;
        requestQueue = Volley.newRequestQueue(context);
        this.userList = userList;
    }

    @NonNull
    @Override
    public UsersViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new UsersViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.user_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull UsersViewHolder holder, int position) {

        User user = userList.get(position);

        int avatar_drawable_id = ChooseAvatarActivity.getAvatarDrawableId(user.getAvatarId());

        holder.imageView.setImageDrawable(ContextCompat.getDrawable(context, avatar_drawable_id));
        holder.textView_username.setText(userList.get(position).getUsername());

        holder.button_follow.setVisibility(View.GONE);
        holder.button_unfollow.setVisibility(View.GONE);


        String userId = MainActivity.getUserID(context);

        Uri.Builder builder = Uri.parse(URL).buildUpon();
        builder.appendQueryParameter("user_following", String.valueOf(userId));
        builder.appendQueryParameter("user_followed", user.getId());

        String urlWithFilters = builder.build().toString();

        StringRequest request = new StringRequest(Request.Method.GET, urlWithFilters, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                List<Following> followingList = FollowingMarshaller.unmarshallList(response);
                if(followingList.isEmpty()) {
                    holder.button_follow.setVisibility(View.VISIBLE);
                    holder.button_unfollow.setVisibility(View.GONE);

                } else {
                    Following following = followingList.get(0);
                    holder.followingUrl = following.getUrl();
                    holder.button_follow.setVisibility(View.GONE);
                    holder.button_unfollow.setVisibility(View.VISIBLE);
                }
            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(context, "An error occured!", Toast.LENGTH_SHORT).show();
                error.printStackTrace();
            }
        }) {

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = MainActivity.getAuthorizationHeader(context);
                return headers != null ? headers : super.getHeaders();
            }
        };

        requestQueue.add(request);


        holder.button_follow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                StringRequest request = new StringRequest(Request.Method.POST, "https://api.traiders.tk/following/", new Response.Listener<String>() {

                    @Override
                    public void onResponse(String response) {
                        Following newFollowing = FollowingMarshaller.unmarshall(response);
                        holder.followingUrl = newFollowing.getUrl();
                        holder.button_unfollow.setVisibility(View.VISIBLE);
                        holder.button_follow.setVisibility(View.GONE);
                        Toast.makeText(context, "followed", Toast.LENGTH_SHORT).show();
                    }

                }, new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(context, "An error occured!", Toast.LENGTH_SHORT).show();
                        error.printStackTrace();
                    }
                }) {

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String> headers = MainActivity.getAuthorizationHeader(context);
                        return headers != null ? headers : super.getHeaders();
                    }

                    @Override
                    protected Map<String, String> getParams() throws AuthFailureError {
                        Map<String, String> params = new HashMap<>();
                        params.put("user_followed", user.getUrl());
                        return params;
                    }
                };

                requestQueue.add(request);
            }
        });

        holder.button_unfollow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                StringRequest request = new StringRequest(Request.Method.DELETE, holder.followingUrl, new Response.Listener<String>() {

                    @Override
                    public void onResponse(String response) {
                        holder.button_unfollow.setVisibility(View.GONE);
                        holder.button_follow.setVisibility(View.VISIBLE);
                        Toast.makeText(context, "Unfollowed", Toast.LENGTH_SHORT).show();
                    }

                }, new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(context, "An error occured!", Toast.LENGTH_SHORT).show();
                        error.printStackTrace();
                    }
                }) {

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String> headers = MainActivity.getAuthorizationHeader(context);
                        return headers != null ? headers : super.getHeaders();
                    }
                };

                requestQueue.add(request);
            }
        });

    }

    @Override
    public int getItemCount() {
        return userList.size();
    }

    public static class UsersViewHolder extends RecyclerView.ViewHolder {

        private ImageView imageView;
        private TextView textView_username;
        private Button button_follow;
        private Button button_unfollow;
        private String followingUrl = null;

        public UsersViewHolder(@NonNull View itemView) {
            super(itemView);
            imageView = itemView.findViewById(R.id.imageView_userAvatar);
            textView_username = itemView.findViewById(R.id.textView_username);
            button_follow = itemView.findViewById(R.id.button_follow);
            button_unfollow = itemView.findViewById(R.id.button_unfollow);
        }
    }
}
