package ochre

class EthicalApproval {

    static hasMany = [ethicalApprovalLetter:EthicalApprovalLetter]
    static auditable = true
    static constraints = {
        referenceNo()
        title()
        startDate()
        expiryDate(nullable: true)
        ethicalApprovalLetterPending(nullable: true)
        ethicalApprovalLetterComplete(nullable: true)
    }
    boolean ethicalApprovalLetterPending = Boolean.FALSE
    boolean ethicalApprovalLetterComplete = Boolean.FALSE
    String referenceNo
    String title
    Date startDate
    Date expiryDate

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${referenceNo}";
    }
}
