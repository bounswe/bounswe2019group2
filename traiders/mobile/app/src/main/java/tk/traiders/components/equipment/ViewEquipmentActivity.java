package tk.traiders.components.equipment;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.List;

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
        recylerView_commentList = findViewById(R.id.recylerView_commentList);

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
