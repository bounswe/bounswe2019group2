package tk.traiders.models;

public class Equipment {

    private String url;
    private String id;
    private String name;
    private String category;
    private String symbol;

    public Equipment(String url, String id, String name, String category, String symbol) {
        this.url = url;
        this.id = id;
        this.name = name;
        this.category = category;
        this.symbol = symbol;
    }

    public String getUrl() {
        return url;
    }

    public Equipment setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getId() {
        return id;
    }

    public Equipment setId(String id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Equipment setName(String name) {
        this.name = name;
        return this;
    }

    public String getCategory() {
        return category;
    }

    public Equipment setCategory(String category) {
        this.category = category;
        return this;
    }

    public String getSymbol() {
        return symbol;
    }

    public Equipment setSymbol(String symbol) {
        this.symbol = symbol;
        return this;
    }

    @Override
    public String toString() {
        return "Equipment{" +
                "url='" + url + '\'' +
                ", id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", symbol='" + symbol + '\'' +
                '}';
    }
}
