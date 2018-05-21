<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'applicationForm.label', default: 'ApplicationForm')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-applicationForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                %{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
            </ul>
        </div>
        <div id="create-applicationForm" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.applicationForm}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.applicationForm}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.applicationForm}" method="POST">
                <fieldset class="form">
                    <f:with bean="applicationForm">
                        <h3>Section 1 Applicant details</h3>
                        <hr>
                        <br>
                        <p><b>Lead applicant</b> (e.g. Head of Department or Group, or clinical trial PI)</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.familyName"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.firstName"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.jobTitle"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.workAddress"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.telephoneNumber"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.emailAddress"/>
                            </div>
                        </div>
                        <br>
                        <p><b>Contact person</b> (if different from above)(i.e. the person who will coordinate the request(s) with OCHRe)
                        </p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.familyName"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.firstName"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.jobTitle"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.workAddress"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.telephoneNumber"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.emailAddress"/>
                            </div>
                        </div>
                        <br>
                        <p><b>Shipping details</b> (if different from above)</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.familyName"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.firstName"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.workAddress"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.telephoneNumber"/>
                            </div>
                        </div>
                        <br>
                        <hr>
                        <h3>Section 2 Funding details</h3>
                        <hr>
                        <br>
                        <p><b>Research funder</b> (e.g. commercial company, NHS or University)</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="researchFunder" label=" "/>
                            </div>
                        </div>
                        <br>
                        <p><b>Contact person for quotation / funding questions</b> (including name and contact details, phone, email)</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.familyName"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.firstName"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.workAddress"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="leadApplicant.telephoneNumber"/>
                            </div>
                        </div>
                        <br>
                        <h3>Section 3 Approval details</h3>
                        <hr>
                        <br>
                        <p><b>Ethical approval details</b> A copy of the approval letter to be submitted with this application. If you need ethical cover, you may use the phrase “request to come under ORB RTB ethics”
                        </p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="ethicalApprovalReferenceNo" label="Reference No"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="ethicalApprovalTitle" label="Title"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="ethicalApprovalDate" label="ApprovalDate"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="ethicalApprovalExpiryDate" label="ExpiryDate"/>
                            </div>
                        </div>
                        <br>
                        <p><b>Consent for use of data/tissues in research</b> (RTB consent form, NHS consent form, study-specific consent form, exempt?)</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="consentForUseOfData" label=" "/>
                            </div>
                        </div>
                        <br>
                        <p><b>R&D approval details</b> A copy of the approval letter should be submitted with this application (usually associated with ethical approval)</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="randDApprovalBody" label="Approval Body"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="randDApprovalReferenceNo" label="Reference No"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="randDApprovalOtherInformation" label="Other Information"/>
                            </div>
                        </div>
                        <br>
                        <p><b>Registration on portfolio</b> (NIHR, other)</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="registrationOnPortfolioName" label="Name of portfolio"/>
                            </div>
                        </div>
                        <br>
                        <p><b>Sponsor</b></p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="sponsorOrganisation" label="Organisation"/>
                            </div>
                        </div>
                        <br>
                        <p><b>Has an MTA been arranged?</b> (required for samples being requested from Oxford to be sent outside Oxford)</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="mTAArranged" label=" "/>
                            </div>
                        </div>
                        <br>
                        <h3>Section 4 Project details</h3>
                        <hr>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="researchProjectTitle" label="Research Project Title"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="expectedDurationOfProject" label="Expected duration of project"/>
                            </div>
                            <div class="col-lg-6">
                                <f:field property="projectDoneInAccreditedLab" label="Does this project need to be done in an accredited lab?"/>
                            </div>
                        </div>
                        <p><b>Lay summary</b>  (this may be made available on the OCHRe website, please advise if confidential)</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="projectLaySummary" label=" "/>
                            </div>
                        </div>
                        <p><b>Aims and objectives</b> (Scientific background, plan of investigation, methodology and any pilot data)
                        </p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="projectAimsAndObjectives" label=" "/>
                            </div>
                        </div>
                        <p><b>NHS Pathologist</b>  (advise if you have discussed this with an NHS pathologist and indicate name – if applicable)
                        </p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="projectNHSPathologist" label=" "/>
                            </div>
                        </div>
                        <br>
                        <h3>Section 5 Samples, service and data</h3>
                        <hr>
                        <p><b>Sample requirements</b>  (Sample/case numbers if known, description of samples required, is the tissue needed from biopsy samples or resection tissue?)

                        </p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="sampleRequirements" label=" "/>
                            </div>
                        </div>
                        <p><b>Full details of histology services required from OCHRe team </b>  (e.g. number of sections required, what thickness, what type of slide (charged or uncharged), staining, processing; any specific precautions required for
                        </p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="detailsOfHistologyRequiredFromOCHRe" label=" "/>
                            </div>
                        </div>
                        <p><b>How will material be used?</b>  (How will you use the materials requested in this application? For trials: include whether it is for screening (eligibility assessment), primary or secondary outcome measures, and/ or exploratory objectives?)

                        </p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="howMaterialUsed" label=" "/>
                            </div>
                        </div>
                        <p><b>Data requirements</b>  (Specify any accompanying data you require e.g. copy of pathology reports)
                        </p>
                        <div class="row">
                            <div class="col-lg-6">
                                <f:field property="dataRequirements" label=" "/>
                            </div>
                        </div>
                    </f:with>
                    %{--<f:all bean="applicationForm"/>--}%
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Submit" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
