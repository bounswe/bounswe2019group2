package tk.traiders.ui.investments.adapters;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.media.Image;
import android.opengl.Visibility;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.dynamic.SupportFragmentWrapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.components.article.ViewArticleActivity;
import tk.traiders.components.portfolio.CreatePortfolioFragment;
import tk.traiders.components.portfolio.EditPortfolioFragment;
import tk.traiders.models.Alarm;
import tk.traiders.models.Article;
import tk.traiders.models.Notification;
import tk.traiders.models.Portfolio;
import tk.traiders.models.PortfolioItem;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;

public class PortfolioAdapter extends RecyclerView.Adapter<PortfolioAdapter.PortfolioViewHolder> {

    private Context context;
    private List<Portfolio> portfolioList;
    private FragmentManager fragmentManager;
    private RequestQueue requestQueue;

    public PortfolioAdapter(Context context, FragmentManager fragmentManager, List<Portfolio> portfolios) {
        this.context = context;
        this.portfolioList = portfolios;
        this.fragmentManager = fragmentManager;
        requestQueue = Volley.newRequestQueue(context);
    }

    @NonNull
    @Override
    public PortfolioViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new PortfolioViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.portfolio_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull PortfolioViewHolder holder, int position) {
        Portfolio portfolio = portfolioList.get(position);
        holder.textView_name.setText(portfolio.getName());
        holder.textView_user.setText(portfolio.getUser().getUsername());

        holder.imageView_delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                StringRequest stringRequest= new StringRequest(Request.Method.DELETE, portfolio.getUrl(), new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Toast.makeText(context, "portfolio deleted", Toast.LENGTH_SHORT).show();
                        portfolioList.remove(position);
                        notifyItemRemoved(position);
                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(context, "an error occured during deletion", Toast.LENGTH_SHORT).show();
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
        });

        for(PortfolioItem portfolioItem: portfolio.getPortfolioItemList()){

            View view = View.inflate(context, R.layout.portfolio_item_list_item, holder.linearLayout);

            TextView textView_base = view.findViewById(R.id.textView_base);
            textView_base.setText(portfolioItem.getBaseEquipment());

            TextView textView_target = view.findViewById(R.id.textView_target);
            textView_target.setText(portfolioItem.getTargetEquipment());

        }

        holder.imageView_edit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                EditPortfolioFragment.newInstance(portfolio.getUrl()).show(fragmentManager, "EditPortfolioFragment");
            }
        });

        holder.imageView_show.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(holder.linearLayout.getVisibility() == View.GONE){
                    holder.linearLayout.setVisibility(View.VISIBLE);
                    holder.imageView_show.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_keyboard_arrow_up_24dp));
                } else {
                    holder.linearLayout.setVisibility(View.GONE);
                    holder.imageView_show.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_keyboard_arrow_down_24dp));
                }
            }
        });

    }


    @Override
    public int getItemCount() {
        return portfolioList.size();
    }

    public static class PortfolioViewHolder extends RecyclerView.ViewHolder {

        TextView textView_name;
        TextView textView_user;
        ImageView imageView_show;
        ImageView imageView_edit;
        LinearLayout linearLayout;
        ImageView imageView_delete;


        public PortfolioViewHolder(@NonNull View itemView) {
            super(itemView);

            textView_name = itemView.findViewById(R.id.textView_name);
            textView_user = itemView.findViewById(R.id.textView_user);
            imageView_show = itemView.findViewById(R.id.imageView_show);
            imageView_edit = itemView.findViewById(R.id.imageView_edit);
            linearLayout = itemView.findViewById(R.id.linearLayout);
            imageView_delete = itemView.findViewById(R.id.imageView_delete);

        }

    }
}
