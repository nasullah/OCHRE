package ochre

class Sample {

    static mapping = {
        sampleType type: "text"
        sampleFor type: "text"
        slideThickness type: "text"
        stainedSpecify type: "text"
        specialRequirements type: "text"
    }
    static belongsTo = [applicationFrom:ApplicationForm]
    static auditable = true
    static constraints = {
        applicationFrom()
        sampleFor(nullable: true)
        timePoint(nullable: true)
        sampleType(nullable: true)
        slideNumber(nullable: true)
        slideThickness(nullable: true)
        slideType(nullable: true)
        stained(nullable: true)
        stainedSpecify(nullable: true)
        specialRequirements widget: 'textarea',nullable: true
    }

    String timePoint
    String sampleFor
    String sampleType
    String slideNumber
    String slideThickness
    String slideType
    String stained
    String stainedSpecify
    String specialRequirements

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${sampleType}";
    }
}
