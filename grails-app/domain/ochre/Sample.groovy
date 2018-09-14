package ochre

class Sample {

    static belongsTo = [applicationFrom:ApplicationForm]
    static auditable = true
    static constraints = {
        applicationFrom()
        sampleType(nullable: true)
        slideNumber(nullable: true)
        slideThickness(nullable: true)
        slideType(nullable: true)
        stained(nullable: true)
        stainedSpecify(nullable: true)
        specialRequirements widget: 'textarea',nullable: true
    }

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
