package ochre

class RandDApprovalLetter {

    static mapping = {
        letter type: "text"
    }
    static belongsTo = [randDApproval:RandDApproval]
    static constraints = {
        randDApproval()
        letter()
    }
    String letter

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${letter}";
    }
}
