package ochre

class RandDApproval {

    static mapping = {
        organisation type: "text"
        pid type: "text"
        otherInformation type: "text"
    }
    static auditable = true
    static constraints = {
        pid()
        organisation()
        otherInformation widget: 'textarea'
    }

    String pid
    String organisation
    String otherInformation

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${pid}";
    }
}
