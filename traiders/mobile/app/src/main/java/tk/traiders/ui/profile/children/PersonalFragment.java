package tk.traiders.ui.profile.children;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;


import com.android.volley.AuthFailureError;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.constants.UserConstants;
import tk.traiders.marshallers.FollowingMarshaller;
import tk.traiders.models.Following;
import tk.traiders.ui.profile.avatars.ChooseAvatarActivity;


public class PersonalFragment extends Fragment {

    private TextView textView_name_surname;
    private TextView textView_country;
    private TextView textView_email;
    private TextView textView_username;
    private TextView textView_iban;
    private LinearLayout linearLayout_iban;
    private ImageView imageView_addPhotoProfile;
    private String URL;

    private TextView textView_followersCount;
    private TextView textView_followingCount;
    private RequestQueue requestQueue;

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
        imageView_addPhotoProfile = rootView.findViewById(R.id.imageView_addPhotoProfile);

        textView_followersCount = rootView.findViewById(R.id.textView_followerCount);
        textView_followingCount = rootView.findViewById(R.id.textView_followingCount);

        imageView_addPhotoProfile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getActivity(), ChooseAvatarActivity.class).putExtra("userUrl", URL));
            }
        });


        requestQueue = Volley.newRequestQueue(getParentFragment().getActivity());

        return rootView;
    }

    @Override
    public void onResume() {
        super.onResume();

        URL = MainActivity.getUserURL(getActivity());

        if(URL == null) {
            Toast.makeText(getActivity(), "Please log in to see this page!", Toast.LENGTH_SHORT).show();
            textView_name_surname.setText("");
            textView_country.setText("");
            textView_username.setText("");
            textView_email.setText("");
            textView_iban.setText("");


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
                        String country = jsonObject.getJSONObject("country").getString("name");
                        String city = jsonObject.getString("city");
                        String iban = jsonObject.getString("iban");
                        Boolean is_trader = jsonObject.getBoolean("is_trader");
                        int avatardId = jsonObject.getInt(UserConstants.AVATAR);
                        int avatarDrawableId = ChooseAvatarActivity.getAvatarDrawableId(avatardId);

                        imageView_addPhotoProfile.setImageDrawable(ContextCompat.getDrawable(getContext(), avatarDrawableId));
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

            requestQueue.add(request);

            Uri.Builder builderFollowers = Uri.parse("https://api.traiders.tk/following/").buildUpon();
            builderFollowers.appendQueryParameter("user_followed", MainActivity.getUserID(getContext()));

            String urlWithFiltersFollowers = builderFollowers.build().toString();

            StringRequest followersRequest = new StringRequest(Request.Method.GET, urlWithFiltersFollowers, new Response.Listener<String>() {

                @Override
                public void onResponse(String response) {
                    List<Following> followingList = FollowingMarshaller.unmarshallList(response);
                    textView_followersCount.setText(Integer.toString(followingList.size()));
                }

            }, new Response.ErrorListener() {

                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(getContext(), "An error occured fetching followers count!", Toast.LENGTH_SHORT).show();
                    error.printStackTrace();
                }
            }) {

                @Override
                public Map<String, String> getHeaders() throws AuthFailureError {
                    Map<String, String> headers = MainActivity.getAuthorizationHeader(getContext());
                    return headers != null ? headers : super.getHeaders();
                }

            };

            requestQueue.add(followersRequest);

            Uri.Builder builderFollowings = Uri.parse("https://api.traiders.tk/following/").buildUpon();
            builderFollowings.appendQueryParameter("user_following", MainActivity.getUserID(getContext()));

            String urlWithFiltersFollowings = builderFollowings.build().toString();

            StringRequest followingsRequest = new StringRequest(Request.Method.GET, urlWithFiltersFollowings, new Response.Listener<String>() {

                @Override
                public void onResponse(String response) {
                    List<Following> followingList = FollowingMarshaller.unmarshallList(response);
                    textView_followingCount.setText(Integer.toString(followingList.size()));
                }

            }, new Response.ErrorListener() {

                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(getContext(), "An error occured fetching followings count!", Toast.LENGTH_SHORT).show();
                    error.printStackTrace();
                }
            }) {

                @Override
                public Map<String, String> getHeaders() throws AuthFailureError {
                    Map<String, String> headers = MainActivity.getAuthorizationHeader(getContext());
                    return headers != null ? headers : super.getHeaders();
                }

            };

            requestQueue.add(followingsRequest);



        }

    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if(MainActivity.isUserLoggedIn(getActivity())) {
            inflater.inflate(R.menu.profile_menu_authorized, menu);
        } else {
            inflater.inflate(R.menu.profile_menu_unauthorized, menu);
        }
    }
}
