package tk.traiders.ui.investments;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class InvestmentsViewModel extends ViewModel {

    private MutableLiveData<String> mText;

    public InvestmentsViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("This is investments fragment");
    }

    public LiveData<String> getText() {
        return mText;
    }

}
