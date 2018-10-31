package ochre

class ConsentForUseInResearch {

    static hasMany = [consentForUseInResearchForms:ConsentForUseInResearchForms]
    static auditable = true
    static constraints = {
        consentForUseInResearchFormPending(nullable: true)
        consentForUseInResearchFormComplete(nullable: true)
    }

    boolean consentForUseInResearchFormPending = Boolean.FALSE
    boolean consentForUseInResearchFormComplete = Boolean.FALSE

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${consentForUseInResearchFormPending}";
    }
}
