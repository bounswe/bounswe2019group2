package tk.traiders.components.markets;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.github.mikephil.charting.charts.Chart;
import com.github.mikephil.charting.components.AxisBase;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.formatter.IAxisValueFormatter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tk.traiders.MainActivity;
import tk.traiders.R;
import tk.traiders.components.article.ViewArticleActivity;
import tk.traiders.marshallers.ParityMarshaller;
import tk.traiders.models.Parity;
import tk.traiders.utils.MarshallerUtils;

public class ParityDetailsActivity extends AppCompatActivity {

    private Parity parity;

    private TextView textView_baseSymbol;
    private TextView textView_ratio;
    private TextView textView_targetSymbol;
    private TextView textView_open;
    private TextView textView_high;
    private TextView textView_low;
    private TextView textView_close;
    private Chart chart;

    private Button button_hourly;
    private Button button_daily;
    private Button button_monthly;
    private Button button_yearly;

    private TextView textView_expectation;
    private ProgressBar seekBar_expectation;

    private Button button_goup;
    private Button button_godown;

    private RequestQueue requestQueue;
    private String BASE_URL = "https://api.traiders.tk/parity/";
    private String URL = BASE_URL;

    private List<Parity> parityList = new ArrayList<>();

    List<Entry> entries = new ArrayList<>();
    List<String> dates = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_parity);

        textView_baseSymbol = findViewById(R.id.textView_baseSymbol);
        textView_ratio = findViewById(R.id.textView_ratio);
        textView_targetSymbol = findViewById(R.id.textView_targetSymbol);
        textView_open = findViewById(R.id.textView_open);
        textView_high = findViewById(R.id.textView_high);
        textView_low = findViewById(R.id.textView_low);
        textView_close = findViewById(R.id.textView_close);
        chart = findViewById(R.id.chart);

        button_hourly = findViewById(R.id.button_hourly);
        button_daily = findViewById(R.id.button_daily);
        button_monthly = findViewById(R.id.button_monthly);
        button_yearly = findViewById(R.id.button_yearly);

        textView_expectation = findViewById(R.id.textView_expectation);
        seekBar_expectation = findViewById(R.id.seekBar_expectation);

        button_goup = findViewById(R.id.button_goup);
        button_godown = findViewById(R.id.button_godown);

        button_goup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                button_goup.setEnabled(false);
                button_godown.setEnabled(false);


                StringRequest postRequest = new StringRequest(Request.Method.POST, "https://api.traiders.tk/prediction/",
                        new Response.Listener<String>()
                        {
                            @Override
                            public void onResponse(String response) {
                                Toast.makeText(ParityDetailsActivity.this, "voted up", Toast.LENGTH_SHORT).show();
                            }
                        },
                        new Response.ErrorListener()
                        {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                // error
                                Toast.makeText(ParityDetailsActivity.this, "An error occured voting up!", Toast.LENGTH_SHORT).show();
                                error.printStackTrace();
                                button_goup.setEnabled(true);
                                button_godown.setEnabled(true);
                            }
                        }
                ) {

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String> headers = MainActivity.getAuthorizationHeader(ParityDetailsActivity.this);
                        return headers != null ? headers : super.getHeaders();
                    }

                    @Override
                    protected Map<String, String> getParams()
                    {
                        Map<String, String>  params = new HashMap<String, String>();

                        params.put("base_equipment", parity.getBaseEquipment().getSymbol());
                        params.put("target_equipment", parity.getTargetEquipment().getSymbol());
                        params.put("direction", "1");

                        return params;
                    }
                };

                requestQueue.add(postRequest);

            }
        });

        button_godown.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                button_godown.setEnabled(false);
                button_goup.setEnabled(false);

                StringRequest postRequest = new StringRequest(Request.Method.POST, "https://api.traiders.tk/prediction/",
                        new Response.Listener<String>()
                        {
                            @Override
                            public void onResponse(String response) {
                                Toast.makeText(ParityDetailsActivity.this, "voted up", Toast.LENGTH_SHORT).show();
                            }
                        },
                        new Response.ErrorListener()
                        {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                // error
                                Toast.makeText(ParityDetailsActivity.this, "An error occured voting up!", Toast.LENGTH_SHORT).show();
                                error.printStackTrace();
                                button_goup.setEnabled(true);
                                button_godown.setEnabled(true);
                            }
                        }
                ) {

                    @Override
                    public Map<String, String> getHeaders() throws AuthFailureError {
                        Map<String, String> headers = MainActivity.getAuthorizationHeader(ParityDetailsActivity.this);
                        return headers != null ? headers : super.getHeaders();
                    }

                    @Override
                    protected Map<String, String> getParams()
                    {
                        Map<String, String>  params = new HashMap<String, String>();

                        params.put("base_equipment", parity.getBaseEquipment().getSymbol());
                        params.put("target_equipment", parity.getTargetEquipment().getSymbol());
                        params.put("direction", "-1");

                        return params;
                    }
                };

                requestQueue.add(postRequest);

            }
        });

        textView_expectation.setText("Expectation: %--");
        seekBar_expectation.setProgress(0);

        button_hourly.setEnabled(false);

        button_hourly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                entries = new ArrayList<>();
                dates = new ArrayList<>();

                for(int i = 0; i < 15; i++) {
                    entries.add(new Entry(i, parityList.get(i).getClose().floatValue()));
                    dates.add(parityList.get(i).getDate());
                }

                fillChart();

            }
        });

        button_daily.setEnabled(false);

        button_daily.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                entries = new ArrayList<>();
                dates = new ArrayList<>();

                for(int i = 23; i < parityList.size() && i < 40; i++) {
                    entries.add(new Entry(i, parityList.get(i).getClose().floatValue()));
                    dates.add(parityList.get(i).getDate());
                }

                fillChart();
            }
        });

        button_monthly.setEnabled(false);


        button_monthly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                entries = new ArrayList<>();
                dates = new ArrayList<>();

                for(int i = 24; i < parityList.size() && i < 333; i+=30) {
                    entries.add(new Entry(i, parityList.get(i).getClose().floatValue()));
                    dates.add(parityList.get(i).getDate());
                }

                fillChart();

            }
        });

        button_yearly.setEnabled(false);


        button_yearly.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                entries = new ArrayList<>();
                dates = new ArrayList<>();

                for(int i = 24; i < parityList.size() && i < 4800; i+=360) {
                    entries.add(new Entry(i, parityList.get(i).getClose().floatValue()));
                    dates.add(parityList.get(i).getDate());
                }

                fillChart();

            }
        });

        requestQueue = Volley.newRequestQueue(this);

        Intent intent = getIntent();

        if(intent != null && intent.hasExtra("parity")) {
            parity = (Parity) intent.getSerializableExtra("parity");

            Uri.Builder builder = Uri.parse(BASE_URL).buildUpon();
            builder.appendQueryParameter("base_equipment", parity.getBaseEquipment().getSymbol());
            builder.appendQueryParameter("target_equipment", parity.getTargetEquipment().getSymbol());

            URL = builder.build().toString();

            fetchData();

            textView_baseSymbol.setText(parity.getBaseEquipment().getSymbol());
            textView_ratio.setText(parity.getRatio().toString());
            textView_targetSymbol.setText(parity.getTargetEquipment().getSymbol());
            textView_open.setText(parity.getOpen().toString());
            textView_high.setText(parity.getHigh().toString());
            textView_low.setText(parity.getLow().toString());
            textView_close.setText(parity.getClose().toString());

        }

        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setDisplayShowHomeEnabled(true);
        }

    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        if (item.getItemId() == android.R.id.home) {
            finish();
        }
        return super.onOptionsItemSelected(item);
    }


    private void fillChart(){

        chart.invalidate();

        String label = parity.getBaseEquipment().getSymbol() + "/" + parity.getTargetEquipment().getSymbol() + "Dataset";

        LineDataSet dataSet = new LineDataSet(entries, label);
        dataSet.setColor(ContextCompat.getColor(this, R.color.primaryColor));
        dataSet.setValueTextColor(ContextCompat.getColor(this, R.color.primaryDarkColor));

        chart.getDescription().setText("");

        //****
        // Controlling X axis
        XAxis xAxis = chart.getXAxis();
        // Set the xAxis position to bottom. Default is top
        xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
        //Customizing x axis value


        IAxisValueFormatter formatter = new IAxisValueFormatter() {
            @Override
            public String getFormattedValue(float value, AxisBase axis) {
                return dates.get((int) value);
            }

        };

        xAxis.setLabelRotationAngle(60);
        xAxis.setValueFormatter(formatter);
        xAxis.setGranularity(1f);
        LineData data = new LineData(dataSet);
        chart.setData(data);
        //refresh
        chart.invalidate();
    }

    protected void fetchData() {

        StringRequest getRequest = new StringRequest(Request.Method.GET, URL, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {

                String UTF8_response = MarshallerUtils.convertToUTF8(response);
                ParityDetailsActivity.this.parityList = ParityMarshaller.unmarshallList(UTF8_response);

                ParityDetailsActivity.this.entries = new ArrayList<>();
                ParityDetailsActivity.this.dates = new ArrayList<>();

                for(int i = 0; i < 15; i++) {
                    ParityDetailsActivity.this.entries.add(new Entry(i, parityList.get(i).getClose().floatValue()));
                    ParityDetailsActivity.this.dates.add(parityList.get(i).getDate());
                }

                fillChart();

            }

        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
            }
        });

        requestQueue.add(getRequest);
    }


}
