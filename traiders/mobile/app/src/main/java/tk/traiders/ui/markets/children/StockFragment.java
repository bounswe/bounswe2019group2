package tk.traiders.ui.markets.children;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import tk.traiders.R;
import tk.traiders.ui.markets.children.util.ParityFragment;

public class StockFragment extends ParityFragment {

    @Override
    protected String getURL() {
        return "https://api.traiders.tk/parity/latest?category=stock";
    }
}
