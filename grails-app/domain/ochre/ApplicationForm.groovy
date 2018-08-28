package ochre

class ApplicationForm {

    static auditable = true
    static constraints = {
        leadApplicant()
        contactPerson()
        shippingDetails()
        researchFunder()
        contactPersonQuotationFunding()
        ethicalApproval()
        consentForUseInResearch()
        randDApproval()
        registrationOnPortfolioName()
        sponsorOrganisation()
        mTAArranged widget: 'textarea'
        trial()
        mTAOrCTA()
        sample()
        howMaterialUsed widget: 'textarea'
        dataRequirements widget: 'textarea'
        clinicalTrialForm(nullable: true)
    }

    Person leadApplicant
    Person contactPerson
    Person shippingDetails
    ResearchFunder researchFunder
    Person contactPersonQuotationFunding
    EthicalApproval ethicalApproval
    ConsentForUseInResearch consentForUseInResearch
    RandDApproval randDApproval
    Trial trial
    String registrationOnPortfolioName
    String sponsorOrganisation
    String mTAArranged
    String mTAOrCTA
    String timePoint
    Sample sample
    String howMaterialUsed
    String dataRequirements
    String clinicalTrialForm

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${leadApplicant}";
    }
}
