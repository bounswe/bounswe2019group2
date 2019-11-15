package tk.traiders.ui.social;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

import tk.traiders.ui.social.children.ArticlesFragment;
import tk.traiders.ui.social.children.EquipmentFragment;
import tk.traiders.ui.social.children.EventsFragment;

public class SocialViewPagerAdapter extends FragmentPagerAdapter {

    public SocialViewPagerAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                return new ArticlesFragment();
            case 1:
                return new EventsFragment();
            case 2:
                return new EquipmentFragment();
            default:
                return null;
        }
    }

    @Override
    public int getCount() {
        return 3;
    }

    @Nullable
    @Override
    public CharSequence getPageTitle(int position) {
        switch (position) {
            case 0:
                return "Articles";
            case 1:
                return "Events";
            case 2:
                return "Equipment";
        }
        return super.getPageTitle(position);
    }
}
