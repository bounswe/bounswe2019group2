package tk.traiders.models;

import java.util.List;

public class Portfolio {

    private String url;
    private int id;
    private String name;
    private User user;
    private String isFollowing;
    private List<PortfolioItem> portfolioItemList;

    public Portfolio() {
    }

    public String getUrl() {
        return url;
    }

    public Portfolio setUrl(String url) {
        this.url = url;
        return this;
    }

    public int getId() {
        return id;
    }

    public Portfolio setId(int id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Portfolio setName(String name) {
        this.name = name;
        return this;
    }

    public User getUser() {
        return user;
    }

    public Portfolio setUser(User user) {
        this.user = user;
        return this;
    }

    public String getIsFollowing() {
        return isFollowing;
    }

    public Portfolio setIsFollowing(String isFollowing) {
        this.isFollowing = isFollowing;
        return this;
    }

    public List<PortfolioItem> getPortfolioItemList() {
        return portfolioItemList;
    }

    public Portfolio setPortfolioItemList(List<PortfolioItem> portfolioItemList) {
        this.portfolioItemList = portfolioItemList;
        return this;
    }

    @Override
    public String toString() {
        return "Portfolio{" +
                "url='" + url + '\'' +
                ", id=" + id +
                ", name='" + name + '\'' +
                ", user=" + user +
                ", isFollowing='" + isFollowing + '\'' +
                ", portfolioItemList=" + portfolioItemList +
                '}';
    }
}
