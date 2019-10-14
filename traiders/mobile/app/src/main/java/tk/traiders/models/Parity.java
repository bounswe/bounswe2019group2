package tk.traiders.models;

import java.time.LocalDateTime;

public class Parity {

    private String url;
    private Equipment base_equipment;
    private Equipment target_equipment;
    private Double ratio;
    private LocalDateTime date;

    public Parity(String url, Equipment base_equipment, Equipment target_equipment, Double ratio, LocalDateTime date) {
        this.url = url;
        this.base_equipment = base_equipment;
        this.target_equipment = target_equipment;
        this.ratio = ratio;
        this.date = date;
    }

    public String getUrl() {
        return url;
    }

    public Equipment getBase_equipment() {
        return base_equipment;
    }

    public Equipment getTarget_equipment() {
        return target_equipment;
    }

    public Double getRatio() {
        return ratio;
    }

    public LocalDateTime getDate() {
        return date;
    }

    @Override
    public String toString() {
        return "Parity{" +
                "url='" + url + '\'' +
                ", base_equipment=" + base_equipment +
                ", target_equipment=" + target_equipment +
                ", ratio=" + ratio +
                ", date=" + date +
                '}';
    }
}
