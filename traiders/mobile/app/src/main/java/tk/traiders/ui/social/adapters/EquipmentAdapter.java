package tk.traiders.ui.social.adapters;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.widget.TooltipCompat;
import androidx.recyclerview.widget.RecyclerView;

import org.w3c.dom.Text;

import java.util.List;

import tk.traiders.R;
import tk.traiders.components.equipment.ViewEquipmentActivity;
import tk.traiders.models.Equipment;

public class EquipmentAdapter extends RecyclerView.Adapter<EquipmentAdapter.EquipmentViewHolder> {

    private Context context;
    private List<Equipment> equipmentList;

    public EquipmentAdapter(Context context, List<Equipment> equipmentList) {
        this.context = context;
        this.equipmentList = equipmentList;

    }

    @NonNull
    @Override
    public EquipmentViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new EquipmentViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.equipment_list_item, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull EquipmentViewHolder holder, int position) {

        Equipment equipment = equipmentList.get(position);

        holder.category.setText(equipment.getCategory());
        holder.name.setText(equipment.getName());
        holder.name.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, ViewEquipmentActivity.class);
                intent.putExtra("equipment", equipment);
                context.startActivity(intent);
            }
        });
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            holder.name.setTooltipText(equipment.getName());
        } else {
            TooltipCompat.setTooltipText(holder.name, equipment.getName());
        }
        holder.symbol.setText(equipment.getSymbol());


    }

    @Override
    public int getItemCount() {
        return equipmentList.size();
    }

    public static class EquipmentViewHolder extends RecyclerView.ViewHolder {

        TextView category;
        TextView name;
        TextView symbol;

        public EquipmentViewHolder(@NonNull View itemView) {
            super(itemView);
            category = itemView.findViewById(R.id.textView_equipmentCategory);
            name = itemView.findViewById(R.id.textView_equipmentName);
            symbol = itemView.findViewById(R.id.textView_equipmentSymbol);
        }
    }


}
