package tk.traiders.ui.social.children;

import androidx.recyclerview.widget.RecyclerView;

import tk.traiders.marshallers.EquipmentMarshaller;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.social.adapters.EquipmentAdapter;

public class EquipmentFragment extends ListFragment {
    @Override
    protected String getURL() {
        return "https://api.traiders.tk/equipment/";
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        return new EquipmentAdapter(getActivity(), EquipmentMarshaller.unmarshallList(response));
    }
}
