package ochre

class ApplicationForm {

    static mapping = {
        dataRequirementsOther type: "text"
        sponsorOrganisation type: "text"
        registrationOnPortfolioName type: "text"
        companyName type: "text"
        clinicalTrialForm type: "text"
        howMaterialUsed type: "text"
    }
    static hasMany = [samples:Sample]
    static auditable = true
    static constraints = {
        leadApplicant(nullable: true)
        contactPerson(nullable: true)
        sampleRequestContact(nullable: true)
        shippingDetailsSame(nullable: true)
        shippingDetails(nullable: true)
        researchFunder(nullable: true)
        companyName(nullable: true)
        contactPersonQuotationFunding(nullable: true)
        ethicalApproval(nullable: true)
        consentForUseInResearch(nullable: true)
        randDApproval(nullable: true)
        registrationOnPortfolio(nullable: true)
        registrationOnPortfolioName(nullable: true)
        sponsorOrganisation(nullable: true)
        mTAArranged widget: 'textarea', nullable: true
        mTAOrCTA(nullable: true)
        trial(nullable: true)
        howMaterialUsed widget: 'textarea', nullable: true
        dataRequirements widget: 'textarea', nullable: true
        dataRequirementsOther(nullable: true)
        clinicalTrialForm(nullable: true)
        applicationType(nullable: true)
        applicationOwner()
        terms(nullable: true)
    }

    Person leadApplicant
    Person contactPerson
    Person sampleRequestContact
    boolean shippingDetailsSame
    Person shippingDetails
    boolean stepOneComplete = Boolean.FALSE
    String researchFunder
    String companyName
    Person contactPersonQuotationFunding
    boolean stepTwoComplete = Boolean.FALSE
    EthicalApproval ethicalApproval
    ConsentForUseInResearch consentForUseInResearch
    RandDApproval randDApproval
    boolean stepThreeComplete = Boolean.FALSE
    Trial trial
    String registrationOnPortfolio
    String registrationOnPortfolioName
    String sponsorOrganisation
    String mTAArranged
    MTAOrCTA mTAOrCTA
    boolean stepFourComplete = Boolean.FALSE
    String howMaterialUsed
    String dataRequirements
    String dataRequirementsOther
    String clinicalTrialForm
    ApplicationType applicationType
    User applicationOwner
    boolean terms = Boolean.FALSE

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${leadApplicant}";
    }
}
