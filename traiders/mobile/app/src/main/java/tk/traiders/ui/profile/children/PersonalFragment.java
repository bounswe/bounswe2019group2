package tk.traiders.ui.profile.children;

import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;


import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;

import tk.traiders.MainActivity;
import tk.traiders.R;


public class PersonalFragment extends Fragment {

    private TextView textView_name_surname;
    private TextView textView_country;
    private TextView textView_email;
    private TextView textView_username;
    private TextView textView_iban;
    private LinearLayout linearLayout_iban;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        View rootView = inflater.inflate(R.layout.fragment_personal, container, false);

        textView_name_surname = rootView.findViewById(R.id.personal_textView_name_surname);
        textView_country = rootView.findViewById(R.id.personal_textView_country);
        textView_email = rootView.findViewById(R.id.personal_textView_email);
        textView_username = rootView.findViewById(R.id.personal_textView_username);
        textView_iban = rootView.findViewById(R.id.personal_textView_iban);
        linearLayout_iban = rootView.findViewById(R.id.personal_linearLayout_iban);


        RequestQueue queue = Volley.newRequestQueue(getParentFragment().getActivity());

        String URL = MainActivity.getUserURL(getActivity());

        if(URL == null) {
            Toast.makeText(getActivity(), "Please log in to see this page!", Toast.LENGTH_SHORT).show();
            return rootView;
        }

        if(!URL.contains("https")){
            URL = URL.replace("http","https");
        }

        if (URL == null) {
            Toast.makeText(getActivity(), "Please log in to see this page!", Toast.LENGTH_SHORT).show();
        } else {

            StringRequest request = new StringRequest(Request.Method.GET, URL, new Response.Listener<String>() {

                @Override
                public void onResponse(String response) {
                    Log.d("response", response);
                    ArrayList<String> elements = new ArrayList<>();

                    try {

                        String UTF8_response = null;

                        try {
                            UTF8_response = new String(response.getBytes("ISO-8859-1"), "UTF-8");
                        } catch (UnsupportedEncodingException e) {

                            e.printStackTrace();
                        }

                        JSONObject jsonObject = new JSONObject(UTF8_response);
                        String username = jsonObject.getString("username");
                        String first_name = jsonObject.getString("first_name");
                        String last_name = jsonObject.getString("last_name");
                        String email = jsonObject.getString("email");
                        String country = jsonObject.getString("country");
                        String city = jsonObject.getString("city");
                        String iban = jsonObject.getString("iban");
                        Boolean is_trader = jsonObject.getBoolean("is_trader");

                        textView_name_surname.setText(StringUtils.capitalize(first_name) + " " + StringUtils.capitalize(last_name));
                        textView_country.setText(city + " ," + country);
                        textView_username.setText(username);
                        textView_email.setText(email);
                        if (is_trader) {
                            textView_iban.setText(iban);
                        } else {
                            linearLayout_iban.setVisibility(View.GONE);
                        }


                    } catch (JSONException e) {
                        e.printStackTrace();
                    }

                }

            }, new Response.ErrorListener() {

                @Override
                public void onErrorResponse(VolleyError error) {
                    Log.d("error",error.toString());
                }
            });

            queue.add(request);

        }

        return rootView;
    }

    @Override
    public void onResume() {

        RequestQueue queue = Volley.newRequestQueue(getParentFragment().getActivity());

        String URL = MainActivity.getUserURL(getActivity());

        if(URL == null) {
            textView_name_surname.setText("");
            textView_country.setText("");
            textView_username.setText("");
            textView_email.setText("");
            textView_iban.setText("");
            super.onResume();
            return;
        }

        if(!URL.contains("https")){
            URL = URL.replace("http","https");
        }

        StringRequest request = new StringRequest(Request.Method.GET, URL, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                Log.d("response", response);
                ArrayList<String> elements = new ArrayList<>();

                try {

                    String UTF8_response = null;

                    try {
                        UTF8_response = new String(response.getBytes("ISO-8859-1"), "UTF-8");
                    } catch (UnsupportedEncodingException e) {

                        e.printStackTrace();
                    }

                    JSONObject jsonObject = new JSONObject(UTF8_response);
                    String username = jsonObject.getString("username");
                    String first_name = jsonObject.getString("first_name");
                    String last_name = jsonObject.getString("last_name");
                    String email = jsonObject.getString("email");
                    String country = jsonObject.getString("country");
                    String city = jsonObject.getString("city");
                    String iban = jsonObject.getString("iban");
                    Boolean is_trader = jsonObject.getBoolean("is_trader");

                    textView_name_surname.setText(StringUtils.capitalize(first_name) + " " + StringUtils.capitalize(last_name));
                    textView_country.setText(city + ", " + country);
                    textView_username.setText(username);
                    textView_email.setText(email);
                    if (is_trader) {
                        textView_iban.setText(iban);
                    } else {
                        linearLayout_iban.setVisibility(View.GONE);
                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("error",error.toString());
            }
        });

        queue.add(request);

        super.onResume();

    }
}
