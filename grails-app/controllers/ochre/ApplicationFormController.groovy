package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])

@Transactional(readOnly = true)
class ApplicationFormController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ApplicationForm.list(params), model:[applicationFormCount: ApplicationForm.count()]
    }

    def show(ApplicationForm applicationForm) {
        respond applicationForm
    }

    def create() {
        def applicationFormId = params.long('applicationFormId')
        def applicationForm = ApplicationForm.findById(applicationFormId)
        render(view : 'create', model:[applicationForm:applicationForm])
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def registration(){

    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    @Transactional
    def saveRegistration(){
        def emailAddress = params.emailAddress
        def password = params.password
        def repeatPassword = params.repeatPassword
        def matchPassword = false
        if(password == repeatPassword){
            matchPassword = true
        }
        if(!User.findByUsername(emailAddress) && matchPassword){
            def user = new User(username: emailAddress, enabled: true, password: password).save(failOnError: true)
            UserRole.create user, Role.findByAuthority('ROLE_USER')
            flash.message = "Registration is complete"
            redirect(uri:'/')
        }else if(User.findByUsername(emailAddress)){
            redirect(action: 'registration')
            flash.message = "An account with the email address already exists"
        }else if(!matchPassword){
            redirect(action: 'registration')
            flash.message = "Please enter matching password"
        }
    }

    def yourExistingApplications(){
        def applicationList = ApplicationForm.list()
        [applicationList:applicationList.sort{-it.id}]
    }

    def completeApplication(){
        def applicationFormId = params.long('applicationFormId')
        def applicationForm = ApplicationForm.findById(applicationFormId)
        def fragment = 'step-'
        if(applicationForm.stepFourComplete){
            fragment = 'step-5'
        }else if(applicationForm.stepThreeComplete){
            fragment = 'step-4'
        }else if(applicationForm.stepTwoComplete){
            fragment = 'step-3'
        }else if(applicationForm.stepOneComplete){
            fragment = 'step-2'
        }
        redirect(action: "create", fragment:fragment, params:[applicationFormId: applicationForm.id])
    }

    def applicationStatus(){
        def applicationFormId = params.long('applicationFormId')
        def applicationForm = ApplicationForm.findById(applicationFormId)
        def applicationType = applicationForm?.applicationType?.applicationTypeName
        def status = 0
        if(applicationType == 'Drafted'){
            status = 1
        }else if(applicationType == 'Submitted'){
            status = 2
        }else if(applicationType == 'Meeting'){
            status = 3
        }else if(applicationType == 'Approved'){
            status = 4
        }
        [status:status, applicationFormId:applicationFormId]
    }

    def applicationList(){
        def applicationType = params.applicationType
        def filteredApplicationList = ApplicationForm.findAllByApplicationType(ApplicationType.findByApplicationTypeName(applicationType))
        [filteredApplicationList:filteredApplicationList, applicationType:applicationType]
    }

    @Transactional
    def saveForm() {
        def applicationFormId = params.long('applicationFormId')
        def applicationForm = ApplicationForm.findById(applicationFormId)
        def stepNumber = params.long('stepNumber')
        def fragment = null
        if (stepNumber){
            fragment = 'step-' + (stepNumber + 1)
        }
        if (stepNumber == 1){
            if(applicationForm?.stepOneComplete){

                applicationForm?.leadApplicant?.jobTitle = params.leadApplicant.jobTitle
                applicationForm?.leadApplicant?.familyName = params.leadApplicant.familyName
                applicationForm?.leadApplicant?.firstName = params.leadApplicant.firstName
                applicationForm?.leadApplicant?.workAddress = params.leadApplicant.workAddress
                applicationForm?.leadApplicant?.telephoneNumber = params.leadApplicant.telephoneNumber
                applicationForm?.leadApplicant?.emailAddress = params.leadApplicant.emailAddress

                applicationForm?.contactPerson?.jobTitle = params.contactPerson.jobTitle
                applicationForm?.contactPerson?.familyName = params.contactPerson.familyName
                applicationForm?.contactPerson?.firstName = params.contactPerson.firstName
                applicationForm?.contactPerson?.workAddress = params.contactPerson.workAddress
                applicationForm?.contactPerson?.telephoneNumber = params.contactPerson.telephoneNumber
                applicationForm?.contactPerson?.emailAddress = params.contactPerson.emailAddress

                applicationForm?.sampleRequestContact?.jobTitle = params.sampleRequestContact.jobTitle
                applicationForm?.sampleRequestContact?.familyName = params.sampleRequestContact.familyName
                applicationForm?.sampleRequestContact?.firstName = params.sampleRequestContact.firstName
                applicationForm?.sampleRequestContact?.workAddress = params.sampleRequestContact.workAddress
                applicationForm?.sampleRequestContact?.telephoneNumber = params.sampleRequestContact.telephoneNumber
                applicationForm?.sampleRequestContact?.emailAddress = params.sampleRequestContact.emailAddress

                if(params.shippingDetailsSame == 'yes'){
                    applicationForm?.shippingDetails?.jobTitle = params.contactPerson.jobTitle
                    applicationForm?.shippingDetails?.familyName = params.contactPerson.familyName
                    applicationForm?.shippingDetails?.firstName = params.contactPerson.firstName
                    applicationForm?.shippingDetails?.workAddress = params.contactPerson.workAddress
                    applicationForm?.shippingDetails?.telephoneNumber = params.contactPerson.telephoneNumber
                    applicationForm?.shippingDetails?.emailAddress = params.contactPerson.emailAddress
                }else {
                    applicationForm?.shippingDetails?.jobTitle = params.shippingDetails.jobTitle
                    applicationForm?.shippingDetails?.familyName = params.shippingDetails.familyName
                    applicationForm?.shippingDetails?.firstName = params.shippingDetails.firstName
                    applicationForm?.shippingDetails?.workAddress = params.shippingDetails.workAddress
                    applicationForm?.shippingDetails?.telephoneNumber = params.shippingDetails.telephoneNumber
                    applicationForm?.shippingDetails?.emailAddress = params.shippingDetails.emailAddress
                }

                applicationForm.save failOnError: true

            } else {
                applicationForm = new ApplicationForm()

                def leadApplicant = new Person()
                def contactPerson = new Person()
                def shippingDetails = new Person()
                def sampleRequestContact = new Person()

                leadApplicant?.jobTitle = params.leadApplicant.jobTitle
                leadApplicant?.familyName = params.leadApplicant.familyName
                leadApplicant?.firstName = params.leadApplicant.firstName
                leadApplicant?.workAddress = params.leadApplicant.workAddress
                leadApplicant?.telephoneNumber = params.leadApplicant.telephoneNumber
                leadApplicant?.emailAddress = params.leadApplicant.emailAddress

                contactPerson?.jobTitle = params.contactPerson.jobTitle
                contactPerson?.familyName = params.contactPerson.familyName
                contactPerson?.firstName = params.contactPerson.firstName
                contactPerson?.workAddress = params.contactPerson.workAddress
                contactPerson?.telephoneNumber = params.contactPerson.telephoneNumber
                contactPerson?.emailAddress = params.contactPerson.emailAddress

                sampleRequestContact?.jobTitle = params.sampleRequestContact.jobTitle
                sampleRequestContact?.familyName = params.sampleRequestContact.familyName
                sampleRequestContact?.firstName = params.sampleRequestContact.firstName
                sampleRequestContact?.workAddress = params.sampleRequestContact.workAddress
                sampleRequestContact?.telephoneNumber = params.sampleRequestContact.telephoneNumber
                sampleRequestContact?.emailAddress = params.sampleRequestContact.emailAddress

                if(params.shippingDetailsSame == 'yes'){
                    shippingDetails?.jobTitle = params.contactPerson.jobTitle
                    shippingDetails?.familyName = params.contactPerson.familyName
                    shippingDetails?.firstName = params.contactPerson.firstName
                    shippingDetails?.workAddress = params.contactPerson.workAddress
                    shippingDetails?.telephoneNumber = params.contactPerson.telephoneNumber
                    shippingDetails?.emailAddress = params.contactPerson.emailAddress
                }else {
                    shippingDetails?.jobTitle = params.shippingDetails.jobTitle
                    shippingDetails?.familyName = params.shippingDetails.familyName
                    shippingDetails?.firstName = params.shippingDetails.firstName
                    shippingDetails?.workAddress = params.shippingDetails.workAddress
                    shippingDetails?.telephoneNumber = params.shippingDetails.telephoneNumber
                    shippingDetails?.emailAddress = params.shippingDetails.emailAddress
                }

                leadApplicant.save()
                contactPerson.save()
                sampleRequestContact.save()
                shippingDetails.save()

                applicationForm?.leadApplicant = leadApplicant
                applicationForm?.contactPerson = contactPerson
                applicationForm?.sampleRequestContact = sampleRequestContact
                applicationForm?.shippingDetails = shippingDetails
                applicationForm?.stepOneComplete = true
                applicationForm?.applicationType = ApplicationType.findByApplicationTypeName('Drafted')
                applicationForm.save failOnError: true
            }
            redirect(action: "create", fragment:fragment, params:[applicationFormId: applicationForm.id])
        }else if (stepNumber == 2){
            if(applicationForm.stepTwoComplete){
                applicationForm?.researchFunder = params.researchFunder
                applicationForm?.companyName = params.companyName
                applicationForm?.contactPersonQuotationFunding?.jobTitle = params.contactPersonQuotationFunding.jobTitle
                applicationForm?.contactPersonQuotationFunding?.familyName = params.contactPersonQuotationFunding.familyName
                applicationForm?.contactPersonQuotationFunding?.firstName = params.contactPersonQuotationFunding.firstName
                applicationForm?.contactPersonQuotationFunding?.workAddress = params.contactPersonQuotationFunding.workAddress
                applicationForm?.contactPersonQuotationFunding?.telephoneNumber = params.contactPersonQuotationFunding.telephoneNumber
                applicationForm?.contactPersonQuotationFunding?.emailAddress = params.contactPersonQuotationFunding.emailAddress
                applicationForm.save failOnError: true
            }else {
                applicationForm.researchFunder = params.researchFunder
                applicationForm.companyName = params.companyName
                def contactPersonQuotationFunding = new Person()
                contactPersonQuotationFunding?.jobTitle = params.contactPersonQuotationFunding.jobTitle
                contactPersonQuotationFunding?.familyName = params.contactPersonQuotationFunding.familyName
                contactPersonQuotationFunding?.firstName = params.contactPersonQuotationFunding.firstName
                contactPersonQuotationFunding?.workAddress = params.contactPersonQuotationFunding.workAddress
                contactPersonQuotationFunding?.telephoneNumber = params.contactPersonQuotationFunding.telephoneNumber
                contactPersonQuotationFunding?.emailAddress = params.contactPersonQuotationFunding.emailAddress
                contactPersonQuotationFunding.save()
                applicationForm?.contactPersonQuotationFunding = contactPersonQuotationFunding
                applicationForm?.stepTwoComplete = true
                applicationForm.save failOnError: true
            }
            redirect(action: "create", fragment:fragment, params:[applicationFormId: applicationForm.id])
        }else if(stepNumber == 3){
            if(applicationForm.stepThreeComplete){
                applicationForm?.ethicalApproval?.referenceNo = params.ethicalApproval.referenceNo
                applicationForm?.ethicalApproval?.title = params.ethicalApproval.title
                applicationForm?.ethicalApproval?.startDate = Date.parse("yyyy-MM-dd", params.ethicalApproval.startDate)
                applicationForm?.ethicalApproval?.expiryDate = Date.parse("yyyy-MM-dd", params.ethicalApproval.expiryDate)
                applicationForm?.consentForUseInResearch?.formType = params.consentForUseInResearch.formType
                applicationForm?.randDApproval?.bodyName = params.randDApproval.bodyName
                applicationForm?.randDApproval?.referenceNo = params.randDApproval.referenceNo
                applicationForm?.randDApproval?.otherInformation = params.randDApproval.otherInformation
                applicationForm?.registrationOnPortfolioName = params.registrationOnPortfolioName
                applicationForm?.sponsorOrganisation = params.sponsorOrganisation
                applicationForm?.mTAArranged = params.mTAArranged
                applicationForm.save failOnError: true
            }else {
                def ethicalApproval = new EthicalApproval()
                def consentForUseInResearch = new ConsentForUseInResearch()
                def randDApproval = new RandDApproval()

                def ethicalApprovalLetter = request.getFile('ethicalApprovalLetter')
                if (ethicalApprovalLetter?.originalFilename){
                    if (ethicalApprovalLetter?.empty) {
                        return
                    }
                    ethicalApproval.letter = grailsApplication.config.uploadFolder + 'Ethical_Approval_Letter_' + applicationForm.id + '_' +
                            ethicalApprovalLetter.originalFilename
                    def destinationFile = new File(ethicalApproval.letter)
                    try {
                        ethicalApprovalLetter.transferTo(destinationFile)
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }

                def consentForUseInResearchForm = request.getFile('consentForUseInResearchForm')
                if (consentForUseInResearchForm?.originalFilename){
                    if (consentForUseInResearchForm?.empty) {
                        return
                    }
                    consentForUseInResearch.form = grailsApplication.config.uploadFolder + 'Consent_For_Use_In_Research' + applicationForm.id + '_' +
                            consentForUseInResearchForm.originalFilename
                    def destinationFile = new File(consentForUseInResearch.form)
                    try {
                        consentForUseInResearchForm.transferTo(destinationFile)
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }

                def randDApprovalLetter = request.getFile('randDApprovalLetter')
                if (randDApprovalLetter?.originalFilename){
                    if (randDApprovalLetter?.empty) {
                        return
                    }
                    randDApproval.letter = grailsApplication.config.uploadFolder + 'RandD_Approval_Letter' + applicationForm.id + '_' +
                            randDApprovalLetter.originalFilename
                    def destinationFile = new File(randDApproval.letter)
                    try {
                        randDApprovalLetter.transferTo(destinationFile)
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }

                def mTAOrCTA = request.getFile('mTAOrCTA')
                if (mTAOrCTA?.originalFilename){
                    if (mTAOrCTA?.empty) {
                        return
                    }
                    applicationForm?.mTAOrCTA = grailsApplication.config.uploadFolder + 'MTA_Or_CTA_Copy' + applicationForm.id + '_' +
                            mTAOrCTA.originalFilename
                    def destinationFile = new File(applicationForm.mTAOrCTA)
                    try {
                        mTAOrCTA.transferTo(destinationFile)
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }

                ethicalApproval?.referenceNo = params.ethicalApproval.referenceNo
                ethicalApproval?.title = params.ethicalApproval.title
                ethicalApproval?.startDate = Date.parse("yyyy-MM-dd", params.ethicalApproval.startDate)
                ethicalApproval?.expiryDate = Date.parse("yyyy-MM-dd", params.ethicalApproval.expiryDate)
                consentForUseInResearch?.formType = params.consentForUseInResearch.formType
                randDApproval?.bodyName = params.randDApproval.bodyName
                randDApproval?.referenceNo = params.randDApproval.referenceNo
                randDApproval?.otherInformation = params.randDApproval.otherInformation
                applicationForm?.registrationOnPortfolioName = params.registrationOnPortfolioName
                applicationForm?.sponsorOrganisation = params.sponsorOrganisation
                applicationForm?.mTAArranged = params.mTAArranged
                ethicalApproval.save()
                consentForUseInResearch.save()
                randDApproval.save()
                applicationForm?.ethicalApproval = ethicalApproval
                applicationForm?.consentForUseInResearch = consentForUseInResearch
                applicationForm?.randDApproval = randDApproval
                applicationForm?.stepThreeComplete = true
                applicationForm.save failOnError: true
            }
            redirect(action: "create", fragment:fragment, params:[applicationFormId: applicationForm.id])
        }else if (stepNumber == 4){
            if(applicationForm.stepFourComplete){
                applicationForm?.trial?.trialTitle = params.trial.trialTitle
                applicationForm?.trial?.expectedDuration = params.trial.expectedDuration
                applicationForm?.trial?.laySummary = params.trial.laySummary
                applicationForm?.trial?.nHSPathologist = params.trial.nHSPathologist
                applicationForm.save failOnError: true
            }else {
                def trial = new Trial()
                trial?.trialTitle = params.trial.trialTitle
                trial?.expectedDuration = params.trial.expectedDuration
                trial?.laySummary = params.trial.laySummary
                trial?.nHSPathologist = params.trial.nHSPathologist
                applicationForm.trial = trial
                applicationForm?.stepFourComplete = true
                applicationForm.save failOnError: true
            }
            redirect(action: "create", fragment:fragment, params:[applicationFormId: applicationForm.id])
        }else if (stepNumber == 5){

            applicationForm.timePoint = params.timePoint
            applicationForm.dataRequirements = params.dataRequirements
            applicationForm.dataRequirementsOther = params.dataRequirementsOther
            applicationForm.howMaterialUsed = params.howMaterialUsed

            def clinicalTrialForm = request.getFile('clinicalTrialForm')
            if (clinicalTrialForm?.originalFilename){
                if (clinicalTrialForm?.empty) {
                    return
                }
                applicationForm?.clinicalTrialForm = grailsApplication.config.uploadFolder + 'Clinical_Trial_Form' + applicationForm.id + '_' +
                        clinicalTrialForm.originalFilename
                def destinationFile = new File(applicationForm.clinicalTrialForm)
                try {
                    clinicalTrialForm.transferTo(destinationFile)
                }
                catch (Exception ex) {
                    log.error(ex)
                }
            }

            def sample1 = new Sample()
            sample1?.sampleType = params.sample.sampleType1
            sample1?.slideNumber = params.sample.slideNumber1
            sample1?.slideThickness = params.sample.slideThickness1
            sample1?.slideType = params.sample.slideType1
            sample1?.stained = params.sample.stained1
            sample1?.stainedSpecify = params.sample.stainedSpecify1
            sample1?.specialRequirements = params.sample.specialRequirements1
            applicationForm.addToSamples(sample1).save failOnError: true

            if(params.sample.sampleType2){
                def sample2 = new Sample()
                sample2?.sampleType = params.sample.sampleType2
                sample2?.slideNumber = params.sample.slideNumber2
                sample2?.slideThickness = params.sample.slideThickness2
                sample2?.slideType = params.sample.slideType2
                sample2?.stained = params.sample.stained2
                sample2?.stainedSpecify = params.sample.stainedSpecify2
                sample2?.specialRequirements = params.sample.specialRequirements2
                applicationForm.addToSamples(sample2).save failOnError: true
            }
            applicationForm?.applicationType = ApplicationType.findByApplicationTypeName('Submitted')
            redirect(action: "applicationStatus", params:[applicationFormId: applicationForm.id])
        }
    }

    @Transactional
    def save(ApplicationForm applicationForm) {
        if (applicationForm == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (applicationForm.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond applicationForm.errors, view:'create'
            return
        }

        applicationForm.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationForm.id])
                redirect applicationForm
            }
            '*' { respond applicationForm, [status: CREATED] }
        }
    }

    def edit(ApplicationForm applicationForm) {
        respond applicationForm
    }

    @Transactional
    def update(ApplicationForm applicationForm) {
        if (applicationForm == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (applicationForm.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond applicationForm.errors, view:'edit'
            return
        }

        applicationForm.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationForm.id])
                redirect applicationForm
            }
            '*'{ respond applicationForm, [status: OK] }
        }
    }

    @Transactional
    def delete(ApplicationForm applicationForm) {

        if (applicationForm == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        applicationForm.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationForm.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
