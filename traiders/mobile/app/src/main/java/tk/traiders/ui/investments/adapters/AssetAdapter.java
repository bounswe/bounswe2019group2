package tk.traiders.ui.investments.adapters;

import android.content.Context;
import android.content.Intent;
import android.provider.ContactsContract;
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
import tk.traiders.models.Asset;
import tk.traiders.models.Notification;
import tk.traiders.models.Portfolio;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;

public class AssetAdapter extends RecyclerView.Adapter<AssetAdapter.AssetViewHolder> {

    private Context context;
    private List<Asset> assetList;

    public AssetAdapter(Context context, List<Asset> assetList) {
        this.context = context;
        this.assetList = assetList;
    }

    @NonNull
    @Override
    public AssetViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new AssetViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.asset_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull AssetViewHolder holder, int position) {
        Asset asset = assetList.get(position);
        holder.textView_equipment.setText(asset.getEquipment());
        holder.textView_amount.setText("" + asset.getAmount());
        holder.textView_onhold.setText(asset.getOnHoldForInvestment() == 0 ? "No" : "Yes");

        holder.imageView_delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(context, "Soon: delete asset", Toast.LENGTH_SHORT).show();
            }
        });

        holder.imageView_edit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(context, "Soon: edit asset", Toast.LENGTH_SHORT).show();
            }
        });

    }


    @Override
    public int getItemCount() {
        return assetList.size();
    }

    public static class AssetViewHolder extends RecyclerView.ViewHolder {

        TextView textView_equipment;
        TextView textView_amount;
        TextView textView_onhold;

        ImageView imageView_delete;
        ImageView imageView_edit;


        public AssetViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_equipment = itemView.findViewById(R.id.textView_equipment);
            textView_amount = itemView.findViewById(R.id.textView_amount);
            textView_onhold = itemView.findViewById(R.id.textView_onhold);

            imageView_delete = itemView.findViewById(R.id.imageView_delete);
            imageView_edit = itemView.findViewById(R.id.imageView_edit);

        }

    }
}
