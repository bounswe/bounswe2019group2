package tk.traiders.ui.portfolio;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;

import tk.traiders.R;

public class PortfolioFragment extends Fragment {

    private PortfolioViewModel portfolioViewModel;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        portfolioViewModel =
                ViewModelProviders.of(this).get(PortfolioViewModel.class);
        View root = inflater.inflate(R.layout.fragment_portfolio, container, false);
        final TextView textView = root.findViewById(R.id.text_portfolio);
        portfolioViewModel.getText().observe(this, new Observer<String>() {
            @Override
            public void onChanged(@Nullable String s) {
                textView.setText(s);
            }
        });
        return root;
    }
}
