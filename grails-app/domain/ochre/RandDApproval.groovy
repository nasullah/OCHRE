package ochre

class RandDApproval {

    static auditable = true
    static constraints = {
        referenceNo()
        bodyName()
        otherInformation widget: 'textarea'
        letter()
    }

    String referenceNo
    String bodyName
    String otherInformation
    String letter

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${referenceNo}";
    }
}
