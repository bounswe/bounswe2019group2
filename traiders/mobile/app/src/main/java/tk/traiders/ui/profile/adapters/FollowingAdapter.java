package tk.traiders.ui.profile.adapters;

import android.content.Context;
import android.media.Image;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.ConstraintLayout;
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.marshallers.FollowingMarshaller;
import tk.traiders.marshallers.UserMarshaller;
import tk.traiders.models.Following;
import tk.traiders.models.User;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;

public class FollowingAdapter extends RecyclerView.Adapter<FollowingAdapter.FollowingViewHolder> {

    private Context context;
    private List<Following> followingList;
    private RequestQueue requestQueue;
    private String page;

    public FollowingAdapter(Context context, List<Following> followingList, String page) {
        this.context = context;
        requestQueue = Volley.newRequestQueue(context);
        this.followingList = followingList;
        this.page = page;
    }


    @NonNull
    @Override
    public FollowingViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new FollowingViewHolder(LayoutInflater.from(context).inflate(R.layout.user_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull FollowingViewHolder holder, int position) {

        Following following = followingList.get(position);

        String URL = null;

        if(page.equals("following")) {
            URL = following.getUser_followed();

            holder.button_follow.setVisibility(View.GONE);
            holder.button_unfollow.setVisibility(View.VISIBLE);

            holder.button_follow.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {

                    StringRequest request = new StringRequest(Request.Method.POST, "https://api.traiders.tk/following/", new Response.Listener<String>() {

                        @Override
                        public void onResponse(String response) {
                            Following newFollowing = FollowingMarshaller.unmarshall(response);
                            followingList.set(position, newFollowing);
                            notifyItemChanged(position);
                            holder.button_unfollow.setVisibility(View.VISIBLE);
                            holder.button_follow.setVisibility(View.GONE);
                            Toast.makeText(context, "followed back", Toast.LENGTH_SHORT).show();
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
                            params.put("user_followed", following.getUser_followed());
                            return params;
                        }
                    };

                    requestQueue.add(request);


                }
            });

            holder.button_unfollow.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {

                    StringRequest request = new StringRequest(Request.Method.DELETE, following.getUrl(), new Response.Listener<String>() {

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

        } else if(page.equals("followers")) {
            URL = following.getUser_following();

            holder.button_follow.setVisibility(View.GONE);
            holder.button_unfollow.setVisibility(View.GONE);

        } else {
            URL = "";

            holder.button_follow.setVisibility(View.GONE);
            holder.button_unfollow.setVisibility(View.GONE);
        }

        StringRequest request = new StringRequest(Request.Method.GET, URL, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                User user = UserMarshaller.unmarshall(response);
                holder.textView_username.setText(user.getUsername());
                holder.imageView_avatar.setImageDrawable(ContextCompat.getDrawable(context, ChooseAvatarActivity.getAvatarDrawableId(user.getAvatarId())));
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

    @Override
    public int getItemCount() {
        return followingList.size();
    }

    public static class FollowingViewHolder extends RecyclerView.ViewHolder {

        public ImageView imageView_avatar;
        public TextView textView_username;
        public Button button_follow;
        public Button button_unfollow;

        public FollowingViewHolder(@NonNull View itemView) {
            super(itemView);
            imageView_avatar = itemView.findViewById(R.id.imageView_userAvatar);
            textView_username = itemView.findViewById(R.id.textView_username);
            button_follow = itemView.findViewById(R.id.button_follow);
            button_unfollow = itemView.findViewById(R.id.button_unfollow);
        }
    }
}
