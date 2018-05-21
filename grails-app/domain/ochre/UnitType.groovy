package ochre

class UnitType {

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
