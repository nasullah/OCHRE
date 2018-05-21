package ochre

class Unit {

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
