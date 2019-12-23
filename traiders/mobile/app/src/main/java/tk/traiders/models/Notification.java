package tk.traiders.models;

import java.io.Serializable;

public class Notification implements Serializable {

    private String url;
    private User user;
    private String message;
    private String referenceObject;
    private String referenceUrl;
    private boolean seen;
    private int id;

    public Notification(){};

    public String getUrl() {
        return url;
    }

    public Notification setUrl(String url) {
        this.url = url;
        return this;
    }

    public User getUser() {
        return user;
    }

    public Notification setUser(User user) {
        this.user = user;
        return this;
    }

    public String getMessage() {
        return message;
    }

    public Notification setMessage(String message) {
        this.message = message;
        return this;
    }

    public String getReferenceObject() {
        return referenceObject;
    }

    public Notification setReferenceObject(String referenceObject) {
        this.referenceObject = referenceObject;
        return this;
    }

    public String getReferenceUrl() {
        return referenceUrl;
    }

    public Notification setReferenceUrl(String referenceUrl) {
        this.referenceUrl = referenceUrl;
        return this;
    }

    public boolean isSeen() {
        return seen;
    }

    public Notification setSeen(boolean seen) {
        this.seen = seen;
        return this;
    }

    public int getId() {
        return id;
    }

    public Notification setId(int id) {
        this.id = id;
        return this;
    }

    @Override
    public String toString() {
        return "Notification{" +
                "url='" + url + '\'' +
                ", user=" + user +
                ", message='" + message + '\'' +
                ", referenceObject='" + referenceObject + '\'' +
                ", referenceUrl='" + referenceUrl + '\'' +
                ", seen=" + seen +
                ", id=" + id +
                '}';
    }
}
