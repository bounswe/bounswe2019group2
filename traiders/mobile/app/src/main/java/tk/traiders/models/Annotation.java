package tk.traiders.models;

public class Annotation {

    private String context;
    private String id;
    private String type;
    private String createdAt;
    private Body body;
    private Target target;
    private String creator;

    public Annotation(String context, String id, String type, String createdAt, Body body, Target target, String creator) {
        this.context = context;
        this.id = id;
        this.type = type;
        this.createdAt = createdAt;
        this.body = body;
        this.target = target;
        this.creator = creator;
    }

    public String getContext() {
        return context;
    }

    public Annotation setContext(String context) {
        this.context = context;
        return this;
    }

    public String getId() {
        return id;
    }

    public Annotation setId(String id) {
        this.id = id;
        return this;
    }

    public String getType() {
        return type;
    }

    public Annotation setType(String type) {
        this.type = type;
        return this;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public Annotation setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
        return this;
    }

    public Body getBody() {
        return body;
    }

    public Annotation setBody(Body body) {
        this.body = body;
        return this;
    }

    public Target getTarget() {
        return target;
    }

    public Annotation setTarget(Target target) {
        this.target = target;
        return this;
    }

    public String getCreator() {
        return creator;
    }

    public Annotation setCreator(String creator) {
        this.creator = creator;
        return this;
    }

    @Override
    public String toString() {
        return "Annotation{" +
                "context='" + context + '\'' +
                ", id='" + id + '\'' +
                ", type='" + type + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", body=" + body +
                ", target=" + target +
                ", creator='" + creator + '\'' +
                '}';
    }

    public static class Body {
        private String type;
        private String value;

        public Body(String type, String value) {
            this.type = type;
            this.value = value;
        }

        public String getType() {
            return type;
        }

        public Body setType(String type) {
            this.type = type;
            return this;
        }

        public String getValue() {
            return value;
        }

        public Body setValue(String value) {
            this.value = value;
            return this;
        }

        @Override
        public String toString() {
            return "Body{" +
                    "type='" + type + '\'' +
                    ", value='" + value + '\'' +
                    '}';
        }
    }

    public static class Target {
        private String source;
        private Selector selector;

        public Target(String source, Selector selector) {
            this.source = source;
            this.selector = selector;
        }

        public String getSource() {
            return source;
        }

        public Target setSource(String source) {
            this.source = source;
            return this;
        }

        public Selector getSelector() {
            return selector;
        }

        public Target setSelector(Selector selector) {
            this.selector = selector;
            return this;
        }

        @Override
        public String toString() {
            return "Target{" +
                    "source='" + source + '\'' +
                    ", selector=" + selector +
                    '}';
        }

        public static class Selector {
            private String type;
            private String value;

            public Selector(String type, String value) {
                this.type = type;
                this.value = value;
            }

            public String getType() {
                return type;
            }

            public Selector setType(String type) {
                this.type = type;
                return this;
            }

            public String getValue() {
                return value;
            }

            public Selector setValue(String value) {
                this.value = value;
                return this;
            }

            @Override
            public String toString() {
                return "Selector{" +
                        "type='" + type + '\'' +
                        ", value='" + value + '\'' +
                        '}';
            }
        }
    }
}
