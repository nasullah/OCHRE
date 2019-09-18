<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'applicationForm.label', default: 'ApplicationForm')}" />
        <title>Application ${applicationForm.id}</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    </head>
    <body>
    <a href="#show-applicationForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div style="margin-left: 30px;margin-right: 30px;">
    <br>
    <h3 style="color: #17a2b8"><center>Application: ${applicationForm?.id}</center></h3>
    <h3 style="color: #17a2b8"><center>Status: ${applicationForm?.applicationType}</center></h3><br>
    <div>
        <center>
            <g:if test="${applicationForm.applicationType.applicationTypeName == 'Submitted'}">
                <g:form action="updateStatus" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
                    <g:hiddenField name="applicationFormId" value="${applicationForm.id}"/>
                    <g:hiddenField name="status" value="OCHRe Committee Meeting"/>
                    <button type="submit" class="btn btn-info"><span class="fa fa-users"></span> Assign to OCHRe Committee Meeting</button>
                </g:form>
            </g:if>
            <g:elseif test="${applicationForm.applicationType.applicationTypeName == 'OCHRe Committee Meeting'}">
                <g:form action="updateStatus" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
                    <g:hiddenField name="applicationFormId" value="${applicationForm.id}"/>
                    <g:hiddenField name="status" value="Application Approved"/>
                    <button type="submit" class="btn btn-info"><span class="fa fa-check"></span> Approve Application</button>
                </g:form>
            </g:elseif>
        </center>
    </div>
    <div id="step-1">
    <g:form action="saveForm" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
    <div id="form-step-0" role="form" data-toggle="validator">
    <br>
    <h3 class="border-bottom border-gray pb-2">Section 1 Applicant details</h3>
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header"><b>Lead applicant</b> (e.g. Clinical Trial PI)</div>
                <div class="card-body">
                    <div class="card-block p-0">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="leadApplicant.jobTitle">Title</label><br>
                                    <input type='text' size="25" name='leadApplicant.jobTitle' id='leadApplicant.jobTitle' value="${applicationForm?.leadApplicant?.jobTitle}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="leadApplicant.name">Name</label><br>
                                    <input type='text' size="30" name='leadApplicant.name' id='leadApplicant.name' value="${applicationForm?.leadApplicant?.name}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="leadApplicant.workAddress">Work Address</label><br>
                                    <textarea name='leadApplicant.workAddress' id='leadApplicant.workAddress' readonly>${applicationForm?.leadApplicant?.workAddress}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="leadApplicant.telephoneNumber">Telephone Number</label><br>
                                    <input type='text' size="25" name='leadApplicant.telephoneNumber' id='leadApplicant.telephoneNumber' value="${applicationForm?.leadApplicant?.telephoneNumber}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="leadApplicant.emailAddress">Email Address</label><br>
                                    <input type='text' size="30" name='leadApplicant.emailAddress' id='leadApplicant.emailAddress' value="${applicationForm?.leadApplicant?.emailAddress}" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header"><b>Trial Contact</b> (e.g. Clinical Trial Administrator/Manager)</div>
                <div class="card-body">
                    <div class="card-block p-0">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPerson.jobTitle">Title</label><br>
                                    <input type='text' size="25" name='contactPerson.jobTitle' id='contactPerson.jobTitle' value="${applicationForm?.contactPerson?.jobTitle}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPerson.name">Name</label><br>
                                    <input type='text' size="30" name='contactPerson.name' id='contactPerson.name' value="${applicationForm?.contactPerson?.name}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPerson.workAddress">Work Address</label><br>
                                    <textarea  name='contactPerson.workAddress' id='contactPerson.workAddress' readonly>${applicationForm?.contactPerson?.workAddress}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPerson.telephoneNumber">Telephone Number</label><br>
                                    <input type='text' size="25" name='contactPerson.telephoneNumber' id='contactPerson.telephoneNumber' value="${applicationForm?.contactPerson?.telephoneNumber}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPerson.emailAddress">Email Address</label><br>
                                    <input type='text' size="30" name='contactPerson.emailAddress' id='contactPerson.emailAddress' value="${applicationForm?.contactPerson?.emailAddress}" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header"><b>Sample Request Contact</b> (e.g. Research Nurse or Clinical Trial Practitioner)</div>
                <div class="card-body">
                    <div class="card-block p-0">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="sampleRequestContact.jobTitle">Title</label><br>
                                    <input type='text' size="25" name='sampleRequestContact.jobTitle' id='sampleRequestContact.jobTitle' value="${applicationForm?.sampleRequestContact?.jobTitle}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="sampleRequestContact.name">Name</label><br>
                                    <input type='text' size="30" name='sampleRequestContact.name' id='sampleRequestContact.name' value="${applicationForm?.sampleRequestContact?.name}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="sampleRequestContact.workAddress">Work Address</label><br>
                                    <textarea name='sampleRequestContact.workAddress' id='sampleRequestContact.workAddress' readonly>${applicationForm?.sampleRequestContact?.workAddress}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="sampleRequestContact.telephoneNumber">Telephone Number</label><br>
                                    <input type='text' size="25" name='sampleRequestContact.telephoneNumber' id='sampleRequestContact.telephoneNumber' value="${applicationForm?.sampleRequestContact?.telephoneNumber}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="sampleRequestContact.emailAddress">Email Address</label><br>
                                    <input type='text' size="30" name='sampleRequestContact.emailAddress' id='sampleRequestContact.emailAddress' value="${applicationForm?.sampleRequestContact?.emailAddress}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <label>Is shipping details different from above?</label><br>
                                <g:radioGroup name="shippingDetailsSame"
                                              values="[true, false]"
                                              labels="['Yes', 'No']"
                                              value="${applicationForm?.shippingDetailsSame}">
                                    ${it.label}  ${it.radio} &nbsp; &nbsp;
                                </g:radioGroup>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card" id="shipping">
                <div class="card-header"><b>Shipping Details</b></div>
                <div class="card-body">
                    <div class="card-block p-0">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="shippingDetails.jobTitle">Title</label><br>
                                    <input type='text' size="25" name='shippingDetails.jobTitle' id='shippingDetails.jobTitle' value="${applicationForm?.shippingDetails?.jobTitle}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="shippingDetails.name">Name</label><br>
                                    <input type='text' size="30" name='shippingDetails.name' id='shippingDetails.name' value="${applicationForm?.shippingDetails?.name}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="shippingDetails.workAddress">Work Address</label><br>
                                    <textarea name='shippingDetails.workAddress' id='shippingDetails.workAddress' readonly>${applicationForm?.shippingDetails?.workAddress}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="shippingDetails.telephoneNumber">Telephone Number</label><br>
                                    <input type='text' size="25" name='shippingDetails.telephoneNumber' id='shippingDetails.telephoneNumber' value="${applicationForm?.shippingDetails?.telephoneNumber}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="shippingDetails.emailAddress">Email Address</label><br>
                                    <input type='text' size="30" name='shippingDetails.emailAddress' id='shippingDetails.emailAddress' value="${applicationForm?.shippingDetails?.emailAddress}" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <g:hiddenField name="stepNumber" value="1"/>
    <g:hiddenField name="applicationFormId" value="${applicationForm?.id}"/>
    </g:form>
    </div>
    <div id="step-2">
        <g:form action="saveForm" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
            <div id="form-step-1" role="form" data-toggle="validator">
                <br>
                <h3 class="border-bottom border-gray pb-2">Section 2 Funding details</h3>
                <div class="card">
                    <div class="card-header"><b>Research funder </b></div>
                    <div class="card-block p-0" style="margin: auto;width: 50%">
                        <br>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="researchFunder">Please select</label><br>
                                    <g:select name="researchFunder" id="researchFunderSelection" from="['Commercial', 'NHS', 'University']" onChange="showCompanyName()" value="${applicationForm?.researchFunder}" noSelection="['':'']" style="width:180px;height:30px;" />
                                </div>
                            </div>
                            <div class="col-lg-6" id="companyNameDisplay">
                                <div class="form-group">
                                    <label for="companyName">Company Name</label><br>
                                    <input type='text' size="30" name='companyName' id='companyName' value="${applicationForm?.companyName}" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="card">
                    <div class="card-header"><b>Contact person for quotation / funding questions</b></div>
                    <div class="card-block p-0" style="margin: auto;width: 50%">
                        <br>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPersonQuotationFunding.jobTitle">Title</label><br>
                                    <input type='text' size="25" name='contactPersonQuotationFunding.jobTitle' id='contactPersonQuotationFunding.jobTitle' value="${applicationForm?.contactPersonQuotationFunding?.jobTitle}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPersonQuotationFunding.name">Name</label><br>
                                    <input type='text' size="30" name='contactPersonQuotationFunding.name' id='contactPersonQuotationFunding.name' value="${applicationForm?.contactPersonQuotationFunding?.name}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPersonQuotationFunding.workAddress">Work Address</label><br>
                                    <textarea name='contactPersonQuotationFunding.workAddress' id='contactPersonQuotationFunding.workAddress' readonly>${applicationForm?.contactPersonQuotationFunding?.workAddress}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPersonQuotationFunding.telephoneNumber">Telephone Number</label><br>
                                    <input type='text' size="25" name='contactPersonQuotationFunding.telephoneNumber' id='contactPersonQuotationFunding.telephoneNumber' value="${applicationForm?.contactPersonQuotationFunding?.telephoneNumber}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="contactPersonQuotationFunding.emailAddress">Email Address</label><br>
                                    <input type='text' size="30" name='contactPersonQuotationFunding.emailAddress' id='contactPersonQuotationFunding.emailAddress' value="${applicationForm?.contactPersonQuotationFunding?.emailAddress}" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </g:form>
    </div>
    <div id="step-3">
    <g:uploadForm action="saveForm" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
    <div id="form-step-2" role="form" data-toggle="validator">
    <br>
    <h3 class="border-bottom border-gray pb-2">Section 3 Approval details</h3>
    <div class="card">
        <div class="card-header"><b>Ethical approval details</b> </div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <div class="row">
                <br>
                <g:if test="${applicationForm?.ethicalApproval}">
                    <label class="col-lg-12" for="ethicalApprovalLetter">Copy of the approval letter</label><br>
                    <g:each in="${applicationForm?.ethicalApproval?.ethicalApprovalLetter}" status="i" var="ethicalApprovalLetter">
                        <div class="col-lg-12">
                            <g:link style="color:blue" action="download" id="${ethicalApprovalLetter?.id}" params="[docomentType: 'ethicalApprovalLetter']">${ethicalApprovalLetter?.toString()?.split('_')?.last()}</g:link>
                        </div>
                    </g:each>
                </g:if>
                <div class="col-lg-12">
                    <label for="ethicalApprovalLetterComplete">Have you uploaded all documents?</label><br>
                    <g:radioGroup name="shippingDetailsSame"
                                  values="[true, false]"
                                  labels="['Yes', 'No']"
                                  value="${applicationForm?.ethicalApproval?.ethicalApprovalLetterComplete}">
                        ${it.label}  ${it.radio} &nbsp; &nbsp;
                    </g:radioGroup>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="ethicalApproval.referenceNo">Reference No</label><br>
                        <input size="25" type='text' name='ethicalApproval.referenceNo' id='ethicalApproval.referenceNo' value="${applicationForm?.ethicalApproval?.referenceNo}" readonly>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="ethicalApproval.title">Title</label><br>
                        <input size="30" type='text' name='ethicalApproval.title' id='ethicalApproval.title' value="${applicationForm?.ethicalApproval?.title}" readonly>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="ethicalApproval.startDate">Approval Date</label><br>
                        <input size="25" type='date' name='ethicalApproval.startDate' id='ethicalApproval.startDate' value="${applicationForm?.ethicalApproval?.startDate?.toString()?.substring(0,10)}" readonly>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header"><b>Consent forms and PIS’s</b></div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <br>
            <div class="row">
                <g:if test="${applicationForm?.consentForUseInResearch}">
                    <label class="col-lg-12" for="consentForUseInResearchForms">Copy of the consent form</label><br>
                    <g:each in="${applicationForm?.consentForUseInResearch?.consentForUseInResearchForms}" status="i" var="consentForUseInResearchForms">
                        <div class="col-lg-12">
                            <g:link style="color:blue" action="download" id="${consentForUseInResearchForms?.id}" params="[docomentType: 'consentForUseInResearchForm']">${consentForUseInResearchForms?.toString()?.split('_')?.last()}</g:link>
                        </div>
                    </g:each>
                </g:if>
                <div class="col-lg-12">
                    <label for="consentForUseInResearchFormComplete">Have you uploaded all documents?</label><br>
                    <g:radioGroup name="test"
                                  values="[true, false]"
                                  labels="['Yes', 'No']"
                                  value="${applicationForm?.consentForUseInResearch?.consentForUseInResearchFormComplete}">
                        ${it.label}  ${it.radio} &nbsp; &nbsp;
                    </g:radioGroup>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header"><b>R&D approval details</b></div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="randDApproval.organisation">Organisation</label><br>
                        <g:select name="randDApproval.organisation" id="randDApprovalOrganisation" from="['OUH', 'Other']" value="${applicationForm?.randDApproval?.organisation}" onChange="showOtherLabel()" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="randDApproval.pid">PID</label><br>
                        <input type='text' size="30" name='randDApproval.pid' id='randDApproval.pid' value="${applicationForm?.randDApproval?.pid}" readonly>
                    </div>
                </div>
                <div class="col-lg-6">
                    <p>
                        <label id="otherInformationMan">Other Information</label>
                        <textarea rows="4" cols="50" type='text' name='randDApproval.otherInformation' id='randDApprovalOtherInformation' readonly>${applicationForm?.randDApproval?.otherInformation}</textarea>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header"><b>Registration on portfolio</b> (NIHR, other)</div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <br>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="registrationOnPortfolio">Please select</label><br>
                        <g:select name="registrationOnPortfolio" id="registrationOnPortfolio" from="['Registered to a portfolio', 'Not registered on a portfolio']" onChange="registrationOnPortfolioNameShow()" value="${applicationForm?.registrationOnPortfolio}" noSelection="['':'']" style="width:180px;height:30px;" />
                    </div>
                </div>
                <div class="col-lg-6" id="registrationOnPortfolioNameSection">
                    <div class="form-group">
                        <label for="registrationOnPortfolioName">Name of portfolio</label><br>
                        <input type='text' size="30" name='registrationOnPortfolioName' id='registrationOnPortfolioName' value="${applicationForm?.registrationOnPortfolioName}" readonly>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header"><b>Sponsor</b></div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <br>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sponsorOrganisation">Organisation</label><br>
                        <input size="25" type='text' name='sponsorOrganisation' id='sponsorOrganisation' value="${applicationForm?.sponsorOrganisation}" readonly>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header"><b>Has an MTA been arranged?</b> (required for samples being requested from Oxford to be sent outside Oxford). This may already be included in CTA.</div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <br>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="mTAArranged">Please select</label><br>
                        <g:select name="mTAArranged" id="mTAArranged" from="['Yes', 'No Needed', 'Within CTA']" value="${applicationForm?.mTAArranged}" onChange="showMTAOrCTA()" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
            </div>
            <div class="row" id="mTAOrCTA">
                <g:if test="${applicationForm?.mTAOrCTA}">
                    <label class="col-lg-12" for="ethicalApprovalLetter">Copy of the MTA or CTA</label><br>
                    <g:each in="${applicationForm?.mTAOrCTA?.copyOfMTAOrCTA}" status="i" var="copyOfMTAOrCTA">
                        <div class="col-lg-12">
                            <g:link style="color:blue" action="download" id="${copyOfMTAOrCTA?.id}" params="[docomentType: 'copyOfMTAOrCTA']">${copyOfMTAOrCTA?.toString()?.split('_')?.last()}</g:link>
                        </div>
                    </g:each>
                </g:if>
                <div class="col-lg-12">
                    <label for="ethicalApprovalLetterComplete">Have you uploaded all documents?</label><br>
                    <g:radioGroup name="consentForUseInResearchFormComplete"
                                  values="[true, false]"
                                  labels="['Yes', 'No']"
                                  value="${applicationForm?.mTAOrCTA?.mTAOrCTAComplete}">
                        ${it.label}  ${it.radio} &nbsp; &nbsp;
                    </g:radioGroup>
                </div>
            </div>
        </div>
    </div>
    </div>
    </g:uploadForm>
    </div>
    <div id="step-4">
        <g:form action="saveForm" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
            <div id="form-step-3" role="form" data-toggle="validator">
                <br>
                <h3 class="border-bottom border-gray pb-2">Section 4 Project details</h3>
                <div class="card">
                    <div class="card-header"><b>Trial Details</b></div>
                    <div class="card-block p-0" style="margin: auto;width: 50%">
                        <br>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="trial.trialTitle">Trial title</label><br>
                                    <input type='text' size="25" name='trial.trialTitle' id='trial.trialTitle' value="${applicationForm?.trial?.trialTitle}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="trial.siteEndDate">Site end date</label><br>
                                    <input type='date' name='trial.siteEndDate' id='trial.siteEndDate' value="${applicationForm?.trial?.siteEndDate?.toString()?.substring(0,10)}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="trial.recruitmentAgreedTarget">Agreed recruitment target</label><br>
                                    <input type='text' size="25" name='trial.recruitmentAgreedTarget' id='trial.recruitmentAgreedTarget' value="${applicationForm?.trial?.recruitmentAgreedTarget}" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="trial.sponsor">Sponsor</label><br>
                                    <input type='text' size="30" name='trial.sponsor' id='trial.sponsor' value="${applicationForm?.trial?.sponsor}" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="card">
                    <div class="card-header"><b>Lay summary</b>  (this may be made available on the OCHRe website, please advise if confidential)</div>
                    <div class="card-block p-0" style="margin: auto;width: 50%">
                        <br>
                        <div class="row">
                            <div class="col-lg-6">
                                <p>
                                    <textarea rows="4" cols="50" type='text' name='trial.laySummary' id='trial.laySummary' readonly>${applicationForm?.trial?.laySummary}</textarea>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="card">
                    <div class="card-header"><b>Protocol synopsis</b></div>
                    <div class="card-block p-0" style="margin: auto;width: 50%">
                        <br>
                        <div class="row">
                            <div class="col-lg-6">
                                <p>
                                    <textarea rows="4" cols="50" type='text' name='trial.protocolSynopsis' id='trial.protocolSynopsis' readonly>${applicationForm?.trial?.protocolSynopsis}</textarea>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="card">
                    <div class="card-header"><b>NHS Pathologist</b>, is there a named pathologist working on this project?</div>
                    <div class="card-block p-0" style="margin: auto;width: 50%">
                        <br>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="trial.nHSPathologist">Please select</label><br>
                                    <g:select name="trial.nHSPathologist" id="nHSPathologist" from="['Yes', 'No']" value="${applicationForm?.trial?.nHSPathologist}" noSelection="['':'']" style="width:180px;height:30px;" onchange="nhsPathologistShow()"/>
                                </div>
                            </div>
                            <div class="col-lg-6" id="nHSPathologistName">
                                <div class="form-group">
                                    <label for="pathologistName">Pathologist Name</label>
                                    <input type='text' size="30" name='trial.pathologistName' id='pathologistName' value="${applicationForm?.trial?.pathologistName}" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </g:form>
    </div>
    <div id="step-5">
    <g:uploadForm action="saveForm" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
    <div id="form-step-4" role="form" data-toggle="validator">
    <br>
    <h3 class="border-bottom border-gray pb-2">Section 5 Samples, service and data</h3>
    <div class="card">
        <div class="card-header"><b>Please identify every sample that the study requires (per patient)</b></div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <br>
            <div class="row" id="sample1">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="timePoint1">Timepoint</label><br>
                        <g:select name="timePoint1" id="timePoint1"  from="['Screening', 'Disease progression', 'End of study']" value="${applicationForm?.samples[0]?.timePoint}" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sampleSampleFor2">What is this sample for?</label><br>
                        <g:select name="sample.sampleFor1" id="sampleSampleFor1"  from="['Eligibility/randomisation', 'Primary or secondary outcomes', 'Exploratory outcome only']" value="${applicationForm?.samples[0]?.sampleFor}" noSelection="['':'']" style="width:240px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sampleSampleType1">What is required? <span style="color: red">*</span></label><br>
                        <g:select name="sample.sampleType1" id="sampleSampleType1" onChange="unstainedSection1()" from="['Unstained sections', 'Study samples that need processing and embedding, to turn it into a FFPE block', 'Archival block']" value="${applicationForm?.samples[0]?.sampleType}" noSelection="['':'']" style="width:440px;height:30px;"/>
                    </div>
                </div>
            </div>
            <p style="color: blue" id="archivalNote1">If the study accepts sections or a block, please select unstained sections instead.  If having the block is imperative to the study, then extra consent may be needed if the study consent form does not adequately state the risks of blocks no longer being in the archive.</p>
            <div class="row" id="unstainedSections1">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sample.slideNumber1">Number of sections</label><br>
                        <input type='text' name='sample.slideNumber1' id='sample.slideNumber1' value="${applicationForm?.samples[0]?.slideNumber}">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sample.slideThickness1">Thickness of sections</label><br>
                        <input type='text' name='sample.slideThickness1' id='sample.slideThickness1' value="${applicationForm?.samples[0]?.slideThickness}">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sample.slideType1">Type of slide</label><br>
                        <g:select name="sample.slideType1" id="sample.slideType1" from="['Charged', 'Uncharged']" value="${applicationForm?.samples[0]?.slideType}" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sample.stained1">Do any need to be stained?</label><br>
                        <g:select name="sample.stained1" id="sampleStained1" from="['Yes', 'No']" value="${applicationForm?.samples[0]?.stained}" onchange="showStainedSpecify1Display()" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6" id="stainedSpecify1Display">
                    <div class="form-group">
                        <label for="sample.stainedSpecify1">Please specify staining</label><br>
                        <textarea rows="4" cols="50" type='text' name='sample.stainedSpecify1' id='sample.stainedSpecify1'>${applicationForm?.samples[0]?.stainedSpecify}</textarea>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="sample.specialRequirements1">Any special requirements (labelling or cutting process)</label>
                        <textarea rows="4" cols="50" type='text' name='sample.specialRequirements1' id='sample.specialRequirements1'>${applicationForm?.samples[0]?.specialRequirements}</textarea>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row" id="sample2">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="timePoint2">Timepoint</label><br>
                        <g:select name="timePoint2" id="timePoint2"  from="['Screening', 'Disease progression', 'End of study']" value="${applicationForm?.samples[1]?.timePoint}" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sampleSampleFor2">What is this sample for?</label><br>
                        <g:select name="sample.sampleFor2" id="sampleSampleFor2"  from="['Eligibility/randomisation', 'Primary or secondary outcomes', 'Exploratory outcome only']" value="${applicationForm?.samples[1]?.sampleFor}" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sample.sampleType2">What is required?</label><br>
                        <g:select name="sample.sampleType2" id="sampleSampleType2" onChange="unstainedSection2()" from="['Unstained sections', 'Study samples that need processing and embedding, to turn it into a FFPE block', 'Archival block']" value="${applicationForm?.samples[1]?.sampleType}" noSelection="['':'']" style="width:440px;height:30px;"/>
                    </div>
                </div>
            </div>
            <p style="color: blue" id="archivalNote2">If the study accepts sections or a block, please select unstained sections instead.  If having the block is imperative to the study, then extra consent may be needed if the study consent form does not adequately state the risks of blocks no longer being in the archive.</p>
            <div class="row" id="unstainedSections2">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sampleSlideNumber2">Number of sections</label><br>
                        <input type='text' name='sample.slideNumber2' id='sampleSlideNumber2' value="${applicationForm?.samples[1]?.slideNumber}">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sample.slideThickness2">Thickness of sections</label><br>
                        <input type='text' name='sample.slideThickness2' id='sample.slideThickness2' value="${applicationForm?.samples[1]?.slideThickness}">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sample.slideType2">Type of slide</label><br>
                        <g:select name="sample.slideType2" id="sample.slideType2" from="['Charged', 'Uncharged']" value="${applicationForm?.samples[1]?.slideType}" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="sample.stained2">Do any need to be stained?</label><br>
                        <g:select name="sample.stained2" id="sampleStained2" from="['Yes', 'No']" value="${applicationForm?.samples[1]?.stained}" onchange="showStainedSpecify2Display()" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6" id="stainedSpecify2Display">
                    <div class="form-group">
                        <label for="sample.stainedSpecify2">Please specify staining</label><br>
                        <textarea rows="4" cols="50" type='text' name='sample.stainedSpecify2' id='sample.stainedSpecify2'>${applicationForm?.samples[1]?.stainedSpecify}</textarea>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="sample.specialRequirements2">Any special requirements (labelling or cleaning process)</label>
                        <textarea rows="4" cols="50" type='text' name='sample.specialRequirements2' id='sample.specialRequirements2'>${applicationForm?.samples[1]?.specialRequirements}</textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header"><b>How will material be used?</b>  (How will you use the materials requested in this application? For trials: include whether it is for screening (eligibility assessment), primary or secondary outcome measures, and/ or exploratory objectives?)</div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <br>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <textarea rows="4" cols="50" type='text' name='howMaterialUsed' id='howMaterialUsed' readonly>${applicationForm?.howMaterialUsed}</textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header"><b>Data requirements</b>  (Specify any accompanying data you require e.g. copy of pathology reports)</div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <br>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="dataRequirements">Please select</label><br>
                        <g:select name="dataRequirements" id="dataRequirements" from="['Pathology Report', 'None', 'Other']" onchange="showDataRequirementsOtherDisplay()" value="${applicationForm?.dataRequirements}" noSelection="['':'']" style="width:180px;height:30px;"/>
                    </div>
                </div>
                <div class="col-lg-6" id="dataRequirementsOtherDisplay">
                    <div class="form-group">
                        <label for="dataRequirementsOther">Please specify</label><br>
                        <input type='text' readonly size="25" name='dataRequirementsOther' id='dataRequirementsOther'>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header"><b>Is there a clinical trial specific form that we or the pathologist have to complete?</b></div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <br>
            <div class="row">
                <g:if test="${applicationForm?.clinicalTrialForm}">
                    <div class="col-lg-12">
                        <label for="clinicalTrialForm">Copy of Clinical Trial Specific Form</label><br>
                        <g:link style="color:blue" action="download" id="${applicationForm?.id}" params="[docomentType: 'clinicalTrialForm']">${applicationForm?.clinicalTrialForm?.toString()?.split('_')?.last()}</g:link>
                    </div>
                </g:if>
                <g:else>
                    <div class="col-lg-12">
                        <label>No</label><br>
                    </div>
                </g:else>
            </div>
        </div>
    </div>
    <br>
    <div class="card">
        <div class="card-header"><b>Terms and Conditions</b></div>
        <div class="card-block p-0" style="margin: auto;width: 50%">
            <br>
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="terms"> I agree with the <a href="${assetPath(src: 't&cv3.pdf')}" target="_blank">T&C </a></label>
                        <g:checkBox name="myCheckbox" value="${applicationForm?.terms}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </g:uploadForm>
    </div>
    </div>
    <br>
    <br>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript">
        shippingHide();
        unstainedSection1();
        unstainedSection2();
        hideSample2();
        function shippingShow(){
            $("#shipping").show();
            document.getElementById("shippingDetails.jobTitle").required = true;
            document.getElementById("shippingDetails.name").required = true;
            document.getElementById("shippingDetails.workAddress").required = true;
            document.getElementById("shippingDetails.telephoneNumber").required = true;
            document.getElementById("shippingDetails.emailAddress").required = true;

        }
        function shippingHide(){
            $("#shipping").hide();
            document.getElementById("shippingDetails.jobTitle").required = false;
            document.getElementById("shippingDetails.name").required = false;
            document.getElementById("shippingDetails.workAddress").required = false;
            document.getElementById("shippingDetails.telephoneNumber").required = false;
            document.getElementById("shippingDetails.emailAddress").required = false;
        }
        function unstainedSection1(){
            if ($("#sampleSampleType1").val() == 'Unstained sections' ){
                $("#unstainedSections1").show();
                document.getElementById("sample.slideNumber1").required = true;
                document.getElementById("sample.slideThickness1").required = true;
                document.getElementById("sample.slideType1").required = true;
                document.getElementById("sampleStained1").required = true;
                $("#archivalNote1").hide()
            }else if($("#sampleSampleType1").val() == 'Archival block'){
                $("#unstainedSections1").hide();
                $("#archivalNote1").show();
                document.getElementById("sample.slideNumber1").required = false;
                document.getElementById("sample.slideThickness1").required = false;
                document.getElementById("sample.slideType1").required = false;
                document.getElementById("sampleStained1").required = false;
            }else{
                $("#unstainedSections1").hide();
                $("#archivalNote1").hide();
                document.getElementById("sample.slideNumber1").required = false;
                document.getElementById("sample.slideThickness1").required = false;
                document.getElementById("sample.slideType1").required = false;
                document.getElementById("sampleStained1").required = false;
            }
        }
        registrationOnPortfolioNameShow();
        function registrationOnPortfolioNameShow(){
            if ($("#registrationOnPortfolio").val() == 'Registered to a portfolio' ){
                $("#registrationOnPortfolioNameSection").show();
                document.getElementById("registrationOnPortfolioName").required = true;
            }else{
                $("#registrationOnPortfolioNameSection").hide();
                document.getElementById("registrationOnPortfolioName").required = false;
            }
        }
        nhsPathologistShow();
        function nhsPathologistShow(){
            if ($("#nHSPathologist").val() == 'Yes' ){
                $("#nHSPathologistName").show();
                document.getElementById("pathologistName").required = true;
            }else{
                $("#nHSPathologistName").hide();
                document.getElementById("pathologistName").required = false;
            }
        }
        function unstainedSection2(){
            if ($("#sampleSampleType2").val() == 'Unstained sections' ){
                $("#unstainedSections2").show();
                document.getElementById("sampleSlideNumber2").required = true;
                document.getElementById("sample.slideThickness2").required = true;
                document.getElementById("sample.slideType2").required = true;
                document.getElementById("sampleStained2").required = true;
                $("#archivalNote2").hide();
            }else if($("#sampleSampleType2").val() == 'Archival block'){
                $("#unstainedSections2").hide();
                $("#archivalNote2").show();
                document.getElementById("sampleSlideNumber2").required = false;
                document.getElementById("sample.slideThickness2").required = false;
                document.getElementById("sample.slideType2").required = false;
                document.getElementById("sampleStained2").required = false;
            }else{
                $("#unstainedSections2").hide();
                $("#archivalNote2").hide();
                document.getElementById("sampleSlideNumber2").required = false;
                document.getElementById("sample.slideThickness2").required = false;
                document.getElementById("sample.slideType2").required = false;
                document.getElementById("sampleStained2").required = false;
            }
        }
        if ($("#timePoint2").val()){
            showSample2()
        }
        function showSample2(){
            $("#sample2").show();
            $("#stainedSpecify2Display").hide()
        }
        function hideSample2(){
            $("#sample2").hide();
            document.getElementById("timePoint2").required = false;
            document.getElementById("sampleSampleType2").required = false;
            document.getElementById("sampleSampleFor2").required = false;
            document.getElementById("sampleSlideNumber2").required = false;
            document.getElementById("sample.slideThickness2").required = false;
            document.getElementById("sample.slideType2").required = false;
            document.getElementById("sampleStained2").required = false;
        }
        showCompanyName();
        function showCompanyName(){
            if ($("#researchFunderSelection").val()  == 'Commercial'){
                $("#companyNameDisplay").show();
                document.getElementById("companyName").required = true;

            }else{
                $("#companyNameDisplay").hide();
                document.getElementById("companyName").required = false;
            }
        }
        showDataRequirementsOtherDisplay();
        function showDataRequirementsOtherDisplay(){
            if ($("#dataRequirements").val()  == 'Other'){
                $("#dataRequirementsOtherDisplay").show();
                document.getElementById("dataRequirementsOther").required = true;
            }else{
                $("#dataRequirementsOtherDisplay").hide();
                document.getElementById("dataRequirementsOther").required = false;
            }
        }
        showStainedSpecify1Display();
        function showStainedSpecify1Display(){
            if ($("#sampleStained1").val()  == 'Yes'){
                $("#stainedSpecify1Display").show();
                document.getElementById("sample.stainedSpecify1").required = true;
            }else{
                $("#stainedSpecify1Display").hide();
                document.getElementById("sample.stainedSpecify1").required = false;
            }
        }
        showStainedSpecify2Display();
        function showStainedSpecify2Display(){
            if ($("#sampleStained2").val()  == 'Yes'){
                $("#stainedSpecify2Display").show();
                document.getElementById("sample.stainedSpecify2").required = true;
            }else{
                $("#stainedSpecify2Display").hide();
                document.getElementById("sample.stainedSpecify2").required = false;
            }
        }
        showMTAOrCTA();
        function showMTAOrCTA(){
            if ($("#mTAArranged").val()  == 'No Needed'){
                $("#mTAOrCTA").hide();
                document.getElementById("mTAOrCTA1").required = false;
                document.getElementById("mTAOrCTAComplete").required = false;
            }else{
                $("#mTAOrCTA").show();
                document.getElementById("mTAOrCTA1").required = true;
                document.getElementById("mTAOrCTAComplete").required = true;
            }
        }
        showOtherLabel();
        function showOtherLabel(){
            if ($("#randDApprovalOrganisation").val()  == 'Other'){
                $("#otherInformation").hide();
                $("#otherInformationMan").show();
                document.getElementById("randDApprovalOtherInformation").required = true;
            }else{
                $("#otherInformationMan").hide();
                $("#otherInformation").show();
                document.getElementById("randDApprovalOtherInformation").required = false;
            }
        }
        var countEthicalApprovalLetter = 2;
        setupEthicalApprovalLetter();
        function setupEthicalApprovalLetter(){
            var i;
            for (i = countEthicalApprovalLetter; i < 6; i ++) {
                $("#showEthicalApprovalLetter"+i).hide();
                $("#hideEthicalApprovalLetter"+i).hide();
                document.getElementById("ethicalApprovalLetter"+i).required = false;
            }
        }
        function showEthicalApprovalLetterFunction(){
            $("#showEthicalApprovalLetter"+countEthicalApprovalLetter).show();
            document.getElementById("ethicalApprovalLetter"+countEthicalApprovalLetter).required = true;
            $("#hideEthicalApprovalLetter"+countEthicalApprovalLetter).show();
            if(countEthicalApprovalLetter >5){
                countEthicalApprovalLetter = 5
            }
            countEthicalApprovalLetter++;
        }
        function hideEthicalApprovalLetterFunction(){
            countEthicalApprovalLetter--;
            $("#showEthicalApprovalLetter"+countEthicalApprovalLetter).hide();
            document.getElementById("ethicalApprovalLetter"+countEthicalApprovalLetter).required = false;
            $("#hideEthicalApprovalLetter"+countEthicalApprovalLetter).hide();
            if(countEthicalApprovalLetter < 2){
                countEthicalApprovalLetter = 2
            }

        }
        var countConsentForUseInResearchForm = 2;
        setupConsentForUseInResearchForm();
        function setupConsentForUseInResearchForm(){
            var i;
            for (i = countConsentForUseInResearchForm; i < 6; i ++) {
                $("#showConsentForUseInResearchForm"+i).hide();
                $("#hideConsentForUseInResearchForm"+i).hide();
                document.getElementById("consentForUseInResearchForm"+i).required = false;
            }
        }
        function showConsentForUseInResearchFormFunction(){
            $("#showConsentForUseInResearchForm"+countConsentForUseInResearchForm).show();
            document.getElementById("consentForUseInResearchForm"+countConsentForUseInResearchForm).required = true;
            $("#hideConsentForUseInResearchForm"+countConsentForUseInResearchForm).show();
            if(countConsentForUseInResearchForm >5){
                countConsentForUseInResearchForm = 5
            }
            countConsentForUseInResearchForm++;
        }
        function hideConsentForUseInResearchFormFunction(){
            countConsentForUseInResearchForm--;
            $("#showConsentForUseInResearchForm"+countConsentForUseInResearchForm).hide();
            document.getElementById("consentForUseInResearchForm"+countConsentForUseInResearchForm).required = false;
            $("#hideConsentForUseInResearchForm"+countConsentForUseInResearchForm).hide();
            if(countConsentForUseInResearchForm < 2){
                countConsentForUseInResearchForm = 2
            }
        }
        var countMTAOrCTA = 2;
        setupMTAOrCTA();
        function setupMTAOrCTA(){
            var i;
            for (i = countMTAOrCTA; i < 6; i ++) {
                $("#showMTAOrCTA"+i).hide();
                $("#hideMTAOrCTA"+i).hide();
                document.getElementById("mTAOrCTA"+i).required = false;
            }
        }
        function showMTAOrCTAFunction(){
            $("#showMTAOrCTA"+countMTAOrCTA).show();
            document.getElementById("mTAOrCTA"+countMTAOrCTA).required = true;
            $("#hideMTAOrCTA"+countMTAOrCTA).show();
            if(countMTAOrCTA >5){
                countMTAOrCTA = 5
            }
            countMTAOrCTA++;
        }
        function hideMTAOrCTAFunction(){
            countMTAOrCTA--;
            $("#showMTAOrCTA"+countMTAOrCTA).hide();
            document.getElementById("mTAOrCTA"+countMTAOrCTA).required = false;
            $("#hideMTAOrCTA"+countMTAOrCTA).hide();
            if(countMTAOrCTA < 2){
                countMTAOrCTA = 2
            }
        }
        function ethicalApprovalLetterPending(){
            document.getElementById("ethicalApprovalLetter1").required = false;
        }
        function ethicalApprovalLetterCompleteFunction(){
            document.getElementById("ethicalApprovalLetter1").required = true;
        }
        function consentForUseInResearchFormPending(){
            document.getElementById("consentForUseInResearchForm1").required = false;
        }
        function consentForUseInResearchFormCompleteFunction(){
            document.getElementById("consentForUseInResearchForm1").required = true;
        }
        function mTAOrCTAPending(){
            document.getElementById("mTAOrCTA1").required = false;
        }
        function mTAOrCTACompleteFunction(){
            document.getElementById("mTAOrCTA1").required = true;
        }
    </script>
    </body>
</html>
