package tk.traiders.ui.investments.children;

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
import tk.traiders.marshallers.AlarmMarshaller;
import tk.traiders.marshallers.NotificationMarshaller;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.investments.adapters.AlarmAdapter;
import tk.traiders.ui.investments.adapters.NotificationAdapter;

public class AlarmsFragment extends ListFragment {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.alarms_menu, menu);
    }

    @Override
    protected String getURL() {
        return "https://api.traiders.tk/alert/";
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        return new AlarmAdapter(getActivity(), AlarmMarshaller.unmarshallList(response));
    }
}
