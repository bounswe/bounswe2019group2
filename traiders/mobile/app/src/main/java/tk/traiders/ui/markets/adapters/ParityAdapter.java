package tk.traiders.ui.markets.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import tk.traiders.R;
import tk.traiders.components.markets.ParityDetailsActivity;
import tk.traiders.models.Parity;

public class ParityAdapter extends RecyclerView.Adapter<ParityAdapter.CurrencyViewHolder> {

    private Context context;
    private List<Parity> parityList;

    public ParityAdapter(Context context, List<Parity> parityList) {
        this.context = context;
        this.parityList = parityList;
    }

    @NonNull
    @Override
    public CurrencyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new CurrencyViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.parity_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull CurrencyViewHolder holder, int position) {
        Parity parity = parityList.get(position);
        String text = "1 " + parity.getBaseEquipment().getSymbol() + " = " + parity.getRatio() + " " + parity.getTargetEquipment().getSymbol();
        holder.textView_paritySymbol.setText(text);
        holder.textView_paritySymbol.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                context.startActivity(new Intent(context, ParityDetailsActivity.class).putExtra("parity", parity));
            }
        });
    }

    @Override
    public int getItemCount() {
        return parityList.size();
    }


    public static class CurrencyViewHolder extends RecyclerView.ViewHolder {

        private TextView textView_paritySymbol;

        public CurrencyViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_paritySymbol = itemView.findViewById(R.id.textView_paritySymbol);
        }

    }

}
