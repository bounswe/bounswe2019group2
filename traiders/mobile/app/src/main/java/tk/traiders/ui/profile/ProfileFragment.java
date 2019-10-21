package tk.traiders.ui.profile;

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
import androidx.viewpager.widget.ViewPager;

import com.google.android.material.tabs.TabLayout;

import tk.traiders.R;


public class ProfileFragment extends Fragment {

    public ViewPager viewPager;


    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        return inflater.inflate(R.layout.fragment_profile, container, false);
    }
    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        viewPager = view.findViewById(R.id.viewPager_profile);
        viewPager.setAdapter(new ProfileViewAdapter(getChildFragmentManager()));
        viewPager.setCurrentItem(2);

        TabLayout tabLayout = view.findViewById(R.id.tabLayout_profile);
        tabLayout.setupWithViewPager(viewPager);
    }
}
