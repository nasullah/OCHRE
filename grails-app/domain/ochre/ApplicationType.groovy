package ochre

class ApplicationType {

    static mapping = {
        applicationTypeName type: "text"
    }
    static auditable = true
    static constraints = {
        applicationTypeName(nullable: true)
    }

    String applicationTypeName

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${applicationTypeName}";
    }
}
