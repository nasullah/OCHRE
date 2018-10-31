package ochre

class UnitType {

    static mapping = {
        unitTypeName type: "text"
    }
    static auditable = true
    static constraints = {
        unitTypeName()
    }

    String unitTypeName

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${unitTypeName}";
    }
}
