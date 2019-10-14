package tk.traiders.ui.investments;

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

public class InvestmentsFragment extends Fragment {

    private InvestmentsViewModel investmentsViewModel;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        investmentsViewModel =
                ViewModelProviders.of(this).get(InvestmentsViewModel.class);
        View root = inflater.inflate(R.layout.fragment_investments, container, false);
        final TextView textView = root.findViewById(R.id.text_investments);
        investmentsViewModel.getText().observe(this, new Observer<String>() {
            @Override
            public void onChanged(@Nullable String s) {
                textView.setText(s);
            }
        });
        return root;
    }
}
