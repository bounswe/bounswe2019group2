package tk.traiders.ui.social.children;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Adapter;

import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import tk.traiders.R;
import tk.traiders.marshallers.ArticleMarshaller;
import tk.traiders.models.Article;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.social.adapters.ArticlesAdapter;

public class ArticlesFragment extends ListFragment {

    @Override
    protected String getURL() {
        return "https://api.traiders.tk/articles/";
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        return new ArticlesAdapter(getActivity(), ArticleMarshaller.unmarshallList(response));
    }

}
