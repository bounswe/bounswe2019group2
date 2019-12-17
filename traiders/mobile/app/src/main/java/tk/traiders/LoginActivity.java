package tk.traiders;

import android.accounts.AccountManager;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.auth.GoogleAuthUtil;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInClient;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.SignInButton;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.tasks.Task;


import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;



public class LoginActivity extends AppCompatActivity
        implements View.OnClickListener, Response.Listener<String>, Response.ErrorListener {

    private EditText editText_username;
    private EditText editText_password;
    private RequestQueue requestQueue;

    SignInButton signInButton;

    GoogleSignInClient mGoogleSignInClient;

    int RC_SIGN_IN=9001;


    final private static String URL = "https://api.traiders.tk/token/";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        editText_username = findViewById(R.id.editText_username);
        editText_password = findViewById(R.id.editText_password);

        requestQueue = Volley.newRequestQueue(this);

        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setDisplayShowHomeEnabled(true);
        }

        signInButton = findViewById(R.id.sign_in_google_button);
        String s=null;
        signInButton.setOnClickListener(this);

        GoogleSignInOptions gso = new GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
                .requestEmail()
                .requestProfile()
                .requestServerAuthCode("729799288738-fe0gs3ahsru0ecfn242gvtq5m83rog57.apps.googleusercontent.com")
                .build();

        mGoogleSignInClient = GoogleSignIn.getClient(this, gso);
    }
    private void signIn() {
        Intent signInIntent = mGoogleSignInClient.getSignInIntent();
        startActivityForResult(signInIntent, RC_SIGN_IN);
    }

    @Override
    protected void onStart() {
        super.onStart();

        GoogleSignInAccount account = GoogleSignIn.getLastSignedInAccount(this);

        //if user logged in before
        if(account != null)
        {
            System.out.println("buraya mı giriyo acaba");
        }
        else
        {

        }
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        // Result returned from launching the Intent from GoogleSignInClient.getSignInIntent(...);
        if (requestCode == RC_SIGN_IN) {
            // The Task returned from this call is always completed, no need to attach
            // a listener.
            Task<GoogleSignInAccount> task = GoogleSignIn.getSignedInAccountFromIntent(data);
            handleSignInResult(task);
        }
    }
    private void handleSignInResult(Task<GoogleSignInAccount> completedTask) {
        try {
            GoogleSignInAccount account = completedTask.getResult(ApiException.class);

            String authCode = account.getServerAuthCode();

            StringRequest postRequest =
                    new StringRequest(Request.Method.POST, URL, this, this) {
                        @Override
                        protected Map<String, String> getParams()
                        {
                            Map<String, String>  params = new HashMap<String, String>();
                            params.put("google_auth_code", authCode);

                            return params;
                        }
                    };

            requestQueue.add(postRequest);

        } catch (ApiException e) {
            // The ApiException status code indicates the detailed failure reason.
            // Please refer to the GoogleSignInStatusCodes class reference for more information.
            Log.w("Error: ", "signInResult:failed code=" + e.getMessage());
        }
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        if (item.getItemId() == android.R.id.home) {
            finish();
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onResponse(String response) {
        // response
        Log.d("Response", response);
        try {
            JSONObject jsonObject = new JSONObject(response);
            String token = jsonObject.getString("key");
            String user =  jsonObject.getJSONObject("user").getString("url");
            String id =  jsonObject.getJSONObject("user").getString("id");

            SharedPreferences sharedPreferences = getSharedPreferences("auth", MODE_PRIVATE);
            SharedPreferences.Editor editor = sharedPreferences.edit();
            editor.putString("token", token);
            editor.putString("user", user);
            editor.putString("id", id);
            editor.commit();

            finish();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onErrorResponse(VolleyError error) {
        // error
        error.printStackTrace();
        Toast.makeText(LoginActivity.this, "Username or password is wrong!", Toast.LENGTH_SHORT).show();
    }

    public void LoginClick(View view) {
        final String username = editText_username.getText().toString();
        final String password = editText_password.getText().toString();

        StringRequest postRequest =
                new StringRequest(Request.Method.POST, URL, this, this) {
            @Override
            protected Map<String, String> getParams()
            {
                Map<String, String>  params = new HashMap<String, String>();
                params.put("username", username);
                params.put("password", password);

                return params;
            }
        };

        requestQueue.add(postRequest);
    }

    public void SignUpClick(View view) {
        startActivity(new Intent(this, SignUpActivity.class));
    }


    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.sign_in_google_button:
                signIn();
                break;
        }
    }
}
