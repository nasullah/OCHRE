package ochre

class Trial {

    static auditable = true
    static constraints = {
        trialTitle()
        expectedDuration()
        laySummary widget: 'textarea'
        nHSPathologist()
    }

    String trialTitle
    String expectedDuration
    String laySummary
    String nHSPathologist

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${trialTitle}";
    }
}
