package tk.traiders.ui.profile.children;


import android.net.Uri;

import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.marshallers.FollowingMarshaller;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.profile.adapters.FollowingAdapter;
import tk.traiders.ui.social.adapters.UsersAdapter;


public class FollowingFragment extends ListFragment {

    private static final String BASE_URL = "https://api.traiders.tk/following/";

    @Override
    protected String getURL() {
        Uri.Builder builder = Uri.parse(BASE_URL).buildUpon();
        builder.appendQueryParameter("user_following", MainActivity.getUserID(getContext()));
        String urlWithFilters = builder.build().toString();
        return urlWithFilters ;
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        return new FollowingAdapter(getContext(), FollowingMarshaller.unmarshallList(response), "following");
    }
}
