package tk.traiders.models;

public class Equipment {

    private String url;
    private String name;
    private String category;
    private String symbol;

    public Equipment(String url, String name, String category, String symbol) {
        this.url = url;
        this.name = name;
        this.category = category;
        this.symbol = symbol;
    }

    public String getUrl() {
        return url;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public String getSymbol() {
        return symbol;
    }

    @Override
    public String toString() {
        return "Equipment{" +
                "url='" + url + '\'' +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", symbol='" + symbol + '\'' +
                '}';
    }
}
