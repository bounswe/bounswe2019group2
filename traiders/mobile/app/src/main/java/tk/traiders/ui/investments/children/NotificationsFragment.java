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

import java.util.Collections;
import java.util.List;

import tk.traiders.R;
import tk.traiders.marshallers.ArticleMarshaller;
import tk.traiders.marshallers.NotificationMarshaller;
import tk.traiders.models.Notification;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.investments.adapters.NotificationAdapter;
import tk.traiders.ui.social.adapters.ArticlesAdapter;

public class NotificationsFragment extends ListFragment {

    @Override
    protected String getURL() {
        return "https://api.traiders.tk/notification/";
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        List<Notification> notifications = NotificationMarshaller.unmarshallList(response);
        Collections.reverse(notifications);
        return new NotificationAdapter(getActivity(), notifications);
    }

}
