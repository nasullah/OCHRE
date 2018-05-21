package ochre

class ApplicationForm {

    static auditable = true
    static constraints = {
        leadApplicant()
        contactPerson()
        shippingDetails()
        researchFunder()
        contactPersonQuotationFunding()
        ethicalApprovalReferenceNo()
        ethicalApprovalTitle()
        ethicalApprovalDate()
        ethicalApprovalExpiryDate()
        consentForUseOfData()
        randDApprovalBody()
        randDApprovalReferenceNo()
        randDApprovalOtherInformation widget: 'textarea'
        registrationOnPortfolioName()
        sponsorOrganisation()
        mTAArranged widget: 'textarea'
        researchProjectTitle()
        expectedDurationOfProject()
        projectDoneInAccreditedLab()
        projectLaySummary widget: 'textarea'
        projectAimsAndObjectives widget: 'textarea'
        projectNHSPathologist()
        sampleRequirements widget: 'textarea'
        detailsOfHistologyRequiredFromOCHRe widget: 'textarea'
        howMaterialUsed widget: 'textarea'
        dataRequirements widget: 'textarea'
    }

    Person leadApplicant
    Person contactPerson
    Person shippingDetails
    ResearchFunder researchFunder
    Person contactPersonQuotationFunding
    String ethicalApprovalReferenceNo
    String ethicalApprovalTitle
    Date ethicalApprovalDate
    Date ethicalApprovalExpiryDate
    String consentForUseOfData
    String randDApprovalBody
    String randDApprovalReferenceNo
    String randDApprovalOtherInformation
    String registrationOnPortfolioName
    String sponsorOrganisation
    String mTAArranged
    String researchProjectTitle
    String expectedDurationOfProject
    String projectDoneInAccreditedLab
    String projectLaySummary
    String projectAimsAndObjectives
    String projectNHSPathologist
    String sampleRequirements
    String detailsOfHistologyRequiredFromOCHRe
    String howMaterialUsed
    String dataRequirements

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${leadApplicant}";
    }
}
