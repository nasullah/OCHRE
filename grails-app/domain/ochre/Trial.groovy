package ochre

class Trial {

    static mapping = {
        trialTitle type: "text"
        recruitmentAgreedTarget type: "text"
        laySummary type: "text"
        pathologistName type: "text"
        sponsor type: "text"
        protocolSynopsis type: "text"
    }
    static auditable = true
    static constraints = {
        trialTitle()
        siteEndDate()
        recruitmentAgreedTarget(nullable: true)
        laySummary widget: 'textarea'
        nHSPathologist()
        pathologistName(nullable: true)
        sponsor()
        protocolSynopsis()
    }

    String trialTitle
    Date siteEndDate
    String laySummary
    String nHSPathologist
    String pathologistName
    String recruitmentAgreedTarget
    String sponsor
    String protocolSynopsis

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${trialTitle}";
    }
}
