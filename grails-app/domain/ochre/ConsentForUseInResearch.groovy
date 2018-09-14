package ochre

class ConsentForUseInResearch {

    static auditable = true
    static constraints = {
        form()
        formType()
    }

    String form
    String formType

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${formType}";
    }
}
