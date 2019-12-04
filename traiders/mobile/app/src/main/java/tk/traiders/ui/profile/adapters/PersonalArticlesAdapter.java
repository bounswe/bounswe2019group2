package tk.traiders.ui.profile.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.common.api.Api;

import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.components.article.ViewArticleActivity;
import tk.traiders.models.Article;

public class PersonalArticlesAdapter extends RecyclerView.Adapter<PersonalArticlesAdapter.PersonalArticlesViewHolder> {

    private Context context;
    private List<Article> articleList;
    private RequestQueue requestQueue;

    public PersonalArticlesAdapter(Context context, List<Article> articleList) {
        this.context = context;
        requestQueue = Volley.newRequestQueue(context);
        this.articleList = articleList;
    }

    @NonNull
    @Override
    public PersonalArticlesViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new PersonalArticlesViewHolder(LayoutInflater.from(context).inflate(R.layout.article_list_item_profile, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull PersonalArticlesViewHolder holder, int position) {

        Article article = articleList.get(position);

        holder.textView_title.setText(article.getTitle());
        holder.textView_content.setText(article.getContent());
        holder.linearLayout_article.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, ViewArticleActivity.class);
                intent.putExtra("article", articleList.get(position));
                context.startActivity(intent);
            }
        });

        holder.imageView_edit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(context, "edit" + article.getId(), Toast.LENGTH_SHORT).show();
            }
        });

        holder.imageView_delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                StringRequest deleteRequest = new StringRequest(Request.Method.DELETE, article.getUrl(),
                        new Response.Listener<String>()
                        {
                            @Override
                            public void onResponse(String response) {
                                Toast.makeText(context, "deleted", Toast.LENGTH_SHORT).show();
                                articleList.remove(position);
                                notifyItemRemoved(position);
                            }
                        },
                        new Response.ErrorListener()
                        {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                // error
                                Toast.makeText(context, "An error occured deleting article!", Toast.LENGTH_SHORT).show();
                                error.printStackTrace();
                            }
                        }
                ) {

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String> headers = MainActivity.getAuthorizationHeader(context);
                        return headers != null ? headers : super.getHeaders();
                    }
                };

                requestQueue.add(deleteRequest);
            }
        });

    }

    @Override
    public int getItemCount() {
        return articleList.size();
    }

    public static class PersonalArticlesViewHolder extends RecyclerView.ViewHolder {

        private LinearLayout linearLayout_article;
        private TextView textView_title;
        private TextView textView_content;
        private ImageView imageView_edit;
        private ImageView imageView_delete;

        public PersonalArticlesViewHolder(@NonNull View itemView) {
            super(itemView);
            linearLayout_article = itemView.findViewById(R.id.linearLayout_article);
            textView_title = itemView.findViewById(R.id.textView_title);
            textView_content = itemView.findViewById(R.id.textView_content);
            imageView_edit = itemView.findViewById(R.id.imageView_editArticle);
            imageView_delete = itemView.findViewById(R.id.imageView_deleteArticle);
        }
    }
}
