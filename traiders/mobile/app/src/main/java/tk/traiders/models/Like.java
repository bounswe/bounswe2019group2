package tk.traiders.models;

import java.io.Serializable;

public class Like implements Serializable {

    private String url;
    private String user;
    private String article;

    public Like(String url, String user, String article) {
        this.url = url;
        this.user = user;
        this.article = article;
    }

    public String getUrl() {
        return url;
    }

    public Like setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getUser() {
        return user;
    }

    public Like setUser(String user) {
        this.user = user;
        return this;
    }

    public String getArticle() {
        return article;
    }

    public Like setArticle(String article) {
        this.article = article;
        return this;
    }

    @Override
    public String toString() {
        return "Like{" +
                "url='" + url + '\'' +
                ", user='" + user + '\'' +
                ", article='" + article + '\'' +
                '}';
    }
}
