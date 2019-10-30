package tk.traiders.models;

import java.io.Serializable;

public class User implements Serializable {

    private String url;
    private String username;
    private String firstName;
    private String lastName;
    private String email;
    private String dateJoined;
    private boolean trader;
    private String iban;
    private String city;
    private String country;
    private boolean profilePrivate;

    public User(String url, String username, String firstName, String lastName, String email, String dateJoined, boolean trader, String iban, String city, String country, boolean profilePrivate) {
        this.url = url;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dateJoined = dateJoined;
        this.trader = trader;
        this.iban = iban;
        this.city = city;
        this.country = country;
        this.profilePrivate = profilePrivate;
    }

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

    public String getFirstName() {
        return firstName;
    }

    public User setFirstName(String firstName) {
        this.firstName = firstName;
        return this;
    }

    public String getLastName() {
        return lastName;
    }

    public User setLastName(String lastName) {
        this.lastName = lastName;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public User setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getDateJoined() {
        return dateJoined;
    }

    public User setDateJoined(String dateJoined) {
        this.dateJoined = dateJoined;
        return this;
    }

    public boolean isTrader() {
        return trader;
    }

    public User setTrader(boolean trader) {
        this.trader = trader;
        return this;
    }

    public String getIban() {
        return iban;
    }

    public User setIban(String iban) {
        this.iban = iban;
        return this;
    }

    public String getCity() {
        return city;
    }

    public User setCity(String city) {
        this.city = city;
        return this;
    }

    public String getCountry() {
        return country;
    }

    public User setCountry(String country) {
        this.country = country;
        return this;
    }

    public boolean isProfilePrivate() {
        return profilePrivate;
    }

    public User setProfilePrivate(boolean profilePrivate) {
        this.profilePrivate = profilePrivate;
        return this;
    }

    @Override
    public String toString() {
        return "User{" +
                "url='" + url + '\'' +
                ", username='" + username + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", dateJoined=" + dateJoined +
                ", trader=" + trader +
                ", iban='" + iban + '\'' +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", profilePrivate=" + profilePrivate +
                '}';
    }
}
