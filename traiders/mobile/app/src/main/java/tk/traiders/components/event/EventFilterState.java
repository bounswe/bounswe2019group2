package tk.traiders.components.event;

import java.util.Set;

public class EventFilterState extends FilterState {

    private int importance;
    private Set<String> countryCodes;

    public EventFilterState(int importance, Set<String> countryCodes) {
        this.importance = importance;
        this.countryCodes = countryCodes;
    }

    public int getImportance() {
        return importance;
    }

    public EventFilterState setImportance(int importance) {
        this.importance = importance;
        return this;
    }

    public Set<String> getCountryCodes() {
        return countryCodes;
    }

    public EventFilterState setCountryCodes(Set<String> countryCodes) {
        this.countryCodes = countryCodes;
        return this;
    }

    @Override
    public String toString() {
        return "EventFilterState{" +
                "importance=" + importance +
                ", countryCodes=" + countryCodes +
                '}';
    }
}
