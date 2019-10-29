package tk.traiders.models;

import java.io.Serializable;

public class Article implements Serializable {

    private String url;
    private String title;
    private String created_at;
    private String content;
    private String image;
    private String id;

    public Article(String url, String title, String created_at, String content, String image, String id) {
        this.url = url;
        this.title = title;
        this.created_at = created_at;
        this.content = content;
        this.image = image;
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public Article setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public Article setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getCreated_at() {
        return created_at;
    }

    public Article setCreated_at(String created_at) {
        this.created_at = created_at;
        return this;
    }

    public String getContent() {
        return content;
    }

    public Article setContent(String content) {
        this.content = content;
        return this;
    }

    public String getImage() {
        return image;
    }

    public Article setImage(String image) {
        this.image = image;
        return this;
    }

    public String getId() {
        return id;
    }

    public Article setId(String id) {
        this.id = id;
        return this;
    }
}
