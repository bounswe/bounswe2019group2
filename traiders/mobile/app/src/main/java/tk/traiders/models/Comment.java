package tk.traiders.models;

public class Comment {

    private String id;
    private String url;
    private String createdAt;
    private String content;
    private User author;
    private String articleOrEquipmentUrl;

    public Comment(String id, String url, String createdAt, String content, User author, String articleOrEquipmentUrl) {
        this.id = id;
        this.url = url;
        this.createdAt = createdAt;
        this.content = content;
        this.author = author;
        this.articleOrEquipmentUrl = articleOrEquipmentUrl;
    }

    public String getId() {
        return id;
    }

    public Comment setId(String id) {
        this.id = id;
        return this;
    }

    public String getUrl() {
        return url;
    }

    public Comment setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public Comment setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
        return this;
    }

    public String getContent() {
        return content;
    }

    public Comment setContent(String content) {
        this.content = content;
        return this;
    }

    public User getAuthor() {
        return author;
    }

    public Comment setAuthor(User author) {
        this.author = author;
        return this;
    }

    public String getArticleOrEquipmentUrl() {
        return articleOrEquipmentUrl;
    }

    public Comment setArticleOrEquipmentUrl(String articleOrEquipmentUrl) {
        this.articleOrEquipmentUrl = articleOrEquipmentUrl;
        return this;
    }
}
