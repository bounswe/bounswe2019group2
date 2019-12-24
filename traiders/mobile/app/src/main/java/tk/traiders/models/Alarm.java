package tk.traiders.models;

public class Alarm {

    private User user;
    private String targetSymbol;
    private String baseSymbol;
    private double ratio;
    private boolean increasing;

    public Alarm(){}

    public User getUser() {
        return user;
    }

    public Alarm setUser(User user) {
        this.user = user;
        return this;
    }

    public String getTargetSymbol() {
        return targetSymbol;
    }

    public Alarm setTargetSymbol(String targetSymbol) {
        this.targetSymbol = targetSymbol;
        return this;
    }

    public String getBaseSymbol() {
        return baseSymbol;
    }

    public Alarm setBaseSymbol(String baseSymbol) {
        this.baseSymbol = baseSymbol;
        return this;
    }

    public double getRatio() {
        return ratio;
    }

    public Alarm setRatio(double ratio) {
        this.ratio = ratio;
        return this;
    }

    public boolean isIncreasing() {
        return increasing;
    }

    public Alarm setIncreasing(boolean increasing) {
        this.increasing = increasing;
        return this;
    }

    @Override
    public String toString() {
        return "Alarm{" +
                "user=" + user +
                ", targetSymbol='" + targetSymbol + '\'' +
                ", baseSymbol='" + baseSymbol + '\'' +
                ", ratio=" + ratio +
                ", increasing=" + increasing +
                '}';
    }
}
