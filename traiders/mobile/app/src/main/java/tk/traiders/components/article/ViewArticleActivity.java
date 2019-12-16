package tk.traiders.components.article;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.squareup.picasso.Picasso;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.LoginActivity;
import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.components.article.adapters.CommentAdapter;
import tk.traiders.marshallers.ArticleMarshaller;
import tk.traiders.marshallers.CommentMarshaller;
import tk.traiders.marshallers.LikeMarshaller;
import tk.traiders.models.Article;
import tk.traiders.models.Comment;

public class ViewArticleActivity extends AppCompatActivity {

    private static final String URL_COMMENTS = "https://api.traiders.tk/comments/article/";
    private static final String URL_LIKES = "https://api.traiders.tk/likes/";


    private Article article = null;

    private TextView textView_title;
    private ImageView imageView_image;
    private TextView textView_content;
    private TextView textView_publishedAt;
    private TextView textView_likeCount;
    private TextView textView_writtenBy;
    private TextView textView_noComment;
    private RecyclerView recylerView_commentList;
    private RequestQueue requestQueue;
    private EditText editText_comment;
    private ImageView imageView_comment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_article);

        requestQueue = Volley.newRequestQueue(this);

        textView_title = findViewById(R.id.activityViewArticle_textView_title);
        imageView_image = findViewById(R.id.activityViewArticle_imageView_image);
        textView_content = findViewById(R.id.activityViewArticle_textView_content);
        textView_publishedAt = findViewById(R.id.textView_article_publishedAt);
        textView_writtenBy = findViewById(R.id.textView_article_writtenBy);
        textView_likeCount = findViewById(R.id.textView_article_likeCount);
        textView_noComment = findViewById(R.id.textView_article_noComment);
        editText_comment = findViewById(R.id.editText_comment_add);
        imageView_comment = findViewById(R.id.imageView_comment_add);

        textView_content.setTextIsSelectable(true);
        textView_content.setCustomSelectionActionModeCallback(new ActionMode.Callback() {

            @Override
            public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
                // Remove the "select all" option
                menu.removeItem(android.R.id.selectAll);
                // Remove the "cut" option
                menu.removeItem(android.R.id.cut);
                // Remove the "copy all" option
                menu.removeItem(android.R.id.copy);
                return true;
            }

            @Override
            public boolean onCreateActionMode(ActionMode mode, Menu menu) {
                // Called when action mode is first created. The menu supplied
                // will be used to generate action buttons for the action mode

                // Here is an example MenuItem
                menu.add(0, 99, 0, "Annotate");
                return true;
            }

            @Override
            public void onDestroyActionMode(ActionMode mode) {
                // Called when an action mode is about to be exited and
                // destroyed
            }

            @Override
            public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
                switch (item.getItemId()) {
                    case 99:
                        int min = 0;
                        int max = textView_content.getText().length();
                        if (textView_content.isFocused()) {
                            final int selStart = textView_content.getSelectionStart();
                            final int selEnd = textView_content.getSelectionEnd();

                            min = Math.max(0, Math.min(selStart, selEnd));
                            max = Math.max(0, Math.max(selStart, selEnd));
                        }
                        // Perform your definition lookup with the selected text
                        final CharSequence selectedText = textView_content.getText().subSequence(min, max);
                        // Finish and close the ActionMode
                        mode.finish();
                        return true;
                    default:
                        break;
                }
                return false;
            }

        });

        imageView_comment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(!MainActivity.isUserLoggedIn(ViewArticleActivity.this)) {
                    ViewArticleActivity.this.startActivity(new Intent(ViewArticleActivity.this, LoginActivity.class));
                    Toast.makeText(ViewArticleActivity.this, "Please log in to continue", Toast.LENGTH_SHORT).show();
                    return;
                }

                String comment = editText_comment.getText().toString();

                if(comment.length() == 0) {
                    editText_comment.setError("Enter your comment!");
                    return;
                }

                StringRequest postRequest = new StringRequest(Request.Method.POST, URL_COMMENTS,
                        new Response.Listener<String>()
                        {
                            @Override
                            public void onResponse(String response) {
                                editText_comment.setText("");
                                editText_comment.clearFocus();
                                InputMethodManager imm = (InputMethodManager)getSystemService(ViewArticleActivity.this.INPUT_METHOD_SERVICE);
                                imm.hideSoftInputFromWindow(editText_comment.getWindowToken(), 0);
                                fetchComments();
                            }
                        },
                        new Response.ErrorListener()
                        {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                // error
                                Toast.makeText(ViewArticleActivity.this, "An error occured posting comment!", Toast.LENGTH_SHORT).show();
                                error.printStackTrace();
                            }
                        }
                ) {

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String> headers = MainActivity.getAuthorizationHeader(ViewArticleActivity.this);
                        return headers != null ? headers : super.getHeaders();
                    }

                    @Override
                    protected Map<String, String> getParams()
                    {
                        Map<String, String>  params = new HashMap<String, String>();

                        params.put("content", comment);
                        params.put("article", article.getUrl());

                        return params;
                    }
                };

                requestQueue.add(postRequest);

            }
        });

        Intent intent = getIntent();

        if(intent != null) {
            if(intent.hasExtra("article")) {
                article = (Article) intent.getSerializableExtra("article");
            }
        }

        if(article != null){
            textView_title.setText(article.getTitle());
            if(!article.getImage().isEmpty())
                Picasso.get().load(article.getImage()).into(imageView_image);
            else
                imageView_image.setVisibility(View.GONE);
            textView_content.setText(article.getContent());
            textView_writtenBy.setText(article.getAuthor().getUsername());
            textView_publishedAt.setText(article.getCreatedAt());
            textView_likeCount.setText(article.getLikeCount());
        }

        recylerView_commentList = findViewById(R.id.recylerView_commentList);

        recylerView_commentList.setLayoutManager(new LinearLayoutManager(this));
        recylerView_commentList.setHasFixedSize(true);
        //recylerView_commentList.setAdapter(new CommentAdapter(this, new ArrayList<>()));

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        fetchComments();

    }

    private void fetchComments(){

        Uri.Builder builder = Uri.parse(URL_COMMENTS).buildUpon();
        builder.appendQueryParameter("article", article.getId());

        String UrlWithArticleId = builder.build().toString();

        StringRequest request = new StringRequest(Request.Method.GET, UrlWithArticleId, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                List<Comment> commentList = CommentMarshaller.unmarshallList(response);

                if(commentList.size() == 0) {
                    textView_noComment.setVisibility(View.VISIBLE);
                } else {
                    textView_noComment.setVisibility(View.GONE);
                }

                recylerView_commentList.setAdapter(new CommentAdapter(ViewArticleActivity.this, commentList));
            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(ViewArticleActivity.this, "An error occured fetching comments", Toast.LENGTH_SHORT).show();
                error.printStackTrace();
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = MainActivity.getAuthorizationHeader(ViewArticleActivity.this);
                return headers != null ? headers : super.getHeaders();
            }
        };

        requestQueue.add(request);


    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.view_article_menu, menu);
        return true;
    }

    @Override
    protected void onResume() {
        super.onResume();
        StringRequest getRequest = new StringRequest(Request.Method.GET, article.getUrl(),
                new Response.Listener<String>()
                {
                    @Override
                    public void onResponse(String response) {
                        article = ArticleMarshaller.unmarshall(response);
                        invalidateOptionsMenu();
                    }
                },
                new Response.ErrorListener()
                {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        // error
                        Toast.makeText(ViewArticleActivity.this, "An error occured fetching article!", Toast.LENGTH_SHORT).show();
                        error.printStackTrace();
                    }
                }
        ) {

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = MainActivity.getAuthorizationHeader(ViewArticleActivity.this);
                return headers != null ? headers : super.getHeaders();
            }
        };

        requestQueue.add(getRequest);
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        if(article == null || article.getLike() == null || !article.getLike().getUser().equals(MainActivity.getUserURL(this))) {
            menu.findItem(R.id.viewArticle_menu_whiteLike).setVisible(true);
            menu.findItem(R.id.viewArticle_menu_blackLike).setVisible(false);
        } else {
            menu.findItem(R.id.viewArticle_menu_whiteLike).setVisible(false);
            menu.findItem(R.id.viewArticle_menu_blackLike).setVisible(true);
        }
        return super.onPrepareOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId())
        {
            case android.R.id.home:
                finish();
                return true;
            case R.id.viewArticle_menu_whiteLike:

                if(MainActivity.isUserLoggedIn(this)) {
                    StringRequest postRequest = new StringRequest(Request.Method.POST, URL_LIKES,
                            new Response.Listener<String>()
                            {
                                @Override
                                public void onResponse(String response) {
                                    article.setLike(LikeMarshaller.unmarshall(response));
                                    invalidateOptionsMenu();
                                    Toast.makeText(ViewArticleActivity.this, "liked", Toast.LENGTH_SHORT).show();
                                }
                            },
                            new Response.ErrorListener()
                            {
                                @Override
                                public void onErrorResponse(VolleyError error) {
                                    // error
                                    Toast.makeText(ViewArticleActivity.this, "An error occured liking article!", Toast.LENGTH_SHORT).show();
                                    error.printStackTrace();
                                }
                            }
                    ) {

                        @Override
                        public Map<String, String> getHeaders() throws AuthFailureError {
                            Map<String, String> headers = MainActivity.getAuthorizationHeader(ViewArticleActivity.this);
                            return headers != null ? headers : super.getHeaders();
                        }

                        @Override
                        protected Map<String, String> getParams()
                        {
                            Map<String, String>  params = new HashMap<String, String>();
                            params.put("article", article.getUrl());
                            return params;
                        }
                    };

                    requestQueue.add(postRequest);
                } else {
                    startActivity(new Intent(this, LoginActivity.class));
                    Toast.makeText(this, "Please login to continue", Toast.LENGTH_SHORT).show();
                }

                return true;
            case R.id.viewArticle_menu_blackLike:
                StringRequest deleteRequest = new StringRequest(Request.Method.DELETE, article.getLike().getUrl(),
                        new Response.Listener<String>()
                        {
                            @Override
                            public void onResponse(String response) {
                                article.setLike(null);
                                invalidateOptionsMenu();
                                Toast.makeText(ViewArticleActivity.this, "unliked", Toast.LENGTH_SHORT).show();
                            }
                        },
                        new Response.ErrorListener()
                        {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                // error
                                Toast.makeText(ViewArticleActivity.this, "An error occured unliking article!", Toast.LENGTH_SHORT).show();
                                error.printStackTrace();
                            }
                        }
                ) {

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String> headers = MainActivity.getAuthorizationHeader(ViewArticleActivity.this);
                        return headers != null ? headers : super.getHeaders();
                    }
                };

                requestQueue.add(deleteRequest);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
