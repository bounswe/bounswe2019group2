package tk.traiders.ui.social.adapters;

import android.content.Context;
import android.content.Intent;
import android.media.Image;
import android.net.Uri;
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
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.LoginActivity;
import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.constants.EventConstants;
import tk.traiders.models.Event;

public class EventsAdapter extends RecyclerView.Adapter<EventsAdapter.EventsViewHolder> {

    private Context context;
    private List<Event> events;

    public EventsAdapter(Context context, List<Event> events) {
        this.context = context;
        this.events = events;
    }

    @NonNull
    @Override
    public EventsViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new EventsViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.event_list_item, parent, false));

    }

    @Override
    public void onBindViewHolder(@NonNull EventsViewHolder holder, int position) {
        Event event = events.get(position);

        holder.textView_country.setText(event.getCountry());
        holder.textView_date.setText(event.getDate());
        holder.textView_title.setText(event.getEvent());
        holder.textView_actual.setText(event.getActual());
        holder.textView_previous.setText(event.getPrevious());
        holder.textView_forecast.setText(event.getForecast());

        if(event.getImportance() >= 1) {
            holder.imageView_firstStar.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_star_yellow_16dp));
        }

        if(event.getImportance() >= 2) {
            holder.imageView_secondStar.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_star_yellow_16dp));
        }

        if(event.getImportance() >= 3) {
            holder.imageView_thirdStar.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_star_yellow_16dp));
        }

        if(event.isTracking()) {
            holder.imageView_track.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_notifications_active_24dp));
        } else {
            holder.imageView_track.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_notifications_24dp));
        }

        holder.imageView_track.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(MainActivity.isUserLoggedIn(context)) {

                    StringRequest request = new StringRequest(Request.Method.PATCH, event.getUrl(), new Response.Listener<String>() {

                        @Override
                        public void onResponse(String response) {
                            event.setTracking(!event.isTracking());
                            if(event.isTracking()){
                                holder.imageView_track.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_notifications_active_24dp));
                                Toast.makeText(context, "tracking", Toast.LENGTH_SHORT).show();
                            } else {
                                holder.imageView_track.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_notifications_24dp));
                                Toast.makeText(context, "untracking", Toast.LENGTH_SHORT).show();

                            }
                        }

                    }, new Response.ErrorListener() {

                        @Override
                        public void onErrorResponse(VolleyError error) {
                            Toast.makeText(context, "An error occured!", Toast.LENGTH_SHORT).show();
                        }
                    }) {

                        @Override
                        protected Map<String, String> getParams() throws AuthFailureError {
                            Map<String, String> params = new HashMap<>();
                            params.put(EventConstants.ID, event.getId());
                            params.put(EventConstants.IS_FOLLOWING, Boolean.toString(!event.isTracking()));
                            return params;
                        }

                        @Override
                        public Map<String, String> getHeaders() throws AuthFailureError {
                            Map<String, String> headers = MainActivity.getAuthorizationHeader(context);
                            return headers != null ? headers : super.getHeaders();
                        }
                    };

                    Volley.newRequestQueue(context).add(request);

                } else {
                    context.startActivity(new Intent(context, LoginActivity.class));
                }
            }
        });

        holder.linearLayout_eventBody.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_VIEW);
                intent.setData(Uri.parse(event.getSourceURL()));
                context.startActivity(intent);
            }
        });

    }

    @Override
    public int getItemCount() {
        return events.size();
    }

    public static class EventsViewHolder extends RecyclerView.ViewHolder {

        TextView textView_actual;
        TextView textView_forecast;
        TextView textView_previous;
        TextView textView_date;
        TextView textView_country;
        TextView textView_title;
        ImageView imageView_firstStar;
        ImageView imageView_secondStar;
        ImageView imageView_thirdStar;
        ImageView imageView_track;
        LinearLayout linearLayout_eventBody;


        public EventsViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_actual = itemView.findViewById(R.id.textView_eventActual);
            textView_forecast = itemView.findViewById(R.id.textView_eventForecast);
            textView_previous = itemView.findViewById(R.id.textView_eventPrevious);
            textView_date = itemView.findViewById(R.id.textView_eventDate);
            textView_country = itemView.findViewById(R.id.textView_eventCountry);
            imageView_firstStar = itemView.findViewById(R.id.imageView_firstStar);
            imageView_secondStar = itemView.findViewById(R.id.imageView_secondStar);
            imageView_thirdStar = itemView.findViewById(R.id.imageView_thirdStar);
            imageView_track = itemView.findViewById(R.id.imageView_eventTrack);
            textView_title = itemView.findViewById(R.id.textView_eventTitle);
            linearLayout_eventBody = itemView.findViewById(R.id.linearLayout_eventBody);

        }
    }
}
