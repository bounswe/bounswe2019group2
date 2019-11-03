package tk.traiders.ui.social.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import tk.traiders.R;
import tk.traiders.ViewArticleActivity;
import tk.traiders.models.Article;

public class ArticlesAdapter extends RecyclerView.Adapter<ArticlesAdapter.ArticleViewHolder> {

    private Context context;
    private List<Article> articleList;

    public ArticlesAdapter(Context context, List<Article> articleList) {
        this.context = context;
        this.articleList = articleList;
    }

    @NonNull
    @Override
    public ArticleViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new ArticleViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.article_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull ArticleViewHolder holder, int position) {
        Article current_article = articleList.get(position);
        holder.getTextView_title().setText(current_article.getTitle());
        holder.getTextView_content().setText(current_article.getContent());
        holder.getLinearLayout_article().setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(context, ViewArticleActivity.class);
                intent.putExtra("article", articleList.get(position));
                context.startActivity(intent);

            }
        });
    }


    @Override
    public int getItemCount() {
        return articleList.size();
    }

    public static class ArticleViewHolder extends RecyclerView.ViewHolder {

        private TextView textView_title;
        private TextView textView_content;
        private LinearLayout linearLayout_article;

        public ArticleViewHolder(@NonNull View itemView) {
            super(itemView);

            textView_title = itemView.findViewById(R.id.textView_title);
            textView_content = itemView.findViewById(R.id.textView_content);
            linearLayout_article = itemView.findViewById(R.id.linearLayout_article);

        }

        public TextView getTextView_title() {
            return textView_title;
        }

        public TextView getTextView_content() {
            return textView_content;
        }

        public LinearLayout getLinearLayout_article() {
            return linearLayout_article;
        }
    }
}
