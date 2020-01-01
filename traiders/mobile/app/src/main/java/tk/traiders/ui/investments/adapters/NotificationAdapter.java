package tk.traiders.ui.investments.adapters;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.components.article.ViewArticleActivity;
import tk.traiders.marshallers.ArticleMarshaller;
import tk.traiders.marshallers.EventMarshaller;
import tk.traiders.models.Article;
import tk.traiders.models.Event;
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

        holder.linearLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String object = notification.getReferenceObject();

                if(object.equals("Article")){

                    StringRequest stringRequest = new StringRequest(Request.Method.GET, notification.getReferenceUrl(), new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            Log.d("response", response);
                            Article article = ArticleMarshaller.unmarshall(response);
                            Intent intent = new Intent(context, ViewArticleActivity.class);
                            intent.putExtra("article", article);
                            context.startActivity(intent);

                        }

                    }, new Response.ErrorListener() {

                        @Override
                        public void onErrorResponse(VolleyError error) {
                            Toast.makeText(context, "an error occured fetching article", Toast.LENGTH_SHORT).show();
                        }
                    }){

                        @Override
                        public Map<String, String> getHeaders() throws AuthFailureError {
                            Map<String, String> headers = MainActivity.getAuthorizationHeader(context);
                            return headers != null ? headers : super.getHeaders();
                        }

                    };


                    requestQueue.add(stringRequest);

                } else if(object.equals("Event")) {

                    StringRequest stringRequest = new StringRequest(Request.Method.GET, notification.getReferenceUrl(), new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            Event event = EventMarshaller.unmarshall(response);
                            Toast.makeText(context, "" + event.getEvent(), Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(Intent.ACTION_VIEW);
                            intent.setData(Uri.parse(event.getSourceURL()));
                            context.startActivity(intent);

                        }

                    }, new Response.ErrorListener() {

                        @Override
                        public void onErrorResponse(VolleyError error) {
                            Toast.makeText(context, "an error occured fetching event", Toast.LENGTH_SHORT).show();
                        }
                    }){

                        @Override
                        public Map<String, String> getHeaders() throws AuthFailureError {
                            Map<String, String> headers = MainActivity.getAuthorizationHeader(context);
                            return headers != null ? headers : super.getHeaders();
                        }

                    };


                    requestQueue.add(stringRequest);
                }
            }
        });

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

        LinearLayout linearLayout;
        TextView textView_message;
        TextView textView_reference;
        ImageView imageView;

        public NotificationViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_message = itemView.findViewById(R.id.textView_message);
            textView_reference = itemView.findViewById(R.id.textView_reference);
            imageView = itemView.findViewById(R.id.imageView);
            linearLayout = itemView.findViewById(R.id.linearLayout);


        }

    }
}
