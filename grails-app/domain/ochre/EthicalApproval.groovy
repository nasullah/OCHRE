package ochre

class EthicalApproval {

    static auditable = true
    static constraints = {
        referenceNo()
        title()
        startDate()
        expiryDate()
        letter()
    }

    String referenceNo
    String title
    Date startDate
    Date expiryDate
    String letter

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${referenceNo}";
    }
}
