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
import tk.traiders.models.Alarm;
import tk.traiders.models.Article;
import tk.traiders.models.Notification;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;

public class AlarmAdapter extends RecyclerView.Adapter<AlarmAdapter.AlarmViewHolder> {

    private Context context;
    private List<Alarm> alarmList;

    public AlarmAdapter(Context context, List<Alarm> alarmList) {
        this.context = context;
        this.alarmList = alarmList;
    }

    @NonNull
    @Override
    public AlarmViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new AlarmViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.alarm_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull AlarmViewHolder holder, int position) {
        Alarm alarm = alarmList.get(position);
        holder.textView_baseName.setText(alarm.getBaseSymbol());
        holder.textView_targetName.setText(alarm.getTargetSymbol());
        holder.textView_ratio.setText("" + alarm.getRatio() );
        holder.textView_when.setText(alarm.isIncreasing() ? "increased" : "decreased");

    }


    @Override
    public int getItemCount() {
        return alarmList.size();
    }

    public static class AlarmViewHolder extends RecyclerView.ViewHolder {

        TextView textView_baseName;
        TextView textView_targetName;
        TextView textView_ratio;
        TextView textView_when;


        public AlarmViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_targetName = itemView.findViewById(R.id.textView_targetName);
            textView_baseName = itemView.findViewById(R.id.textView_baseName);
            textView_ratio = itemView.findViewById(R.id.textView_ratio);
            textView_when = itemView.findViewById(R.id.textView_when);



        }

    }
}
