package tk.traiders.ui.investments.children;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;

import androidx.recyclerview.widget.RecyclerView;

import tk.traiders.R;
import tk.traiders.marshallers.AlarmMarshaller;
import tk.traiders.marshallers.AssetMarshaller;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.investments.adapters.AlarmAdapter;
import tk.traiders.ui.investments.adapters.AssetAdapter;

public class AssetsFragment extends ListFragment {
    @Override
    protected String getURL() {
        return "https://api.traiders.tk/asset/";
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        return new AssetAdapter(getActivity(), AssetMarshaller.unmarshallList(response));
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.assets_menu, menu);
    }
}
