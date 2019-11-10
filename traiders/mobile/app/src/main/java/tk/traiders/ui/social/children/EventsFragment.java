package tk.traiders.ui.social.children;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.RecyclerView;

import tk.traiders.R;
import tk.traiders.marshallers.ArticleMarshaller;
import tk.traiders.marshallers.EventMarshaller;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.social.adapters.ArticlesAdapter;
import tk.traiders.ui.social.adapters.EventsAdapter;

public class EventsFragment extends ListFragment {

    @Override
    protected String getURL() {
        return "https://api.traiders.tk/events/";
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
}
