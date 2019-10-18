package tk.traiders.ui.markets.adapters;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import tk.traiders.R;

public class CurrencyAdapter extends RecyclerView.Adapter<CurrencyAdapter.CurrencyViewHolder> {

    private List<String> symbols;

    public CurrencyAdapter(List<String> symbols) {
        this.symbols = symbols;
    }

    @NonNull
    @Override
    public CurrencyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new CurrencyViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.currency_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull CurrencyViewHolder holder, int position) {
        holder.textView_currencySymbol.setText(symbols.get(position));
    }

    @Override
    public int getItemCount() {
        return symbols.size();
    }


    public static class CurrencyViewHolder extends RecyclerView.ViewHolder {

        private TextView textView_currencySymbol;

        public CurrencyViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_currencySymbol = itemView.findViewById(R.id.textView_currencySymbol);
        }

    }

}
