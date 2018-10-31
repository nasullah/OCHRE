package ochre

class RandDApproval {

    static mapping = {
        referenceNo type: "text"
        bodyName type: "text"
        otherInformation type: "text"
    }
    static hasMany = [randDApprovalLetter:RandDApprovalLetter]
    static auditable = true
    static constraints = {
        referenceNo()
        bodyName()
        otherInformation widget: 'textarea'
        randDApprovalLetterPending (nullable: true)
        randDApprovalLetterComplete(nullable: true)
    }

    String referenceNo
    String bodyName
    String otherInformation
    boolean randDApprovalLetterPending = Boolean.FALSE
    boolean randDApprovalLetterComplete = Boolean.FALSE

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${referenceNo}";
    }
}
