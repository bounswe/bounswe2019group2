package tk.traiders;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.navigation.NavController;
import androidx.navigation.NavDestination;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationView;

public class MainActivity extends AppCompatActivity implements NavController.OnDestinationChangedListener {

    private BottomNavigationView bottomNavigationView;
    private NavController navController;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        bottomNavigationView = findViewById(R.id.nav_view);
        // Passing each menu ID as a set of Ids because each
        // menu should be considered as top level destinations.
        AppBarConfiguration appBarConfiguration = new AppBarConfiguration.Builder(
                R.id.navigation_portfolio, R.id.navigation_markets, R.id.navigation_investments, R.id.navigation_social, R.id.navigation_profile)
                .build();
        navController = Navigation.findNavController(this, R.id.nav_host_fragment);
        NavigationUI.setupActionBarWithNavController(this, navController, appBarConfiguration);
        NavigationUI.setupWithNavController(bottomNavigationView, navController);
        navController.addOnDestinationChangedListener(this);
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (navController.getCurrentDestination().getId() == R.id.navigation_profile) {
             if(isUserLoggedIn(this)) {
                 invalidateOptionsMenu();
             } else {
                 Toast.makeText(this, "You are supposed to log in!", Toast.LENGTH_SHORT).show();
             }
        }
    }

    @Override
    public void onDestinationChanged(@NonNull NavController controller, @NonNull NavDestination destination, @Nullable Bundle arguments) {
        invalidateOptionsMenu();

        if (destination.getId() == R.id.navigation_profile) {
            if(isUserLoggedIn(this)) {

            } else {
                startActivity(new Intent(this, LoginActivity.class));
            }
        }
    }

    public static boolean isUserLoggedIn(Context context){
        SharedPreferences sharedPreferences = context.getSharedPreferences("auth", MODE_PRIVATE);
        return sharedPreferences.getString("token", null) != null;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        if (navController.getCurrentDestination().getId() == R.id.navigation_profile && isUserLoggedIn(this)) {
            MenuInflater inflater = getMenuInflater();
            inflater.inflate(R.menu.profile_menu, menu);
        }
        return true;
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        menu.clear();
        MenuInflater inflater = getMenuInflater();
        if(navController.getCurrentDestination().getId() == R.id.navigation_profile){
            if(isUserLoggedIn(this)) {
                inflater.inflate(R.menu.profile_menu, menu);
            }
        }
        return true;
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle item selection
        if(navController.getCurrentDestination().getId() == R.id.navigation_profile){
            switch (item.getItemId()) {
                case R.id.log_out:
                    SharedPreferences sharedPreferences = getSharedPreferences("auth", MODE_PRIVATE);
                    SharedPreferences.Editor editor = sharedPreferences.edit();
                    editor.remove("token");
                    editor.remove("user");
                    editor.apply();
                    Toast.makeText(this, "Logout", Toast.LENGTH_SHORT).show();
                    invalidateOptionsMenu();
                    return true;
            }
        }
        return super.onOptionsItemSelected(item);
    }
}
