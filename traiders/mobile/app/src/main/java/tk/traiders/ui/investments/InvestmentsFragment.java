package tk.traiders.ui.investments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import androidx.viewpager.widget.ViewPager;

import com.google.android.material.tabs.TabLayout;

import tk.traiders.R;

public class InvestmentsFragment extends Fragment {

    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        return inflater.inflate(R.layout.fragment_investments, container, false);
    }


    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ViewPager viewPager = view.findViewById(R.id.viewPager_investments);
        viewPager.setAdapter(new InvestmentsViewPager(getChildFragmentManager()));
        TabLayout tabLayout = view.findViewById(R.id.tabLayout_investments);
        tabLayout.setupWithViewPager(viewPager);
    }


}
