package tk.traiders.ui.markets;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

import tk.traiders.ui.markets.children.CommodityFragment;
import tk.traiders.ui.markets.children.CryptoFragment;
import tk.traiders.ui.markets.children.CurrencyFragment;
import tk.traiders.ui.markets.children.IndexFragment;
import tk.traiders.ui.markets.children.ParityFragment;
import tk.traiders.ui.markets.children.MetalFragment;
import tk.traiders.ui.markets.children.StockFragment;

public class MarketsViewPagerAdapter extends FragmentPagerAdapter {

    public MarketsViewPagerAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int position) {
        switch (position){
            case 0:
                return new CurrencyFragment();
            case 1:
                return new MetalFragment();
            case 2:
                return new StockFragment();
            case 3:
                return new ParityFragment();
            case 4:
                return new CryptoFragment();
            case 5:
                return new IndexFragment();
            case 6:
                return new CommodityFragment();
            default:
                return null;
        }
    }

    @Override
    public int getCount() {
        return 7;
    }

    @Nullable
    @Override
    public CharSequence getPageTitle(int position) {
        switch (position) {
            case 0:
                return "Currency";
            case 1:
                return "Metal";
            case 2:
                return "Stock";
            case 3:
                return "Parity";
            case 4:
                return "Crypto";
            case 5:
                return "Index";
            case 6:
                return "Commodity";
        }
        return super.getPageTitle(position);
    }
}
