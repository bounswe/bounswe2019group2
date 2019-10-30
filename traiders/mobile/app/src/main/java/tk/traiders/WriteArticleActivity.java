package tk.traiders;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import java.io.File;

public class WriteArticleActivity extends AppCompatActivity {

    private static int RESULT_LOAD_IMAGE = 999;

    private EditText editText_title;
    private EditText editText_content;
    private TextView textView_image;
    private ImageView imageView_image;
    private Button button_publish;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_write_article);


        editText_title = findViewById(R.id.editText_title);
        editText_content = findViewById(R.id.editText_content);
        textView_image = findViewById(R.id.textView_image);
        imageView_image = findViewById(R.id.imageView_image);
        button_publish = findViewById(R.id.button_publish);

        button_publish.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String title = editText_title.getText().toString();

                if(title.isEmpty()) {
                    editText_title.setError("Provide a title");
                    return;
                }

                String content = editText_content.getText().toString();

                if(content.isEmpty()){
                    editText_content.setError("Provide a content");
                    return;
                }

                Toast.makeText(WriteArticleActivity.this, "Will be Published", Toast.LENGTH_SHORT).show();
            }
        });


        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.write_article_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case android.R.id.home:
                finish();
                return true;
            case R.id.write_article:
                startActivityForResult(new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI), RESULT_LOAD_IMAGE);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == RESULT_LOAD_IMAGE && resultCode == RESULT_OK && null != data) {
            textView_image.setVisibility(View.VISIBLE);
            imageView_image.setVisibility(View.VISIBLE);
            imageView_image.setImageURI(data.getData());
        }
    }
}
