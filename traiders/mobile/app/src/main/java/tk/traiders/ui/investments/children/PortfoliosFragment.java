package tk.traiders.ui.investments.children;

import android.net.Uri;
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

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.marshallers.AlarmMarshaller;
import tk.traiders.marshallers.PortfolioMarshaller;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.investments.adapters.AlarmAdapter;
import tk.traiders.ui.investments.adapters.PortfolioAdapter;

public class PortfoliosFragment extends ListFragment {


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.portfolios_menu, menu);
    }

    @Override
    protected String getURL() {
        Uri.Builder builder = Uri.parse("https://api.traiders.tk/portfolio/").buildUpon();
        builder.appendQueryParameter("user", MainActivity.getUserID(getContext()));
        return builder.build().toString();
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        return new PortfolioAdapter(getActivity(), PortfolioMarshaller.unmarshallList(response));
    }
}
