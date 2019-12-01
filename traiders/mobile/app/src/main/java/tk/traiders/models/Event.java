package tk.traiders.models;

public class Event {

    private boolean tracking;
    private String url;
    private String id;
    private String date;
    private String country;
    private String countryCode;
    private String calendarId;
    private String category;
    private String actual;
    private String previous;
    private String forecast;
    private String sourceURL;
    private int importance;
    private String event;

    public Event(boolean tracking, String url, String id, String date, String country, String countryCode, String calendarId, String category, String actual, String previous, String forecast, String sourceURL, int importance, String event) {
        this.tracking = tracking;
        this.url = url;
        this.id = id;
        this.date = date;
        this.country = country;
        this.countryCode = countryCode;
        this.calendarId = calendarId;
        this.category = category;
        this.actual = actual;
        this.previous = previous;
        this.forecast = forecast;
        this.sourceURL = sourceURL;
        this.importance = importance;
        this.event = event;
    }

    public boolean isTracking() {
        return tracking;
    }

    public Event setTracking(boolean tracking) {
        this.tracking = tracking;
        return this;
    }

    public String getUrl() {
        return url;
    }

    public Event setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getId() {
        return id;
    }

    public Event setId(String id) {
        this.id = id;
        return this;
    }

    public String getDate() {
        return date;
    }

    public Event setDate(String date) {
        this.date = date;
        return this;
    }

    public String getCountry() {
        return country;
    }

    public Event setCountry(String country) {
        this.country = country;
        return this;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public Event setCountryCode(String countryCode) {
        this.countryCode = countryCode;
        return this;
    }

    public String getCalendarId() {
        return calendarId;
    }

    public Event setCalendarId(String calendarId) {
        this.calendarId = calendarId;
        return this;
    }

    public String getCategory() {
        return category;
    }

    public Event setCategory(String category) {
        this.category = category;
        return this;
    }

    public String getActual() {
        return actual;
    }

    public Event setActual(String actual) {
        this.actual = actual;
        return this;
    }

    public String getPrevious() {
        return previous;
    }

    public Event setPrevious(String previous) {
        this.previous = previous;
        return this;
    }

    public String getForecast() {
        return forecast;
    }

    public Event setForecast(String forecast) {
        this.forecast = forecast;
        return this;
    }

    public String getSourceURL() {
        return sourceURL;
    }

    public Event setSourceURL(String sourceURL) {
        this.sourceURL = sourceURL;
        return this;
    }

    public int getImportance() {
        return importance;
    }

    public Event setImportance(int importance) {
        this.importance = importance;
        return this;
    }

    public String getEvent() {
        return event;
    }

    public Event setEvent(String event) {
        this.event = event;
        return this;
    }

    @Override
    public String toString() {
        return "Event{" +
                "tracking=" + tracking +
                ", url='" + url + '\'' +
                ", id='" + id + '\'' +
                ", date='" + date + '\'' +
                ", country='" + country + '\'' +
                ", countryCode='" + countryCode + '\'' +
                ", calendarId='" + calendarId + '\'' +
                ", category='" + category + '\'' +
                ", actual='" + actual + '\'' +
                ", previous='" + previous + '\'' +
                ", forecast='" + forecast + '\'' +
                ", sourceURL='" + sourceURL + '\'' +
                ", importance=" + importance +
                ", event='" + event + '\'' +
                '}';
    }
}
