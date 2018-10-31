package ochre

class Unit {

    static mapping = {
        unitName type: "text"
        unitType type: "text"
    }
    static auditable = true
    static constraints = {
        unitType()
        unitName()
    }

    UnitType unitType
    String unitName

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${unitName}";
    }
}
