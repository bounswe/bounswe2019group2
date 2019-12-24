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
import tk.traiders.models.Portfolio;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;

public class PortfolioAdapter extends RecyclerView.Adapter<PortfolioAdapter.PortfolioViewHolder> {

    private Context context;
    private List<Portfolio> portfolioList;

    public PortfolioAdapter(Context context, List<Portfolio> portfolios) {
        this.context = context;
        this.portfolioList = portfolios;
    }

    @NonNull
    @Override
    public PortfolioViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new PortfolioViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.portfolio_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull PortfolioViewHolder holder, int position) {
        Portfolio portfolio = portfolioList.get(position);

    }


    @Override
    public int getItemCount() {
        return portfolioList.size();
    }

    public static class PortfolioViewHolder extends RecyclerView.ViewHolder {


        public PortfolioViewHolder(@NonNull View itemView) {
            super(itemView);

        }

    }
}
