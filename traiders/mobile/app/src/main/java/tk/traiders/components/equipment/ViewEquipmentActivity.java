package tk.traiders.components.equipment;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.LoginActivity;
import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.components.article.ViewArticleActivity;
import tk.traiders.components.article.adapters.CommentAdapter;
import tk.traiders.marshallers.CommentMarshaller;
import tk.traiders.models.Comment;
import tk.traiders.models.Equipment;

public class ViewEquipmentActivity extends AppCompatActivity {

    private static final String URL_COMMENTS = "https://api.traiders.tk/comments/equipment/";


    private TextView textView_equipmentName;
    private TextView textView_equipmentSymbol;
    private TextView textView_equipmentCategory;
    private TextView textView_noComment;
    private RecyclerView recylerView_commentList;
    private ImageView imageView_comment;
    private EditText editText_comment;
    private Equipment equipment = null;

    private RequestQueue requestQueue;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_equipment);

        requestQueue = Volley.newRequestQueue(this);

        textView_equipmentName = findViewById(R.id.activityViewEquipment_textView_equipmentName);
        textView_equipmentSymbol = findViewById(R.id.activityViewEquipment_textView_equipmentSymbol);
        textView_equipmentCategory = findViewById(R.id.activityViewEquipment_textView_equipmentCategory);
        textView_noComment = findViewById(R.id.activityViewEquipment_textView_noComment);
        recylerView_commentList = findViewById(R.id.recylerView_commentListEquipment);
        recylerView_commentList.setLayoutManager(new LinearLayoutManager(this));
        recylerView_commentList.setHasFixedSize(true);
        editText_comment = findViewById(R.id.activityViewEquipment_editText_addComment);

        imageView_comment = findViewById(R.id.activityViewEquipment_imageView_addComment);

        imageView_comment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(!MainActivity.isUserLoggedIn(ViewEquipmentActivity.this)) {
                    ViewEquipmentActivity.this.startActivity(new Intent(ViewEquipmentActivity.this, LoginActivity.class));
                    Toast.makeText(ViewEquipmentActivity.this, "Please log in to continue", Toast.LENGTH_SHORT).show();
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
                                InputMethodManager imm = (InputMethodManager)getSystemService(ViewEquipmentActivity.this.INPUT_METHOD_SERVICE);
                                imm.hideSoftInputFromWindow(editText_comment.getWindowToken(), 0);
                                fetchComments();
                            }
                        },
                        new Response.ErrorListener()
                        {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                // error
                                Toast.makeText(ViewEquipmentActivity.this, "An error occured posting comment!", Toast.LENGTH_SHORT).show();
                                error.printStackTrace();
                            }
                        }
                ) {

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String> headers = MainActivity.getAuthorizationHeader(ViewEquipmentActivity.this);
                        return headers != null ? headers : super.getHeaders();
                    }

                    @Override
                    protected Map<String, String> getParams()
                    {
                        Map<String, String>  params = new HashMap<String, String>();
                        params.put("content", comment);
                        params.put("equipment", equipment.getUrl());

                        return params;
                    }
                };

                requestQueue.add(postRequest);

            }
        });

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        setTitle("View Equipment");

        Intent intent = getIntent();

        if(intent != null && intent.hasExtra("equipment")) {
            equipment = (Equipment) intent.getSerializableExtra("equipment");
        }

        if(equipment != null) {

            textView_equipmentName.setText(equipment.getName());
            textView_equipmentSymbol.setText(equipment.getSymbol());
            textView_equipmentCategory.setText(capitalize(equipment.getCategory()));
        }

        fetchComments();
    }


    private void fetchComments(){

        Uri.Builder builder = Uri.parse(URL_COMMENTS).buildUpon();
        builder.appendQueryParameter("equipment", equipment.getId());

        String UrlWithEquipmentId = builder.build().toString();

        StringRequest request = new StringRequest(Request.Method.GET, UrlWithEquipmentId, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                List<Comment> commentList = CommentMarshaller.unmarshallList(response);

                if(commentList.size() == 0) {
                    textView_noComment.setVisibility(View.VISIBLE);
                } else {
                    textView_noComment.setVisibility(View.GONE);
                }

                recylerView_commentList.setAdapter(new CommentAdapter(ViewEquipmentActivity.this, commentList));
            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(ViewEquipmentActivity.this, "An error occured fetching comments", Toast.LENGTH_SHORT).show();
                error.printStackTrace();
            }
        });

        requestQueue.add(request);


    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    private String capitalize(String string) {
        return string.substring(0,1).toUpperCase() + string.substring(1);
    }
}
