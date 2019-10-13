package tk.traiders.ui.markets;

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

public class MarketsFragment extends Fragment {

    private MarketsViewModel marketsViewModel;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        marketsViewModel =
                ViewModelProviders.of(this).get(MarketsViewModel.class);
        View root = inflater.inflate(R.layout.fragment_markets, container, false);
        final TextView textView = root.findViewById(R.id.text_markets);
        marketsViewModel.getText().observe(this, new Observer<String>() {
            @Override
            public void onChanged(@Nullable String s) {
                textView.setText(s);
            }
        });
        return root;
    }
}
