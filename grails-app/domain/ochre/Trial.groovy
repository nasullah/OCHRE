package ochre

class Trial {

    static mapping = {
        trialTitle type: "text"
        expectedDuration type: "text"
        recruitedNumber type: "text"
        laySummary type: "text"
        pathologistName type: "text"
    }
    static auditable = true
    static constraints = {
        trialTitle()
        expectedDuration()
        recruitedNumber(nullable: true)
        laySummary widget: 'textarea'
        nHSPathologist()
        pathologistName(nullable: true)
    }

    String trialTitle
    String expectedDuration
    String laySummary
    String nHSPathologist
    String pathologistName
    String recruitedNumber

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${trialTitle}";
    }
}
