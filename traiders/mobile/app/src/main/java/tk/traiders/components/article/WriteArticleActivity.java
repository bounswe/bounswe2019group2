package tk.traiders.components.article;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.RequestQueue;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import tk.traiders.MainActivity;
import tk.traiders.R;

public class WriteArticleActivity extends AppCompatActivity {

    private static int RESULT_LOAD_IMAGE = 999;

    private EditText editText_title;
    private EditText editText_content;
    private TextView textView_image;
    private ImageView imageView_image;
    private Button button_publish;
    private ProgressBar progressBar;

    private Uri imageURI = null;

    private RequestQueue requestQueue;

    private static String URL = "https://api.traiders.tk/articles/";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_write_article);

        requestQueue = Volley.newRequestQueue(this);

        editText_title = findViewById(R.id.editText_title);
        editText_content = findViewById(R.id.editText_content);
        textView_image = findViewById(R.id.textView_image);
        imageView_image = findViewById(R.id.imageView_image);
        button_publish = findViewById(R.id.button_publish);
        progressBar = findViewById(R.id.progressBar);
        progressBar.setVisibility(View.GONE);

        button_publish.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                button_publish.setClickable(false);

                String title = editText_title.getText().toString();

                if(title.isEmpty()) {
                    editText_title.setError("Provide a title");
                    button_publish.setClickable(true);
                    return;
                }

                String content = editText_content.getText().toString();

                if(content.isEmpty()){
                    editText_content.setError("Provide a content");
                    button_publish.setClickable(true);
                    return;
                }

                Toast.makeText(WriteArticleActivity.this, "publishing article...", Toast.LENGTH_LONG).show();
                progressBar.setVisibility(View.VISIBLE);

                JSONObject body = new JSONObject();

                try {
                    body.put("title", title);
                    body.put("content", content);
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                JsonObjectRequest postRequest = new JsonObjectRequest(com.android.volley.Request.Method.POST, URL, body,
                        new com.android.volley.Response.Listener<JSONObject>()
                        {
                            @Override
                            public void onResponse(JSONObject response) {
                                String url = null;

                                try {
                                    url = response.getString("url");
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }

                                new BackgroundTask().execute(url);

                            }
                        },
                        new com.android.volley.Response.ErrorListener()
                        {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                error.printStackTrace();
                            }
                        }
                ){

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String>  params = new HashMap<String, String>();
                        params.put("Content-Type", "application/json");
                        params.put("Authorization", "Token " + MainActivity.getAuthorizationToken(WriteArticleActivity.this));
                        return params;
                    }
                };

                requestQueue.add(postRequest);
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
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    if(ContextCompat.checkSelfPermission(this,
                            Manifest.permission.READ_EXTERNAL_STORAGE)
                            == PackageManager.PERMISSION_GRANTED &&
                            ContextCompat.checkSelfPermission(this,
                                    Manifest.permission.WRITE_EXTERNAL_STORAGE)
                                    == PackageManager.PERMISSION_GRANTED) {
                        startActivityForResult(new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI), RESULT_LOAD_IMAGE);
                    } else {
                        checkPermissions();
                    }
                } else {
                    startActivityForResult(new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI), RESULT_LOAD_IMAGE);
                }
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
            imageURI = data.getData();
        }
    }

    class BackgroundTask extends AsyncTask<String, Integer, String> {

        @Override
        protected String doInBackground(String... strings) {

            String URL = strings[0];

            MultipartBody.Builder builder = new MultipartBody.Builder().setType(MultipartBody.FORM);

            if(imageView_image.getVisibility() == View.VISIBLE && imageURI != null) {

                String imageFilePath = null;

                if (imageURI != null && "content".equals(imageURI.getScheme())) {
                    Cursor cursor = WriteArticleActivity.this.getContentResolver().query(imageURI, new String[] { android.provider.MediaStore.Images.ImageColumns.DATA }, null, null, null);
                    cursor.moveToFirst();
                    imageFilePath = cursor.getString(0);
                    cursor.close();
                } else {
                    imageFilePath = imageURI.getPath();
                }

                final File imageFile = new File(imageFilePath);


                builder.addFormDataPart("image", imageFile.getName(),RequestBody.create(MediaType.parse(getContentResolver().getType(imageURI)),imageFile));

            }

            MultipartBody multipartBody = builder.build();

            OkHttpClient client = new OkHttpClient.Builder().connectTimeout(10, TimeUnit.SECONDS).writeTimeout(180, TimeUnit.SECONDS).readTimeout(180, TimeUnit.SECONDS).build();

            Request request = new Request.Builder().url(URL)
                    .addHeader("Authorization", "Token " + MainActivity.getAuthorizationToken(WriteArticleActivity.this).trim())
                    .patch(multipartBody)
                    .build();

            Response response = null;
            try {
                response = client.newCall(request).execute();
            } catch (IOException e) {
                e.printStackTrace();
            }

            return response.message();
        }

        @Override
        protected void onPostExecute(String s) {
            if(s.equals("OK")){
                Toast.makeText(WriteArticleActivity.this, "article published", Toast.LENGTH_SHORT).show();
                finish();
            } else {
                Toast.makeText(WriteArticleActivity.this, "an error occured", Toast.LENGTH_SHORT).show();
            }
            progressBar.setVisibility(View.GONE);
            button_publish.setClickable(true);
            super.onPostExecute(s);
        }
    }

    private void checkPermissions(){

        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.READ_EXTERNAL_STORAGE)
                != PackageManager.PERMISSION_GRANTED||
                ContextCompat.checkSelfPermission(this,
                        Manifest.permission.WRITE_EXTERNAL_STORAGE)
                        != PackageManager.PERMISSION_GRANTED) {

            ActivityCompat.requestPermissions(this,
                    new String[]{
                            Manifest.permission.READ_EXTERNAL_STORAGE,
                            Manifest.permission.WRITE_EXTERNAL_STORAGE
                    },
                    1052);

        }

    }

    public void onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {

        switch (requestCode) {
            case 1052: {
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED
                        && grantResults[1] == PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this, "Permissin Granted", Toast.LENGTH_SHORT).show();
                    startActivityForResult(new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI), RESULT_LOAD_IMAGE);
                } else {
                    Toast.makeText(this, "Permissin Denied", Toast.LENGTH_SHORT).show();
                }
                return;
            }

        }
    }

}
