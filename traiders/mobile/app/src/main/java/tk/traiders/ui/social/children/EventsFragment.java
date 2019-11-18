package tk.traiders.ui.social.children;

import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.RecyclerView;

import java.util.HashSet;
import java.util.Set;

import tk.traiders.R;
import tk.traiders.components.event.EventFilterState;
import tk.traiders.components.event.FilterState;
import tk.traiders.components.event.FilterStateListener;
import tk.traiders.components.event.OnResultListener;
import tk.traiders.marshallers.ArticleMarshaller;
import tk.traiders.marshallers.EventMarshaller;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.social.adapters.ArticlesAdapter;
import tk.traiders.ui.social.adapters.EventsAdapter;

public class EventsFragment extends ListFragment implements OnResultListener, FilterStateListener {

    private int importance = 0;
    private Set<String> countryCodes = new HashSet<>();

    private String BASE_URL = "https://api.traiders.tk/events/";

    @Override
    protected String getURL() {
        Uri.Builder builder = Uri.parse(BASE_URL).buildUpon();
        for(String countryCode: countryCodes) {
            builder.appendQueryParameter("country", countryCode);
        }
        if(importance != 0) {
            builder.appendQueryParameter("importance", String.valueOf(importance));
        }
        String urlWithFilters = builder.build().toString();
        return urlWithFilters ;
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        return new EventsAdapter(getActivity(), EventMarshaller.unmarshallList(response));
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.events_menu, menu);
    }


    @Override
    public void onResult(Set<String> countries, int importance) {
        Uri.Builder builder = Uri.parse(getURL()).buildUpon();
        for(String country: countries) {
            builder.appendQueryParameter("country", country);
        }
        if(importance != 0) {
            builder.appendQueryParameter("importance", String.valueOf(importance));
        }
        String filterURL = builder.build().toString();
        super.fetchDataWithFilters(filterURL);
    }

    @Override
    public FilterState getState() {
        return new EventFilterState(importance, countryCodes);
    }

    @Override
    public void updateState(FilterState newState) {

        if(newState instanceof EventFilterState) {
            EventFilterState eventFilterState = (EventFilterState) newState;
            this.importance = eventFilterState.getImportance();
            this.countryCodes = eventFilterState.getCountryCodes();
            super.fetchData();

        }
    }
}
