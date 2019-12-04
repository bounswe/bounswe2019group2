package tk.traiders.ui.markets.children.util;

import androidx.recyclerview.widget.RecyclerView;

import tk.traiders.marshallers.ParityMarshaller;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.markets.adapters.ParityAdapter;

public abstract class ParityFragment extends ListFragment {

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        return new ParityAdapter(getActivity(), ParityMarshaller.unmarshallList(response));
    }
}
