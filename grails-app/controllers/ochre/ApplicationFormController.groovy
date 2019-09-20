package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])

@Transactional(readOnly = true)
class ApplicationFormController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def springSecurityService
    def mailService

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ApplicationForm.list(params), model:[applicationFormCount: ApplicationForm.count()]
    }

    @Secured(['ROLE_ADMIN'])
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

    def uploadPendingDocs(){
        def applicationFormId = params.long('applicationFormId')
        def applicationForm = ApplicationForm.findById(applicationFormId)
        [applicationForm:applicationForm]
    }

    @Transactional
    def savePendingUpload(){
        def applicationFormId = params.long('applicationFormId')
        def applicationForm = ApplicationForm.findById(applicationFormId)
        def ethicalApproval = applicationForm?.ethicalApproval
        def consentForUseInResearch = applicationForm?.consentForUseInResearch
        def mTAOrCTA = applicationForm?.mTAOrCTA


        for (number in 1..5 ) {
            def letter = request.getFile('ethicalApprovalLetter' + number )
            if(letter?.originalFilename){
                if (letter?.empty) {
                    return
                }
                def ethicalApprovalLetter = new EthicalApprovalLetter()
                ethicalApprovalLetter.letter = grailsApplication.config.uploadFolder + 'Ethical_Approval_Letter_' + UUID.randomUUID().toString() + '_Application_' + applicationForm.id + '_' +
                         letter.originalFilename
                if(params.ethicalApprovalLetterComplete == "Yes"){
                    ethicalApproval?.ethicalApprovalLetterComplete = true
                    ethicalApproval?.ethicalApprovalLetterPending = false
                }else {
                    ethicalApproval?.ethicalApprovalLetterComplete = false
                    ethicalApproval?.ethicalApprovalLetterPending = true
                }
                def destinationFile = new File(ethicalApprovalLetter.letter)
                try {
                    letter.transferTo(destinationFile)
                    ethicalApproval.addToEthicalApprovalLetter(ethicalApprovalLetter).save failOnError: true
                }
                catch (Exception ex) {
                    log.error(ex)
                }
            }
        }
        for (number in 1..5 ) {
            def form = request.getFile('consentForUseInResearchForm' + number )
            if(form?.originalFilename){
                if (form?.empty) {
                    return
                }
                def consentForUseInResearchForm = new ConsentForUseInResearchForms()
                consentForUseInResearchForm.form = grailsApplication.config.uploadFolder + 'Consent_Form_For_Use_In_Research_' + UUID.randomUUID().toString() + '_Application_' + applicationForm.id + '_' +
                        form.originalFilename
                def destinationFile = new File(consentForUseInResearchForm.form)
                if(params.consentForUseInResearchFormComplete == 'Yes'){
                    consentForUseInResearch?.consentForUseInResearchFormComplete = true
                    consentForUseInResearch?.consentForUseInResearchFormPending = false
                }else {
                    consentForUseInResearch?.consentForUseInResearchFormComplete = false
                    consentForUseInResearch?.consentForUseInResearchFormPending = true
                }
                try {
                    form.transferTo(destinationFile)
                    consentForUseInResearch.addToConsentForUseInResearchForms(consentForUseInResearchForm).save failOnError: true
                }
                catch (Exception ex) {
                    log.error(ex)
                }
            }
        }
        for (number in 1..5 ) {
            def copy = request.getFile('mTAOrCTA' + number )
            if(copy?.originalFilename){
                if (copy?.empty) {
                    return
                }
                def copyOfMTAOrCTA = new CopyOfMTAOrCTA()
                copyOfMTAOrCTA.copy = grailsApplication.config.uploadFolder + 'Copy_Of_MTA_Or_CTA_' + UUID.randomUUID().toString() + '_Application_' +  applicationForm.id + '_' +
                        copy.originalFilename
                if(params.mTAOrCTAComplete == 'Yes'){
                    mTAOrCTA?.mTAOrCTAComplete = true
                    mTAOrCTA.mTAOrCTAPending = false
                }else {
                    mTAOrCTA?.mTAOrCTAComplete = false
                    mTAOrCTA.mTAOrCTAPending = true
                }
                def destinationFile = new File(copyOfMTAOrCTA.copy)
                try {
                    copy.transferTo(destinationFile)
                    mTAOrCTA.addToCopyOfMTAOrCTA(copyOfMTAOrCTA).save failOnError: true
                }
                catch (Exception ex) {
                    log.error(ex)
                }
            }
        }
        if (applicationForm?.ethicalApproval?.ethicalApprovalLetterComplete && applicationForm?.consentForUseInResearch?.consentForUseInResearchFormComplete && applicationForm?.mTAOrCTA?.mTAOrCTAComplete){
            applicationForm.applicationType = ApplicationType.findByApplicationTypeName('Submitted')
            applicationForm.save failOnError: true
        }
        redirect(action: 'yourExistingApplications')
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
            redirect(uri:'/login/auth')
        }else if(User.findByUsername(emailAddress)){
            redirect(action: 'registration')
            flash.message = "An account with the email address already exists"
        }else if(!matchPassword){
            redirect(action: 'registration')
            flash.message = "Please enter matching password"
        }
    }

    def yourExistingApplications(){
        def applicationList = ApplicationForm.findAllByApplicationOwner(springSecurityService?.currentUser)
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
        }else if(applicationType == 'Submitted Pending Attachments'){
            status = 2
        }else if(applicationType == 'Submitted'){
            status = 3
        }else if(applicationType == 'OCHRe Committee Meeting'){
            status = 4
        }else if(applicationType == 'Application Approved'){
            status = 5
        }
        [status:status, applicationFormId:applicationFormId]
    }

    @Secured(['ROLE_ADMIN'])
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
                applicationForm?.leadApplicant?.name = params.leadApplicant.name
                applicationForm?.leadApplicant?.workAddress = params.leadApplicant.workAddress
                applicationForm?.leadApplicant?.telephoneNumber = params.leadApplicant.telephoneNumber
                applicationForm?.leadApplicant?.emailAddress = params.leadApplicant.emailAddress

                applicationForm?.contactPerson?.jobTitle = params.contactPerson.jobTitle
                applicationForm?.contactPerson?.name = params.contactPerson.name
                applicationForm?.contactPerson?.workAddress = params.contactPerson.workAddress
                applicationForm?.contactPerson?.telephoneNumber = params.contactPerson.telephoneNumber
                applicationForm?.contactPerson?.emailAddress = params.contactPerson.emailAddress

                applicationForm?.sampleRequestContact?.jobTitle = params.sampleRequestContact.jobTitle
                applicationForm?.sampleRequestContact?.name = params.sampleRequestContact.name
                applicationForm?.sampleRequestContact?.workAddress = params.sampleRequestContact.workAddress
                applicationForm?.sampleRequestContact?.telephoneNumber = params.sampleRequestContact.telephoneNumber
                applicationForm?.sampleRequestContact?.emailAddress = params.sampleRequestContact.emailAddress

                if(params.shippingDetailsSame == 'yes'){
                    applicationForm?.shippingDetails?.jobTitle = params.contactPerson.jobTitle
                    applicationForm?.shippingDetails?.name = params.contactPerson.name
                    applicationForm?.shippingDetails?.workAddress = params.contactPerson.workAddress
                    applicationForm?.shippingDetails?.telephoneNumber = params.contactPerson.telephoneNumber
                    applicationForm?.shippingDetails?.emailAddress = params.contactPerson.emailAddress
                }else {
                    applicationForm?.shippingDetails?.jobTitle = params.shippingDetails.jobTitle
                    applicationForm?.shippingDetails?.name = params.shippingDetails.name
                    applicationForm?.shippingDetails?.workAddress = params.shippingDetails.workAddress
                    applicationForm?.shippingDetails?.telephoneNumber = params.shippingDetails.telephoneNumber
                    applicationForm?.shippingDetails?.emailAddress = params.shippingDetails.emailAddress
                }
                applicationForm.applicationOwner = springSecurityService?.currentUser
                applicationForm.save failOnError: true

            } else {
                applicationForm = new ApplicationForm()

                def leadApplicant = new Person()
                def contactPerson = new Person()
                def shippingDetails = new Person()
                def sampleRequestContact = new Person()

                leadApplicant?.jobTitle = params.leadApplicant.jobTitle
                leadApplicant?.name = params.leadApplicant.name
                leadApplicant?.workAddress = params.leadApplicant.workAddress
                leadApplicant?.telephoneNumber = params.leadApplicant.telephoneNumber
                leadApplicant?.emailAddress = params.leadApplicant.emailAddress

                contactPerson?.jobTitle = params.contactPerson.jobTitle
                contactPerson?.name = params.contactPerson.name
                contactPerson?.workAddress = params.contactPerson.workAddress
                contactPerson?.telephoneNumber = params.contactPerson.telephoneNumber
                contactPerson?.emailAddress = params.contactPerson.emailAddress

                sampleRequestContact?.jobTitle = params.sampleRequestContact.jobTitle
                sampleRequestContact?.name = params.sampleRequestContact.name
                sampleRequestContact?.workAddress = params.sampleRequestContact.workAddress
                sampleRequestContact?.telephoneNumber = params.sampleRequestContact.telephoneNumber
                sampleRequestContact?.emailAddress = params.sampleRequestContact.emailAddress

                if(params.shippingDetailsSame == 'yes'){
                    shippingDetails?.jobTitle = params.contactPerson.jobTitle
                    shippingDetails?.name = params.contactPerson.name
                    shippingDetails?.workAddress = params.contactPerson.workAddress
                    shippingDetails?.telephoneNumber = params.contactPerson.telephoneNumber
                    shippingDetails?.emailAddress = params.contactPerson.emailAddress
                }else {
                    shippingDetails?.jobTitle = params.shippingDetails.jobTitle
                    shippingDetails?.name = params.shippingDetails.name
                    shippingDetails?.workAddress = params.shippingDetails.workAddress
                    shippingDetails?.telephoneNumber = params.shippingDetails.telephoneNumber
                    shippingDetails?.emailAddress = params.shippingDetails.emailAddress
                }

                leadApplicant.save()
                contactPerson.save()
                sampleRequestContact.save()
                shippingDetails.save()

                applicationForm.applicationOwner = springSecurityService?.currentUser
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
                applicationForm?.contactPersonQuotationFunding?.name = params.contactPersonQuotationFunding.name
                applicationForm?.contactPersonQuotationFunding?.workAddress = params.contactPersonQuotationFunding.workAddress
                applicationForm?.contactPersonQuotationFunding?.telephoneNumber = params.contactPersonQuotationFunding.telephoneNumber
                applicationForm?.contactPersonQuotationFunding?.emailAddress = params.contactPersonQuotationFunding.emailAddress
                applicationForm.save failOnError: true
            }else {
                applicationForm.researchFunder = params.researchFunder
                applicationForm.companyName = params.companyName
                def contactPersonQuotationFunding = new Person()
                contactPersonQuotationFunding?.jobTitle = params.contactPersonQuotationFunding.jobTitle
                contactPersonQuotationFunding?.name = params.contactPersonQuotationFunding.name
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
                applicationForm?.randDApproval?.organisation = params.randDApproval.organisation
                applicationForm?.randDApproval?.pid = params.randDApproval.pid
                applicationForm?.randDApproval?.otherInformation = params.randDApproval.otherInformation
                applicationForm?.registrationOnPortfolio = params.registrationOnPortfolio
                applicationForm?.registrationOnPortfolioName = params.registrationOnPortfolioName
                applicationForm?.sponsorOrganisation = params.sponsorOrganisation
                applicationForm?.mTAArranged = params.mTAArranged
                applicationForm.save failOnError: true
            }else {
                def ethicalApproval = new EthicalApproval()
                def consentForUseInResearch = new ConsentForUseInResearch()
                def randDApproval = new RandDApproval()
                def mTAOrCTA = new MTAOrCTA()

                ethicalApproval?.referenceNo = params.ethicalApproval.referenceNo
                ethicalApproval?.title = params.ethicalApproval.title
                if(params.ethicalApprovalLetterComplete == "Yes"){
                    ethicalApproval?.ethicalApprovalLetterComplete = true
                    ethicalApproval?.ethicalApprovalLetterPending = false
                }else {
                    ethicalApproval?.ethicalApprovalLetterComplete = false
                    ethicalApproval?.ethicalApprovalLetterPending = true
                }
                ethicalApproval?.startDate = Date.parse("yyyy-MM-dd", params.ethicalApproval.startDate)
                randDApproval?.organisation = params.randDApproval.organisation
                randDApproval?.pid = params.randDApproval.pid
                randDApproval?.otherInformation = params.randDApproval.otherInformation
                applicationForm?.registrationOnPortfolio = params.registrationOnPortfolio
                applicationForm?.registrationOnPortfolioName = params.registrationOnPortfolioName
                applicationForm?.sponsorOrganisation = params.sponsorOrganisation
                applicationForm?.mTAArranged = params.mTAArranged
                ethicalApproval.save failOnError: true
                for (number in 1..5 ) {
                    def letter = request.getFile('ethicalApprovalLetter' + number )
                    if(letter?.originalFilename){
                        if (letter?.empty) {
                            return
                        }
                        def ethicalApprovalLetter = new EthicalApprovalLetter()
                        ethicalApprovalLetter.letter = grailsApplication.config.uploadFolder + 'Ethical_Approval_Letter_' + UUID.randomUUID().toString() + '_Application_' + applicationForm.id + '_' +
                                letter.originalFilename
                        def destinationFile = new File(ethicalApprovalLetter.letter)
                        try {
                            letter.transferTo(destinationFile)
                            ethicalApproval.addToEthicalApprovalLetter(ethicalApprovalLetter).save failOnError: true
                        }
                        catch (Exception ex) {
                            log.error(ex)
                        }
                    }
                }
                if(params.consentForUseInResearchFormComplete == 'Yes'){
                    consentForUseInResearch?.consentForUseInResearchFormComplete = true
                    consentForUseInResearch?.consentForUseInResearchFormPending = false
                }else {
                    consentForUseInResearch?.consentForUseInResearchFormComplete = false
                    consentForUseInResearch?.consentForUseInResearchFormPending = true
                }
                consentForUseInResearch.save failOnError: true
                for (number in 1..5 ) {
                    def form = request.getFile('consentForUseInResearchForm' + number )
                    if(form?.originalFilename){
                        if (form?.empty) {
                            return
                        }
                        def consentForUseInResearchForm = new ConsentForUseInResearchForms()
                        consentForUseInResearchForm.form = grailsApplication.config.uploadFolder + 'Consent_Form_For_Use_In_Research_' + UUID.randomUUID().toString() + '_Application_' + applicationForm.id + '_' +
                                form.originalFilename
                        def destinationFile = new File(consentForUseInResearchForm.form)
                        try {
                            form.transferTo(destinationFile)
                            consentForUseInResearch.addToConsentForUseInResearchForms(consentForUseInResearchForm).save failOnError: true
                        }
                        catch (Exception ex) {
                            log.error(ex)
                        }
                    }
                }
                randDApproval.save failOnError: true
                if(params.mTAOrCTAComplete == 'Yes' || params.mTAArranged == 'No Needed'){
                    mTAOrCTA?.mTAOrCTAComplete = true
                    mTAOrCTA.mTAOrCTAPending = false
                }else {
                    mTAOrCTA?.mTAOrCTAComplete = false
                    mTAOrCTA.mTAOrCTAPending = true
                }
                mTAOrCTA.save failOnError: true
                for (number in 1..5 ) {
                    def copy = request.getFile('mTAOrCTA' + number )
                    if(copy?.originalFilename){
                        if (copy?.empty) {
                            return
                        }
                        def copyOfMTAOrCTA = new CopyOfMTAOrCTA()
                        copyOfMTAOrCTA.copy = grailsApplication.config.uploadFolder + 'Copy_Of_MTA_Or_CTA_' + UUID.randomUUID().toString() + '_Application_' +  applicationForm.id + '_' +
                                copy.originalFilename
                        def destinationFile = new File(copyOfMTAOrCTA.copy)
                        try {
                            copy.transferTo(destinationFile)
                            mTAOrCTA.addToCopyOfMTAOrCTA(copyOfMTAOrCTA).save failOnError: true
                        }
                        catch (Exception ex) {
                            log.error(ex)
                        }
                    }
                }
                applicationForm?.ethicalApproval = ethicalApproval
                applicationForm?.consentForUseInResearch = consentForUseInResearch
                applicationForm?.randDApproval = randDApproval
                applicationForm?.stepThreeComplete = true
                applicationForm?.mTAOrCTA = mTAOrCTA
                applicationForm.save failOnError: true
            }
            redirect(action: "create", fragment:fragment, params:[applicationFormId: applicationForm.id])
        }else if (stepNumber == 4){
            if(applicationForm.stepFourComplete){
                applicationForm?.trial?.trialTitle = params.trial.trialTitle
                applicationForm?.trial?.recruitmentAgreedTarget = params.trial.recruitmentAgreedTarget
                applicationForm?.trial?.sponsor = params.trial.sponsor
                applicationForm?.trial?.protocolSynopsis = params.trial.protocolSynopsis
                applicationForm?.trial?.siteEndDate = Date.parse("yyyy-MM-dd", params.trial.siteEndDate)
                applicationForm?.trial?.laySummary = params.trial.laySummary
                applicationForm?.trial?.nHSPathologist = params.trial.nHSPathologist
                applicationForm?.trial?.pathologistName = params.trial.pathologistName
                applicationForm.save failOnError: true
            }else {
                def trial = new Trial()
                trial?.trialTitle = params.trial.trialTitle
                trial?.siteEndDate = Date.parse("yyyy-MM-dd", params.trial.siteEndDate)
                trial?.laySummary = params.trial.laySummary
                trial?.recruitmentAgreedTarget = params.trial.recruitmentAgreedTarget
                trial?.sponsor = params.trial.sponsor
                trial?.protocolSynopsis = params.trial.protocolSynopsis
                trial?.nHSPathologist = params.trial.nHSPathologist
                trial?.pathologistName = params.trial.pathologistName
                applicationForm.trial = trial
                applicationForm?.stepFourComplete = true
                applicationForm.save failOnError: true
            }
            redirect(action: "create", fragment:fragment, params:[applicationFormId: applicationForm.id])
        }else if (stepNumber == 5){

            applicationForm.dataRequirements = params.dataRequirements
            applicationForm.dataRequirementsOther = params.dataRequirementsOther
            applicationForm.howMaterialUsed = params.howMaterialUsed
            applicationForm.terms = params.terms

            def clinicalTrialForm = request.getFile('clinicalTrialForm')
            if (clinicalTrialForm?.originalFilename){
                if (clinicalTrialForm?.empty) {
                    return
                }
                applicationForm?.clinicalTrialForm = grailsApplication.config.uploadFolder + 'Clinical_Trial_Form_' + UUID.randomUUID().toString() + '_Application_' + applicationForm.id + '_' +
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
            sample1?.timePoint = params.sample.timePoint1
            sample1?.sampleFor = params.sample.sampleFor1
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
                sample2?.timePoint = params.sample.timePoint2
                sample2?.sampleFor = params.sample.sampleFor2
                sample2?.sampleType = params.sample.sampleType2
                sample2?.slideNumber = params.sample.slideNumber2
                sample2?.slideThickness = params.sample.slideThickness2
                sample2?.slideType = params.sample.slideType2
                sample2?.stained = params.sample.stained2
                sample2?.stainedSpecify = params.sample.stainedSpecify2
                sample2?.specialRequirements = params.sample.specialRequirements2
                applicationForm.addToSamples(sample2).save failOnError: true
            }
            if(applicationForm.ethicalApproval.ethicalApprovalLetterPending
               || applicationForm.consentForUseInResearch.consentForUseInResearchFormPending
               || applicationForm.mTAOrCTA.mTAOrCTAPending){
                applicationForm?.applicationType = ApplicationType.findByApplicationTypeName('Submitted Pending Attachments')
            }else {
                applicationForm?.applicationType = ApplicationType.findByApplicationTypeName('Submitted')
            }
            applicationForm.save failOnError: true
            redirect(action: "applicationStatus", params:[applicationFormId: applicationForm.id])
        }
    }

    def download() {
        def id = params.long('id')
        if (params.docomentType == 'ethicalApprovalLetter'){
            EthicalApprovalLetter ethicalApprovalLetterInstance = EthicalApprovalLetter.get(id)
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${ethicalApprovalLetterInstance.letter}\"")
            def file = new File(ethicalApprovalLetterInstance.letter)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }else if (params.docomentType == 'consentForUseInResearchForm'){
            ConsentForUseInResearchForms consentForUseInResearchFormsInstance = ConsentForUseInResearchForms.get(id)
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${consentForUseInResearchFormsInstance.form}\"")
            def file = new File(consentForUseInResearchFormsInstance.form)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }else if (params.docomentType == 'copyOfMTAOrCTA'){
            CopyOfMTAOrCTA copyOfMTAOrCTAInstance = CopyOfMTAOrCTA.get(id)
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${copyOfMTAOrCTAInstance.copy}\"")
            def file = new File(copyOfMTAOrCTAInstance.copy)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }else if (params.docomentType == 'clinicalTrialForm'){
            ApplicationForm applicationFormInstance = ApplicationForm.get(id)
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${applicationFormInstance.clinicalTrialForm}\"")
            def file = new File(applicationFormInstance.clinicalTrialForm)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }
    }

    @Transactional
    def updateStatus(){
        def applicationForm = ApplicationForm.findById(params.long('applicationFormId'))
        def applicationStatus = ApplicationType.findByApplicationTypeName(params.status)
        applicationForm.applicationType = applicationStatus
        applicationForm.save failOnError: true
        mailService.sendMail {
            to "admin@ox.ac.uk"
            subject "Application " + applicationForm.id
            text "You application has been approved"
        }
        redirect(action: 'show', params: [id: applicationForm.id])
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

    @Secured(['ROLE_ADMIN'])
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
