package ochre

class ConsentForUseInResearchForms {

    static mapping = {
        form type: "text"
    }
    static belongsTo = [consentForUseInResearch:ConsentForUseInResearch]
    static constraints = {
        consentForUseInResearch()
        form()
    }
    String form
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${form}";
    }
}
