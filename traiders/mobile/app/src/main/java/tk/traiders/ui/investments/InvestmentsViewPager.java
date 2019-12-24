package tk.traiders.ui.investments;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

import tk.traiders.models.Asset;
import tk.traiders.ui.investments.children.AssetsFragment;
import tk.traiders.ui.investments.children.InvestmentFragment;
import tk.traiders.ui.investments.children.NotificationsFragment;
import tk.traiders.ui.investments.children.PortfoliosFragment;
import tk.traiders.ui.investments.children.AlarmsFragment;


public class InvestmentsViewPager extends FragmentPagerAdapter {

    public InvestmentsViewPager(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                return new InvestmentFragment();
            case 1:
                return new AssetsFragment();
            case 2:
                return new PortfoliosFragment();
            case 3:
                return new AlarmsFragment();
            case 4:
                return new NotificationsFragment();
            default:
                return null;
        }
    }

    @Override
    public int getCount() {
        return 5;
    }

    @Nullable
    @Override
    public CharSequence getPageTitle(int position) {
        switch (position) {
            case 0:
                return "Investment";
            case 1:
                return "Asset";
            case 2:
                return "Portfolio";
            case 3:
                return "Alarms";
            case 4:
                return "Notifications";
        }
        return super.getPageTitle(position);
    }
}
