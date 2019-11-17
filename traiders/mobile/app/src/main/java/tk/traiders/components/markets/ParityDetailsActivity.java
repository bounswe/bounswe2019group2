package tk.traiders.components.markets;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.Toast;

import tk.traiders.R;

public class ParityDetailsActivity extends AppCompatActivity {

    private String parityUrl;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_parity);

        Intent intent = getIntent();

        if(intent != null && intent.hasExtra("parityUrl")) {
            parityUrl = intent.getStringExtra("parityUrl");
        }

        Toast.makeText(this, parityUrl, Toast.LENGTH_LONG).show();

        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setDisplayShowHomeEnabled(true);
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        if (item.getItemId() == android.R.id.home) {
            finish();
        }
        return super.onOptionsItemSelected(item);
    }
}
