package tk.traiders.ui.markets.children;

import tk.traiders.ui.markets.children.util.ParityFragment;

public class CryptoFragment extends ParityFragment {

    @Override
    protected String getURL() {
        return "https://api.traiders.tk/parity/latest?category=crypto";
    }
}
