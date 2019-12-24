package tk.traiders.ui.search;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

import tk.traiders.ui.search.children.RecommendationsFragment;
import tk.traiders.ui.search.children.SubSearchFragment;

public class SearchViewPagerAdapter extends FragmentPagerAdapter {

    public SearchViewPagerAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                return new SubSearchFragment();
            case 1:
                return new RecommendationsFragment();
            default:
                return null;
        }
    }

    @Override
    public int getCount() {
        return 2;
    }

    @Nullable
    @Override
    public CharSequence getPageTitle(int position) {
        switch (position) {
            case 0:
                return "Search";
            case 1:
                return "Recommendations";
        }
        return super.getPageTitle(position);
    }
}
