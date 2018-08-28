package ochre

class Sample {

    static auditable = true
    static constraints = {
        sampleType()
        slideNumber(nullable: true)
        slideThickness(nullable: true)
        slideType(nullable: true)
        stained(nullable: true)
        specialRequirements widget: 'textarea',nullable: true
    }

    String sampleType
    Integer slideNumber
    String slideThickness
    String slideType
    String stained
    String specialRequirements

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${sampleType}";
    }
}
