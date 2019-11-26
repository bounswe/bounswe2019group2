package tk.traiders.ui.profile.children;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.marshallers.ArticleMarshaller;
import tk.traiders.models.Article;
import tk.traiders.ui.ListFragment;
import tk.traiders.ui.profile.adapters.PersonalArticlesAdapter;


public class PersonalArticlesFragment extends ListFragment {


    @Override
    protected String getURL() {
        return "https://api.traiders.tk/articles/";
    }

    @Override
    protected RecyclerView.Adapter getAdapter(String response) {
        List<Article> articleList = ArticleMarshaller.unmarshallList(response);
        String userId = MainActivity.getUserID(getContext());

        List<Article> filteredArticles = new ArrayList<>();

        for(Article article: articleList) {
            if(article.getAuthor().getId().equals(userId)){
                filteredArticles.add(article);
            }
        }

        return new PersonalArticlesAdapter(getContext(), filteredArticles);
    }
}
