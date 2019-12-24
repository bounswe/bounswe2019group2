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
import tk.traiders.models.Investment;
import tk.traiders.models.Notification;
import tk.traiders.models.Portfolio;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;

public class InvestmentAdapter extends RecyclerView.Adapter<InvestmentAdapter.InvestmentViewHolder> {

    private Context context;
    private List<Investment> investmentList;

    public InvestmentAdapter(Context context, List<Investment> investments) {
        this.context = context;
        this.investmentList = investments;
    }

    @NonNull
    @Override
    public InvestmentViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new InvestmentViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.investment_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull InvestmentViewHolder holder, int position) {
        Investment investment = investmentList.get(position);

    }


    @Override
    public int getItemCount() {
        return investmentList.size();
    }

    public static class InvestmentViewHolder extends RecyclerView.ViewHolder {


        public InvestmentViewHolder(@NonNull View itemView) {
            super(itemView);

        }

    }
}
