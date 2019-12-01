package tk.traiders.models;

public class Comment {

    private String id;
    private String url;
    private String createdAt;
    private String content;
    private User author;
    private String articleOrEquipmentUrl;
    private boolean isLiked;
    private int numLlikes;

    public boolean isLiked() {
        return isLiked;
    }

    public void setLiked(boolean liked) {
        isLiked = liked;
    }

    public int getNumLlikes() {
        return numLlikes;
    }

    public void setNumLlikes(int numLlikes) {
        this.numLlikes = numLlikes;
    }

    public Comment(String id, String url, String createdAt, String content, User author, String articleOrEquipmentUrl, boolean isLiked, int numLlikes) {
        this.id = id;
        this.url = url;
        this.createdAt = createdAt;
        this.content = content;
        this.author = author;
        this.articleOrEquipmentUrl = articleOrEquipmentUrl;
        this.isLiked = isLiked;
        this.numLlikes = numLlikes;
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

    @Override
    public String toString() {
        return "Comment{" +
                "id='" + id + '\'' +
                ", url='" + url + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", content='" + content + '\'' +
                ", author=" + author +
                ", articleOrEquipmentUrl='" + articleOrEquipmentUrl + '\'' +
                ", isLiked=" + isLiked +
                ", numLlikes=" + numLlikes +
                '}';
    }
}
