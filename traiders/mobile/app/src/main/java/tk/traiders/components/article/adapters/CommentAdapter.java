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
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.LoginActivity;
import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.components.article.ViewArticleActivity;
import tk.traiders.marshallers.CommentMarshaller;
import tk.traiders.marshallers.LikeMarshaller;
import tk.traiders.models.Comment;
import tk.traiders.models.Like;


public class CommentAdapter extends RecyclerView.Adapter<CommentAdapter.CommentsViewHolder> {

    private Context context;

    public List<Comment> getCommentList() {
        return commentList;
    }

    private RequestQueue requestQueue;

    public CommentAdapter setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
        notifyDataSetChanged();
        return this;
    }

    private List<Comment> commentList = new ArrayList<>();


    public CommentAdapter(Context context, List<Comment> commentList) {
        this.context = context;
        this.commentList = commentList;
        requestQueue = Volley.newRequestQueue(context);
    }

    @NonNull
    @Override
    public CommentsViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new CommentsViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.comment_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull CommentsViewHolder holder, int position) {
        Comment comment = commentList.get(position);
        holder.textView_author.setText(comment.getAuthor().getUsername());
        holder.textView_createdAt.setText(comment.getCreatedAt());
        holder.imageView_like.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(MainActivity.isUserLoggedIn(context)) {

                    StringRequest request = new StringRequest(Request.Method.PATCH, comment.getUrl(),
                            new Response.Listener<String>()
                            {
                                @Override
                                public void onResponse(String response) {
                                    Comment comment1 = CommentMarshaller.unmarshall(response);
                                    commentList.set(position, comment1);
                                    notifyItemChanged(position);
                                    if(comment1.isLiked()) {
                                        Toast.makeText(context, "liked", Toast.LENGTH_SHORT).show();
                                    } else {
                                        Toast.makeText(context, "unliked", Toast.LENGTH_SHORT).show();
                                    }
                                }
                            },
                            new Response.ErrorListener()
                            {
                                @Override
                                public void onErrorResponse(VolleyError error) {
                                    if(comment.isLiked()) {
                                        Toast.makeText(context, "An error occured unliking comment!", Toast.LENGTH_SHORT).show();
                                    } else {
                                        Toast.makeText(context, "An error occured liking comment!", Toast.LENGTH_SHORT).show();
                                    }
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
                            params.put("is_liked", Boolean.toString(!comment.isLiked()));
                            return params;
                        }
                    };

                    requestQueue.add(request);


                } else {
                    context.startActivity(new Intent(context, LoginActivity.class));
                    Toast.makeText(context, "Please login to continue", Toast.LENGTH_SHORT).show();
                }
            }
        });
        holder.textView_content.setText(comment.getContent());
        holder.textView_likeCount.setText(Integer.toString(comment.getNumLlikes()));
        if(comment.isLiked()){
            holder.imageView_like.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_thumb_up_black_24dp));
        } else {
            holder.imageView_like.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.ic_thumb_up_gray_24dp));
        }
    }

    @Override
    public int getItemCount() {
        return commentList.size();
    }

    static class CommentsViewHolder extends RecyclerView.ViewHolder {

        private TextView textView_author;
        private TextView textView_createdAt;
        private TextView textView_likeCount;
        private ImageView imageView_like;
        private TextView textView_content;


        public CommentsViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_author = itemView.findViewById(R.id.textView_comment_author);
            textView_createdAt = itemView.findViewById(R.id.textView_comment_createdAt);
            textView_likeCount = itemView.findViewById(R.id.textView_comment_likeCount);
            imageView_like = itemView.findViewById(R.id.imageView_comment_like);
            textView_content = itemView.findViewById(R.id.textView_comment_content);
        }
    }
}
