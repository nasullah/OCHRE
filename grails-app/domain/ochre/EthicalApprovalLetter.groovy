package ochre

class EthicalApprovalLetter {

    static mapping = {
        letter type: "text"
    }
    static belongsTo = [ethicalApproval:EthicalApproval]
    static constraints = {
        ethicalApproval()
        letter()
    }
    String letter

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${letter}";
    }
}
