package ochre

class ResearchFunder {

    static auditable = true
    static constraints = {
        researchFunderName()
    }

    String researchFunderName

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${researchFunderName}";
    }
}
