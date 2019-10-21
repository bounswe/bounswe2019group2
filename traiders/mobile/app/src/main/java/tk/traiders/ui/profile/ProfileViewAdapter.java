package tk.traiders.ui.profile;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

import tk.traiders.ui.profile.children.CommentsFragment;
import tk.traiders.ui.profile.children.FollowersFragment;
import tk.traiders.ui.profile.children.FollowingFragment;
import tk.traiders.ui.profile.children.PersonalArticlesFragment;
import tk.traiders.ui.profile.children.PersonalFragment;

public class ProfileViewAdapter  extends FragmentPagerAdapter {

    public ProfileViewAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                return new PersonalFragment();
            case 1:
                return new PersonalArticlesFragment();
            case 2:
                return new FollowersFragment();
            case 3:
                return new FollowingFragment();
            case 4:
                return new CommentsFragment();

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
                return "Profile";
            case 1:
                return "Articles";
            case 2:
                return "Followers";
            case 3:
                return "Followings";
            case 4:
                return "Comments";
        }
        return super.getPageTitle(position);
    }

}
