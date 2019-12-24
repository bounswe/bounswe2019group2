package tk.traiders.models;

public class Asset {

    private String url;
    private int id;
    private User user;
    private String equipment;
    private double amount;
    private int onHoldForInvestment;

    public Asset() {
    }

    public String getUrl() {
        return url;
    }

    public Asset setUrl(String url) {
        this.url = url;
        return this;
    }

    public int getId() {
        return id;
    }

    public Asset setId(int id) {
        this.id = id;
        return this;
    }

    public User getUser() {
        return user;
    }

    public Asset setUser(User user) {
        this.user = user;
        return this;
    }

    public String getEquipment() {
        return equipment;
    }

    public Asset setEquipment(String equipment) {
        this.equipment = equipment;
        return this;
    }

    public double getAmount() {
        return amount;
    }

    public Asset setAmount(double amount) {
        this.amount = amount;
        return this;
    }

    public int getOnHoldForInvestment() {
        return onHoldForInvestment;
    }

    public Asset setOnHoldForInvestment(int onHoldForInvestment) {
        this.onHoldForInvestment = onHoldForInvestment;
        return this;
    }

    @Override
    public String toString() {
        return "Asset{" +
                "url='" + url + '\'' +
                ", id=" + id +
                ", user=" + user +
                ", equipment='" + equipment + '\'' +
                ", amount=" + amount +
                ", onHoldForInvestment=" + onHoldForInvestment +
                '}';
    }
}

