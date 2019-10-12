package tk.traiders.ui.markets;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class MarketsViewModel extends ViewModel {

    private MutableLiveData<String> mText;

    public MarketsViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("This is markets fragment");
    }

    public LiveData<String> getText() {
        return mText;
    }
}
