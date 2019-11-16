package tk.traiders.ui.markets.adapters;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import tk.traiders.R;

public class StockAdapter extends RecyclerView.Adapter<StockAdapter.StockViewHolder> {

    private List<String> symbols;

    public StockAdapter(List<String> symbols) {
        this.symbols = symbols;
    }

    @NonNull
    @Override
    public StockViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new StockViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.stock_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull StockViewHolder holder, int position) {
        holder.textView_stockSymbol.setText(symbols.get(position));
    }

    @Override
    public int getItemCount() {
        return symbols.size();
    }


    public static class StockViewHolder extends RecyclerView.ViewHolder {

        private TextView textView_stockSymbol;

        public StockViewHolder(@NonNull View itemView) {
            super(itemView);
            textView_stockSymbol = itemView.findViewById(R.id.textView_stockSymbol);
        }

    }

}
