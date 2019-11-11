package tk.traiders.components.event;

public interface FilterStateListener {

    FilterState getState();
    void updateState(FilterState newState);
}
