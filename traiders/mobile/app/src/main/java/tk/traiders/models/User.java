package tk.traiders.models;

import java.time.LocalDateTime;

public class User {

    private String url;
    private String username;
    private String first_name;
    private String last_name;
    private String email;
    private String date_joined;
    private boolean is_trader;
    private String iban;
    private String preferred_currency;

    public String getUrl() {
        return url;
    }

    public User setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getUsername() {
        return username;
    }

    public User setUsername(String username) {
        this.username = username;
        return this;
    }

    public String getFirst_name() {
        return first_name;
    }

    public User setFirst_name(String first_name) {
        this.first_name = first_name;
        return this;
    }

    public String getLast_name() {
        return last_name;
    }

    public User setLast_name(String last_name) {
        this.last_name = last_name;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public User setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getDate_joined() {
        return date_joined;
    }

    public User setDate_joined(String date_joined) {
        this.date_joined = date_joined;
        return this;
    }

    public boolean isIs_trader() {
        return is_trader;
    }

    public User setIs_trader(boolean is_trader) {
        this.is_trader = is_trader;
        return this;
    }

    public String getIban() {
        return iban;
    }

    public User setIban(String iban) {
        this.iban = iban;
        return this;
    }

    public String getPreferred_currency() {
        return preferred_currency;
    }

    public User setPreferred_currency(String preferred_currency) {
        this.preferred_currency = preferred_currency;
        return this;
    }

    @Override
    public String toString() {
        return "User{" +
                "url='" + url + '\'' +
                ", username='" + username + '\'' +
                ", first_name='" + first_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", email='" + email + '\'' +
                ", date_joined='" + date_joined + '\'' +
                ", is_trader=" + is_trader +
                ", iban='" + iban + '\'' +
                ", preferred_currency='" + preferred_currency + '\'' +
                '}';
    }
}
