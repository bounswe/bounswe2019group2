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

import tk.traiders.LocationActivity;
import tk.traiders.R;
import tk.traiders.models.Country;

public class FilterFragment extends DialogFragment {

    private RatingBar ratingBar;
    private SearchView searchView;
    private ListView listView;
    private Button button;
    ArrayAdapter<String> adapter;

    private List<String> countries = new ArrayList<>();
    private Map<String, String> isoCodefromCountryName = new HashMap<>();

    private int importance = 0;
    private String country = "ALL";

    private Set<String> chosenCountries = new HashSet<>();


    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_filter, container, false);

        ratingBar = rootView.findViewById(R.id.filterFragment_ratingBar);
        ratingBar.setRating(importance);
        ratingBar.setOnRatingBarChangeListener(new RatingBar.OnRatingBarChangeListener() {
            @Override
            public void onRatingChanged(RatingBar ratingBar, float rating, boolean fromUser) {
                FilterFragment.this.importance = (int) rating;
                Toast.makeText(getActivity(), "Importance: " + FilterFragment.this.importance, Toast.LENGTH_SHORT).show();
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
                Toast.makeText(getActivity(), "" + chosenCountries.toString(), Toast.LENGTH_SHORT).show();
            }
        });
        button = rootView.findViewById(R.id.filterFragment_button);


        for(String isoCountry: Locale.getISOCountries()) {
            Locale locale = new Locale("en", isoCountry);
            isoCodefromCountryName.put(locale.getDisplayCountry(), isoCountry);
            countries.add(locale.getDisplayCountry());
        }

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
                NavHostFragment navHostFragment = (NavHostFragment) getActivity().getSupportFragmentManager().findFragmentById(R.id.nav_host_fragment);
                Fragment socialFragment = navHostFragment.getChildFragmentManager().getFragments().get(0);
                Fragment eventsFragment = socialFragment.getChildFragmentManager().getFragments().get(1);
                Set<String> chosenCountryCodes = new HashSet<>();

                for(String country: chosenCountries) {
                    chosenCountryCodes.add(isoCodefromCountryName.get(country));
                }

                ((OnResultListener) eventsFragment).onResult(chosenCountryCodes, importance);
                dismiss();
            }
        });


        return rootView;
    }
}
