package tk.traiders.components.event;

import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.widget.SearchView;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.navigation.fragment.NavHostFragment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import tk.traiders.R;
import tk.traiders.ui.social.children.EventsFragment;

public class EventFilterFragment extends DialogFragment {

    private RatingBar ratingBar;
    private SearchView searchView;
    private ListView listView;
    private Button button;
    ArrayAdapter<String> adapter;

    private List<String> countries = new ArrayList<>();
    private Map<String, String> isoCodeFromCountryName = new HashMap<>();
    private Map<String, String> countryNameFromIsoCode = new HashMap<>();


    private int importance = 0;
    private String country = "ALL";

    private Set<String> chosenCountries = new HashSet<>();


    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_filter, container, false);

        for(String isoCountry: Locale.getISOCountries()) {
            Locale locale = new Locale("en", isoCountry);
            isoCodeFromCountryName.put(locale.getDisplayCountry(), isoCountry);
            countries.add(locale.getDisplayCountry());
            countryNameFromIsoCode.put(isoCountry, locale.getDisplayCountry());
        }

        EventsFragment eventsFragment = getEventsFragment();

        EventFilterState currentState =(EventFilterState) ((FilterStateListener) eventsFragment).getState();
        importance = currentState.getImportance();

        Set<String> currentChosenCountries = new HashSet<>();

        for(String countryCode: currentState.getCountryCodes()) {
            currentChosenCountries.add(countryNameFromIsoCode.get(countryCode));
        }

        chosenCountries = currentChosenCountries;


        ratingBar = rootView.findViewById(R.id.filterFragment_ratingBar);
        ratingBar.setRating(importance);
        ratingBar.setOnRatingBarChangeListener(new RatingBar.OnRatingBarChangeListener() {
            @Override
            public void onRatingChanged(RatingBar ratingBar, float rating, boolean fromUser) {
                EventFilterFragment.this.importance = (int) rating;
                if(importance == 0) {
                    Toast.makeText(getActivity(), "Importance: All", Toast.LENGTH_SHORT).show();

                } else {
                    Toast.makeText(getActivity(), "Importance: " + EventFilterFragment.this.importance, Toast.LENGTH_SHORT).show();
                }
            }
        });


        searchView = rootView.findViewById(R.id.filterFragment_searchView);
        searchView.setIconified(false);
        searchView.clearFocus();
        /*
        searchView.setFocusable(true);
        searchView.requestFocusFromTouch();
        */


        listView = rootView.findViewById(R.id.filterFragment_listView);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                country = (String) listView.getAdapter().getItem(position);

                //country = countries.get(position);

                if (chosenCountries.contains(country)) {
                    chosenCountries.remove(country);
                } else {
                    chosenCountries.add(country);
                }

                adapter.notifyDataSetChanged();
                if(chosenCountries.isEmpty()) {
                    Toast.makeText(getActivity(), "Countries: All", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(getActivity(), "" + chosenCountries.toString(), Toast.LENGTH_SHORT).show();
                }
            }
        });
        button = rootView.findViewById(R.id.filterFragment_button);

        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, countries) {

            @NonNull
            @Override
            public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
                final View view = super.getView(position, convertView, parent);
                TextView textView = view.findViewById(android.R.id.text1);
                if(chosenCountries.contains(textView.getText().toString())) {
                    view.setBackgroundColor(getResources().getColor(R.color.primaryLightColor));
                } else {
                    view.setBackgroundColor(Color.TRANSPARENT);
                }
                return view;
            }

        };
        listView.setAdapter(adapter);

        searchView.setQueryHint("search country...");
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                Toast.makeText(getContext(), newText, Toast.LENGTH_SHORT).show();
                adapter.getFilter().filter(newText);
                adapter.notifyDataSetChanged();
                return false;
            }
        });

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                EventsFragment eventsFragment = getEventsFragment();

                Set<String> chosenCountryCodes = new HashSet<>();

                for(String country: chosenCountries) {
                    chosenCountryCodes.add(isoCodeFromCountryName.get(country));
                }

                ((FilterStateListener) eventsFragment).updateState(new EventFilterState(importance, chosenCountryCodes));

                //((OnResultListener) eventsFragment).onResult(chosenCountryCodes, importance);
                dismiss();
            }
        });


        return rootView;
    }

    private EventsFragment getEventsFragment(){
        NavHostFragment navHostFragment = (NavHostFragment) getActivity().getSupportFragmentManager().findFragmentById(R.id.nav_host_fragment);
        Fragment socialFragment = navHostFragment.getChildFragmentManager().getFragments().get(0);
        EventsFragment eventsFragment = (EventsFragment) socialFragment.getChildFragmentManager().getFragments().get(1);
        return eventsFragment;
    }
}
