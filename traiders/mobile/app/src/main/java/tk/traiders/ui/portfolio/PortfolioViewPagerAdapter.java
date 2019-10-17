package tk.traiders.ui.portfolio;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

import tk.traiders.ui.portfolio.children.AlarmsFragment;
import tk.traiders.ui.portfolio.children.ChildPortfolioFragment;

public class PortfolioViewPagerAdapter extends FragmentPagerAdapter {

    public PortfolioViewPagerAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                return new ChildPortfolioFragment();
            case 1:
                return new AlarmsFragment();
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
                return "Portfolio";
            case 1:
                return "Alarms";
        }
        return super.getPageTitle(position);
    }
}
