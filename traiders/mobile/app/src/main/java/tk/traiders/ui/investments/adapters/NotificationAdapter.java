package tk.traiders.ui.investments.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.components.article.ViewArticleActivity;
import tk.traiders.models.Article;
import tk.traiders.models.Notification;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;

public class NotificationAdapter extends RecyclerView.Adapter<NotificationAdapter.NotificationViewHolder> {

    private Context context;
    private List<Notification> notificationList;
    private RequestQueue requestQueue;

    public NotificationAdapter(Context context, List<Notification> notificationList) {
        this.context = context;
        this.notificationList = notificationList;
        this.requestQueue = Volley.newRequestQueue(context);
    }

    @NonNull
    @Override
    public NotificationViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new NotificationViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.notification_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull NotificationViewHolder holder, int position) {
        Notification notification = notificationList.get(position);
        holder.textView_message.setText(notification.getReferenceObject());
        holder.textView_reference.setText(notification.getMessage());
        if(!notification.isSeen()){
            holder.imageView.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_notifications_active_24dp));

            StringRequest patchRequest = new StringRequest(Request.Method.PATCH, notification.getUrl(),
                    new Response.Listener<String>()
                    {
                        @Override
                        public void onResponse(String response) {

                        }
                    },
                    new Response.ErrorListener()
                    {
                        @Override
                        public void onErrorResponse(VolleyError error) {
                            error.printStackTrace();
                        }
                    }
            ) {

                @Override
                public Map<String, String> getHeaders() throws AuthFailureError {
                    Map<String, String> headers = MainActivity.getAuthorizationHeader(context);
                    return headers != null ? headers : super.getHeaders();
                }

                @Override
                protected Map<String, String> getParams()
                {
                    Map<String, String>  params = new HashMap<String, String>();
                    params.put("seen", "true");
                    return params;
                }
            };

            requestQueue.add(patchRequest);


        }
    }


    @Override
    public int getItemCount() {
        return notificationList.size();
    }

    public static class NotificationViewHolder extends RecyclerView.ViewHolder {

        TextView textView_message;
        TextView textView_reference;
        ImageView imageView;

        public NotificationViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_message = itemView.findViewById(R.id.textView_message);
            textView_reference = itemView.findViewById(R.id.textView_reference);
            imageView = itemView.findViewById(R.id.imageView);


        }

    }
}
