package tk.traiders;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
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

import java.util.HashMap;
import java.util.Map;

import tk.traiders.components.alarm.CreateAlarmFragment;
import tk.traiders.components.article.WriteArticleActivity;
import tk.traiders.components.event.EventFilterFragment;
import tk.traiders.components.investment.MakeInvestmentActivity;
import tk.traiders.components.portfolio.CreatePortfolioActivity;
import tk.traiders.components.portfolio.CreatePortfolioFragment;

public class MainActivity extends AppCompatActivity implements NavController.OnDestinationChangedListener {

    private BottomNavigationView bottomNavigationView;
    private NavController navController;
    private static Map<String, String> headers = new HashMap<>();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        bottomNavigationView = findViewById(R.id.nav_view);
        // Passing each menu ID as a set of Ids because each
        // menu should be considered as top level destinations.
        AppBarConfiguration appBarConfiguration = new AppBarConfiguration.Builder(R.id.navigation_search,
                R.id.navigation_markets, R.id.navigation_investments, R.id.navigation_social, R.id.navigation_profile)
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

    public static Map<String, String> getAuthorizationHeader(Context context){
        if(isUserLoggedIn(context)) {
            headers.put("Authorization", "Token " + MainActivity.getAuthorizationToken(context));
            return headers;
        }
        return null;
    }

    public static String getAuthorizationToken(Context context){
        SharedPreferences sharedPreferences = context.getSharedPreferences("auth", MODE_PRIVATE);
        return sharedPreferences.getString("token", null);
    }

    public static boolean isUserLoggedIn(Context context){
        return getAuthorizationToken(context) != null;
    }

    public static String getUserURL(Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("auth", MODE_PRIVATE);
        return sharedPreferences.getString("user", null);
    }

    public static String getUserID(Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("auth", MODE_PRIVATE);
        return sharedPreferences.getString("id", null);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle item selection
        switch (item.getItemId()) {
            case R.id.log_out:
                SharedPreferences sharedPreferences = getSharedPreferences("auth", MODE_PRIVATE);
                SharedPreferences.Editor editor = sharedPreferences.edit();
                editor.remove("token");
                editor.remove("user");
                editor.apply();
                Toast.makeText(this, "Logged out", Toast.LENGTH_SHORT).show();
                invalidateOptionsMenu();
                startActivity(new Intent(this, LoginActivity.class));
                return true;
            case R.id.log_in:
                startActivity(new Intent(this, LoginActivity.class));
                return true;
            case R.id.write_article:
                if (isUserLoggedIn(this)) {
                    startActivity(new Intent(this, WriteArticleActivity.class));
                } else {
                    Toast.makeText(this, "log in to continue", Toast.LENGTH_SHORT).show();
                    startActivity(new Intent(this, LoginActivity.class));
                }
                return true;
            case R.id.filter_events:
                new EventFilterFragment().show(getSupportFragmentManager(), "EventFilterFragment");
                return true;
            case R.id.make_new_investment:
                if (isUserLoggedIn(this)) {
                    startActivity(new Intent(this, MakeInvestmentActivity.class));
                } else {
                    Toast.makeText(this, "log in to continue", Toast.LENGTH_SHORT).show();
                    startActivity(new Intent(this, LoginActivity.class));
                }
                return true;
            case R.id.add_new_portfolio:
                if (isUserLoggedIn(this)) {
                    new CreatePortfolioFragment().show(getSupportFragmentManager(), "CreatePortfolioFragment");
                } else {
                    Toast.makeText(this, "log in to continue", Toast.LENGTH_SHORT).show();
                    startActivity(new Intent(this, LoginActivity.class));
                }
                return true;
            case R.id.set_new_alarm:
                if (isUserLoggedIn(this)) {
                    new CreateAlarmFragment().show(getSupportFragmentManager(), "CreateAlarmFragment");
                } else {
                    Toast.makeText(this, "log in to continue", Toast.LENGTH_SHORT).show();
                    startActivity(new Intent(this, LoginActivity.class));
                }
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

}
