package tk.traiders.models;

public class Following {

    private String url;
    private String id;
    private String user_following;
    private String user_followed;
    private String status;

    public Following(String url, String id, String user_following, String user_followed, String status) {
        this.url = url;
        this.id = id;
        this.user_following = user_following;
        this.user_followed = user_followed;
        this.status = status;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUser_following() {
        return user_following;
    }

    public void setUser_following(String user_following) {
        this.user_following = user_following;
    }

    public String getUser_followed() {
        return user_followed;
    }

    public void setUser_followed(String user_followed) {
        this.user_followed = user_followed;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Following{" +
                "url='" + url + '\'' +
                ", id='" + id + '\'' +
                ", user_following='" + user_following + '\'' +
                ", user_followed='" + user_followed + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
