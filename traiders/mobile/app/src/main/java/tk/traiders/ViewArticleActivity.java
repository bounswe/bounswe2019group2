package tk.traiders;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import tk.traiders.models.Article;

public class ViewArticleActivity extends AppCompatActivity {

    private Article article = null;

    private TextView textView_title;
    private ImageView imageView_image;
    private TextView textView_content;
    private TextView textView_publishedAt;
    private TextView textView_writtenBy;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_article);

        textView_title = findViewById(R.id.activityViewArticle_textView_title);
        imageView_image = findViewById(R.id.activityViewArticle_imageView_image);
        textView_content = findViewById(R.id.activityViewArticle_textView_content);
        textView_publishedAt = findViewById(R.id.activityViewArticle_textView_publishedAt);
        textView_writtenBy = findViewById(R.id.activityViewArticle_textView_writtenBy);

        textView_publishedAt.setVisibility(View.INVISIBLE);
        textView_writtenBy.setVisibility(View.INVISIBLE);

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
        }

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case android.R.id.home:
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
