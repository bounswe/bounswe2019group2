package tk.traiders.components.event;

import java.util.Set;

public interface OnResultListener {

    void onResult(Set<String> countries, int importance);
}
