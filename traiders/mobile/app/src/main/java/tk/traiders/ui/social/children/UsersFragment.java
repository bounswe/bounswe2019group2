package tk.traiders.ui.social.children;

import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.net.ssl.SSLEngineResult;

import tk.traiders.MainActivity;
import tk.traiders.marshallers.ArticleMarshaller;
import tk.traiders.models.Article;
import tk.traiders.models.User;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.social.adapters.UsersAdapter;

public class UsersFragment extends ListFragment {
    @Override
    protected String getURL() {
        return "https://api.traiders.tk/articles/";
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {

        List<Article> articleList = ArticleMarshaller.unmarshallList(response);

        List<User> users = new ArrayList<>();

        Set<String> userSet = new HashSet<>();

        userSet.add(MainActivity.getUserURL(getContext()));

        for(Article article: articleList) {
            if(!userSet.contains(article.getAuthor().getUrl())){
                userSet.add(article.getAuthor().getUrl());
                users.add(article.getAuthor());
            }

        }

        return new UsersAdapter(getContext(), users);
    }
}
