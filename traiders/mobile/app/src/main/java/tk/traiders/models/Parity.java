package tk.traiders.models;

import java.io.Serializable;

public class Parity implements Serializable {

    private String url;
    private String id;
    private Equipment baseEquipment;
    private Equipment targetEquipment;
    private Double ratio;
    private Double open;
    private Double close;
    private Double high;
    private Double low;
    private String date;

    public Parity(String url, String id, Equipment baseEquipment, Equipment targetEquipment, Double ratio, Double open, Double close, Double high, Double low, String date) {
        this.url = url;
        this.id = id;
        this.baseEquipment = baseEquipment;
        this.targetEquipment = targetEquipment;
        this.ratio = ratio;
        this.open = open;
        this.close = close;
        this.high = high;
        this.low = low;
        this.date = date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Equipment getBaseEquipment() {
        return baseEquipment;
    }

    public void setBaseEquipment(Equipment baseEquipment) {
        this.baseEquipment = baseEquipment;
    }

    public Equipment getTargetEquipment() {
        return targetEquipment;
    }

    public void setTargetEquipment(Equipment targetEquipment) {
        this.targetEquipment = targetEquipment;
    }

    public Double getRatio() {
        return ratio;
    }

    public void setRatio(Double ratio) {
        this.ratio = ratio;
    }

    public Double getOpen() {
        return open;
    }

    public void setOpen(Double open) {
        this.open = open;
    }

    public Double getClose() {
        return close;
    }

    public void setClose(Double close) {
        this.close = close;
    }

    public Double getHigh() {
        return high;
    }

    public void setHigh(Double high) {
        this.high = high;
    }

    public Double getLow() {
        return low;
    }

    public void setLow(Double low) {
        this.low = low;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Parity{" +
                "url='" + url + '\'' +
                ", id='" + id + '\'' +
                ", baseEquipment=" + baseEquipment +
                ", targetEquipment=" + targetEquipment +
                ", ratio=" + ratio +
                ", open=" + open +
                ", close=" + close +
                ", high=" + high +
                ", low=" + low +
                ", date='" + date + '\'' +
                '}';
    }
}
