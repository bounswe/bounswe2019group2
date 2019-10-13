package tk.traiders.models;

public class Token {

    private String key;
    private String user_id;

    public Token(String key, String user_id) {
        this.key = key;
        this.user_id = user_id;
    }

    public String getKey() {
        return key;
    }

    public Token setKey(String key) {
        this.key = key;
        return this;
    }

    public String getUser_id() {
        return user_id;
    }

    public Token setUser_id(String user_id) {
        this.user_id = user_id;
        return this;
    }

    @Override
    public String toString() {
        return "Token{" +
                "key='" + key + '\'' +
                ", user_id='" + user_id + '\'' +
                '}';
    }

}
