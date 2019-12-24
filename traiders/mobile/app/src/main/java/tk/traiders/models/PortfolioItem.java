package tk.traiders.models;

public class PortfolioItem {

    private String url;
    private String targetEquipment;
    private String baseEquipment;
    private String portfolio;
    private int id;

    public PortfolioItem() {
    }

    public String getUrl() {
        return url;
    }

    public PortfolioItem setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getTargetEquipment() {
        return targetEquipment;
    }

    public PortfolioItem setTargetEquipment(String targetEquipment) {
        this.targetEquipment = targetEquipment;
        return this;
    }

    public String getBaseEquipment() {
        return baseEquipment;
    }

    public PortfolioItem setBaseEquipment(String baseEquipment) {
        this.baseEquipment = baseEquipment;
        return this;
    }

    public String getPortfolio() {
        return portfolio;
    }

    public PortfolioItem setPortfolio(String portfolio) {
        this.portfolio = portfolio;
        return this;
    }

    public int getId() {
        return id;
    }

    public PortfolioItem setId(int id) {
        this.id = id;
        return this;
    }

    @Override
    public String toString() {
        return "PortfolioItem{" +
                "url='" + url + '\'' +
                ", targetEquipment='" + targetEquipment + '\'' +
                ", baseEquipment='" + baseEquipment + '\'' +
                ", portfolio='" + portfolio + '\'' +
                ", id=" + id +
                '}';
    }
}
