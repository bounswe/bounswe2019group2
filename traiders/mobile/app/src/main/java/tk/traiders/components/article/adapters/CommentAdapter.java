package tk.traiders.components.article.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.LoginActivity;
import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.models.Comment;


public class CommentAdapter extends RecyclerView.Adapter<CommentAdapter.ArticleCommentsViewHolder> {

    private Context context;

    public List<Comment> getCommentList() {
        return commentList;
    }

    public CommentAdapter setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
        notifyDataSetChanged();
        return this;
    }

    private List<Comment> commentList = new ArrayList<>();


    public CommentAdapter(Context context, List<Comment> commentList) {
        this.context = context;
        this.commentList = commentList;
    }

    @NonNull
    @Override
    public ArticleCommentsViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new ArticleCommentsViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.comment_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull ArticleCommentsViewHolder holder, int position) {
        Comment comment = commentList.get(position);
        holder.textView_author.setText(comment.getAuthor().getUsername());
        holder.textView_createdAt.setText(comment.getCreatedAt());
        holder.imageView_like.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(MainActivity.isUserLoggedIn(context)) {
                    Toast.makeText(context, "Like: " + position, Toast.LENGTH_SHORT).show();

                } else {
                    context.startActivity(new Intent(context, LoginActivity.class));
                    Toast.makeText(context, "Please login to continue", Toast.LENGTH_SHORT).show();
                }
            }
        });
        holder.textView_content.setText(comment.getContent());
        holder.textView_likeCount.setText("0 Like");
    }

    @Override
    public int getItemCount() {
        return commentList.size();
    }

    static class ArticleCommentsViewHolder extends RecyclerView.ViewHolder {

        private TextView textView_author;
        private TextView textView_createdAt;
        private TextView textView_likeCount;
        private ImageView imageView_like;
        private TextView textView_content;


        public ArticleCommentsViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_author = itemView.findViewById(R.id.textView_comment_author);
            textView_createdAt = itemView.findViewById(R.id.textView_comment_createdAt);
            textView_likeCount = itemView.findViewById(R.id.textView_comment_likeCount);
            imageView_like = itemView.findViewById(R.id.imageView_comment_like);
            textView_content = itemView.findViewById(R.id.textView_comment_content);
        }
    }
}
