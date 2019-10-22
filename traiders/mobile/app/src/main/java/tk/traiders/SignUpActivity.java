package tk.traiders;

import android.content.Intent;
import android.os.Bundle;
import android.util.Patterns;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

public class SignUpActivity extends AppCompatActivity {

    private static final int REQUEST_CODE = 999;

    private EditText editText_username;
    private EditText editText_passowerd;
    private EditText editText_email;
    private EditText editText_name;
    private EditText editText_surname;
    private EditText editText_iban;
    private String city = null;
    private String country = null;
    private EditText editText_country;
    private EditText editText_city;

    private RequestQueue requestQueue;
    final private static String URL = "https://api.traiders.tk/users/";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

        requestQueue = Volley.newRequestQueue(this);

        editText_username = findViewById(R.id.editText_username);
        editText_passowerd = findViewById(R.id.editText_password);
        editText_email = findViewById(R.id.editText_email);
        editText_name = findViewById(R.id.editText_name);
        editText_surname = findViewById(R.id.editText_surname);
        editText_iban = findViewById(R.id.editText_iban);
        editText_country = findViewById(R.id.editText_country);
        editText_city = findViewById(R.id.editText_city);

        editText_country.setEnabled(false);
        editText_city.setEnabled(false);

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

    public void SignUpClick(View view) {

        final String username = editText_username.getText().toString();
        final String password = editText_passowerd.getText().toString();
        final String email = editText_email.getText().toString();
        final String name = editText_name.getText().toString();
        final String surname = editText_surname.getText().toString();
        final String iban = editText_iban.getText().toString();

        if(username.isEmpty()){
            editText_username.setError("Username cannot be empty");
            return;
        }

        if(password.isEmpty()){
            editText_passowerd.setError("Password cannot be empty");
            return;
        }

        if(password.length() < 8) {
            editText_passowerd.setError("Password should be at least 8 characters!");
            return;
        }

        if(email.isEmpty()) {
            editText_email.setError("Email cannot be empty!");
            return;
        }

        if(!Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
            editText_email.setError("Please enter a valid email address!");
            return;
        }

        if(name.isEmpty()) {
            editText_name.setError("Name cannot be empty!");
            return;
        }

        if(surname.isEmpty()) {
            editText_surname.setError("Surname cannot be empty!");
            return;
        }

        if(country == null) {
            editText_country.setError("Please choose a location!");
            return;
        }

        if(city == null) {
            editText_city.setError("Please choose a location!");
            return;
        }

        JSONObject body = new JSONObject();

        try {
            body.put("password", password);
            body.put("username", username);
            body.put("first_name", name);
            body.put("last_name", surname);
            body.put("email", email);
            body.put("is_trader", !iban.isEmpty());
            body.put("iban", iban);
            body.put("city", city);
            body.put("country", country);
            body.put("city", city);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        JsonObjectRequest postRequest = new JsonObjectRequest(Request.Method.POST, URL, body,
                new Response.Listener<JSONObject>()
                {
                    @Override
                    public void onResponse(JSONObject response) {
                        // response
                        Toast.makeText(SignUpActivity.this, "Signed Up", Toast.LENGTH_SHORT).show();
                        finish();
                    }
                },
                new Response.ErrorListener()
                {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(SignUpActivity.this, "Something is wrong!", Toast.LENGTH_SHORT).show();
                        error.printStackTrace();
                    }
                }
        ){};

        requestQueue.add(postRequest);

    }

    public void ChooseLocationClick(View view) {
        startActivityForResult(new Intent(this, LocationActivity.class), REQUEST_CODE);
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_CODE) {
            if (resultCode == RESULT_OK) {
                country = data.getStringExtra("country");
                city = data.getStringExtra("city");
                editText_country.setText(country);
                editText_city.setText(city);
            }
        }
    }
}
