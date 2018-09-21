
<!doctype html>
<html lang="en">
<head>
    <title>OCHRe Application</title>
    <meta  charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <asset:stylesheet src="smart_wizard_theme_arrows.css"/>
    <asset:stylesheet src="smart_wizard.css"/>
</head>
<body>
%{--<a href="#create-applicationForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<br>
<g:if test="${applicationForm}">
    <h2><center>Application ${applicationForm.id}</center></h2>
</g:if>
<g:else>
    <h2><center>New Application</center></h2>
</g:else>
<br>
<div class="container">
<!-- External toolbar sample -->
%{--<form action="#" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">--}%

<!-- SmartWizard html -->
<div id="smartwizard">
<ul>
    <li><a href="#step-1">Section 1<br /><small>Applicant details</small></a></li>
    <li><a href="#step-2">Section 2<br /><small>Funding details</small></a></li>
    <li><a href="#step-3">Section 3<br /><small>Approval details</small></a></li>
    <li><a href="#step-4">Section 4<br /><small>Project details</small></a></li>
    <li><a href="#step-5">Section 5<br /><small>Samples, service and data</small></a></li>
</ul>

<div>
<div id="step-1">
    <g:form action="saveForm" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
    <div id="form-step-0" role="form" data-toggle="validator">
            <h3 class="border-bottom border-gray pb-2">Section 1 Applicant details</h3>
            <div class="card">
                <div class="card-header"><b>Lead applicant</b> (e.g. Head of Department or Group, or clinical trial PI)</div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="leadApplicant.jobTitle">Title <span style="color: red">*</span></label><br>
                                <input type='text' name='leadApplicant.jobTitle' id='leadApplicant.jobTitle' value="${applicationForm?.leadApplicant?.jobTitle}" placeholder='Enter Title' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="leadApplicant.familyName">Family Name <span style="color: red">*</span></label><br>
                                <input type='text' name='leadApplicant.familyName' id='leadApplicant.familyName' value="${applicationForm?.leadApplicant?.familyName}" placeholder='Enter Family Name' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="leadApplicant.firstName">First Name <span style="color: red">*</span></label><br>
                                <input type='text' name='leadApplicant.firstName' id='leadApplicant.firstName' value="${applicationForm?.leadApplicant?.firstName}" placeholder='Enter First Name' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="leadApplicant.firstName">Work Address <span style="color: red">*</span></label><br>
                                <textarea name='leadApplicant.workAddress' id='leadApplicant.workAddress' placeholder='Enter Work Address' required>${applicationForm?.leadApplicant?.workAddress}</textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="leadApplicant.telephoneNumber">Telephone Number <span style="color: red">*</span></label><br>
                                <input type='text' name='leadApplicant.telephoneNumber' id='leadApplicant.telephoneNumber' value="${applicationForm?.leadApplicant?.telephoneNumber}" placeholder='Enter Telephone Number' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="leadApplicant.emailAddress">Email Address <span style="color: red">*</span></label><br>
                                <input type='text' name='leadApplicant.emailAddress' id='leadApplicant.emailAddress' value="${applicationForm?.leadApplicant?.emailAddress}" placeholder='Enter Email Address' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-header"><b>Contact person</b> (i.e. the person who will coordinate the request(s) with OCHRe)</div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPerson.jobTitle">Title <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPerson.jobTitle' id='contactPerson.jobTitle' value="${applicationForm?.contactPerson?.jobTitle}" placeholder='Enter Title' required="">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPerson.familyName">Family Name <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPerson.familyName' id='contactPerson.familyName' value="${applicationForm?.contactPerson?.familyName}" placeholder='Enter Family Name' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPerson.firstName">First Name <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPerson.firstName' id='contactPerson.firstName' value="${applicationForm?.contactPerson?.firstName}" placeholder='Enter First Name' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPerson.workAddress">Work Address <span style="color: red">*</span></label><br>
                                <textarea name='contactPerson.workAddress' id='contactPerson.workAddress' placeholder='Enter Work Address' required>${applicationForm?.contactPerson?.workAddress}</textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPerson.telephoneNumber">Telephone Number <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPerson.telephoneNumber' id='contactPerson.telephoneNumber' value="${applicationForm?.contactPerson?.telephoneNumber}" placeholder='Enter Telephone Number' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPerson.emailAddress">Email Address <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPerson.emailAddress' id='contactPerson.emailAddress' value="${applicationForm?.contactPerson?.emailAddress}" placeholder='Enter Email Address' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label>Is shipping details different from above? <span style="color: red">*</span></label><br>
                                <input type="radio" name="shippingDetailsSame" value="yes" onclick="shippingShow()" required> Yes
                                <input type="radio" name="shippingDetailsSame" onclick="shippingHide()" value="no"> No
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="card" id="shipping">
                <div class="card-header"><b>Shipping Details</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="shippingDetails.jobTitle">Title <span style="color: red">*</span></label><br>
                                <input type='text' name='shippingDetails.jobTitle' id='shippingDetails.jobTitle' value="${applicationForm?.shippingDetails?.jobTitle}" placeholder='Enter Title'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="shippingDetails.familyName">Family Name <span style="color: red">*</span></label><br>
                                <input type='text' name='shippingDetails.familyName' id='shippingDetails.familyName' value="${applicationForm?.shippingDetails?.familyName}" placeholder='Enter Family Name'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="shippingDetails.firstName">First Name <span style="color: red">*</span></label><br>
                                <input type='text' name='shippingDetails.firstName' id='shippingDetails.firstName' value="${applicationForm?.shippingDetails?.firstName}" placeholder='Enter First Name'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="shippingDetails.workAddress">Work Address <span style="color: red">*</span></label><br>
                                <textarea name='shippingDetails.workAddress' id='shippingDetails.workAddress' placeholder='Enter Work Address'>${applicationForm?.shippingDetails?.workAddress}</textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="shippingDetails.telephoneNumber">Telephone Number <span style="color: red">*</span></label><br>
                                <input type='text' name='shippingDetails.telephoneNumber' id='shippingDetails.telephoneNumber' value="${applicationForm?.shippingDetails?.telephoneNumber}" placeholder='Enter Telephone Number'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="shippingDetails.emailAddress">Email Address <span style="color: red">*</span></label><br>
                                <input type='text' name='shippingDetails.emailAddress' id='shippingDetails.emailAddress' value="${applicationForm?.shippingDetails?.emailAddress}" placeholder='Enter Email Address'>
                                <div class="help-block with-errors"></div>
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
            <h3 class="border-bottom border-gray pb-2">Section 2 Funding details</h3>
            <div class="card">
                <div class="card-header"><b>Research funder </b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="researchFunder">Please select <span style="color: red">*</span></label><br>
                                <g:select name="researchFunder" id="researchFunderSelection" from="['Commercial', 'NHS', 'University']" onChange="showCompanyName()" value="${applicationForm?.researchFunder}" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="companyNameDisplay">
                            <div class="form-group">
                                <label for="companyName">Company Name <span style="color: red">*</span></label><br>
                                <input type='text' name='companyName' id='companyName' value="${applicationForm?.companyName}" placeholder='Enter Company Name'>
                                <div class="help-block with-errors"></div>
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
                                <label for="contactPersonQuotationFunding.jobTitle">Title <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPersonQuotationFunding.jobTitle' id='contactPersonQuotationFunding.jobTitle' value="${applicationForm?.contactPersonQuotationFunding?.jobTitle}" placeholder='Enter Title' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPersonQuotationFunding.familyName">Family Name <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPersonQuotationFunding.familyName' id='contactPersonQuotationFunding.familyName' value="${applicationForm?.contactPersonQuotationFunding?.familyName}" placeholder='Enter Family Name' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPersonQuotationFunding.firstName">First Name <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPersonQuotationFunding.firstName' id='contactPersonQuotationFunding.firstName' value="${applicationForm?.contactPersonQuotationFunding?.firstName}" placeholder='Enter First Name' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPersonQuotationFunding.firstName">Work Address <span style="color: red">*</span></label><br>
                                <textarea name='contactPersonQuotationFunding.workAddress' id='contactPersonQuotationFunding.workAddress' placeholder='Enter Work Address' required>${applicationForm?.contactPersonQuotationFunding?.workAddress}</textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPersonQuotationFunding.telephoneNumber">Telephone Number <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPersonQuotationFunding.telephoneNumber' id='contactPersonQuotationFunding.telephoneNumber' value="${applicationForm?.contactPersonQuotationFunding?.telephoneNumber}" placeholder='Enter Telephone Number' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPersonQuotationFunding.emailAddress">Email Address <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPersonQuotationFunding.emailAddress' id='contactPersonQuotationFunding.emailAddress' value="${applicationForm?.contactPersonQuotationFunding?.emailAddress}" placeholder='Enter Email Address' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <g:hiddenField name="stepNumber" value="2"/>
        <g:hiddenField name="applicationFormId" value="${applicationForm?.id}"/>
    </g:form>
</div>
<div id="step-3">
    <g:uploadForm action="saveForm" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
        <div id="form-step-2" role="form" data-toggle="validator">
            <h3 class="border-bottom border-gray pb-2">Section 3 Approval details</h3>
            <div class="card">
                <div class="card-header"><b>Ethical approval details</b> </div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <g:if test="${applicationForm?.ethicalApproval?.letter}">
                            <div class="col-lg-12">
                                <label for="ethicalApprovalLetter">Copy of the approval letter <span style="color: red">*</span></label><br>
                                <label>${applicationForm?.ethicalApproval?.letter?.toString()?.split('_')?.last()}</label>
                                %{--<g:link action="download" id="${applicationForm?.ethicalApproval?.id}"> <a class="btn btn-danger btn-xs" href="#" onclick="showDeleteModal()"><i class="glyphicon glyphicon-trash"></i> Delete Letter & Reload</a></g:link>--}%
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="ethicalApprovalLetter">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='ethicalApprovalLetter' id='ethicalApprovalLetter' required>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        </g:else>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="ethicalApproval.referenceNo">Reference No <span style="color: red">*</span></label><br>
                                <input type='text' name='ethicalApproval.referenceNo' id='ethicalApproval.referenceNo' value="${applicationForm?.ethicalApproval?.referenceNo}" placeholder='Enter Reference No' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="ethicalApproval.title">Title <span style="color: red">*</span></label><br>
                                <input type='text' name='ethicalApproval.title' id='ethicalApproval.title' value="${applicationForm?.ethicalApproval?.title}" placeholder='Enter Title' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="ethicalApproval.startDate">Approval Date <span style="color: red">*</span></label><br>
                                <input type='date' name='ethicalApproval.startDate' id='ethicalApproval.startDate' value="${applicationForm?.ethicalApproval?.startDate?.toString()?.substring(0,10)}" placeholder='Enter Approval Date' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="ethicalApproval.expiryDate">Expiry Date</label><br>
                                <input type='date' name='ethicalApproval.expiryDate' id='ethicalApproval.expiryDate' value="${applicationForm?.ethicalApproval?.expiryDate?.toString()?.substring(0,10)}" placeholder='Enter Expiry Date'>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-header"><b>Consent for use of data/tissues in research</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <g:if test="${applicationForm?.consentForUseInResearch?.form}">
                            <div class="col-lg-12">
                                <label for="consentForUseInResearchForm">Copy of the consent form <span style="color: red">*</span></label><br>
                                <label>${applicationForm?.consentForUseInResearch?.form?.toString()?.split('_')?.last()}</label>
                                %{--<g:link action="download" id="${applicationForm?.ethicalApproval?.id}"> <a class="btn btn-danger btn-xs" href="#" onclick="showDeleteModal()"><i class="glyphicon glyphicon-trash"></i> Delete Letter & Reload</a></g:link>--}%
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="consentForUseInResearchForm">Please attach a copy of the consent form <span style="color: red">*</span></label><br>
                                    <input type='file' name='consentForUseInResearchForm' id='consentForUseInResearchForm' required>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        </g:else>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="consentForUseInResearch.formType">Form type <span style="color: red">*</span></label>
                                <g:select name="consentForUseInResearch.formType" from="['RTB consent form', 'NHS consent form', 'Study-specific consent form', 'Exempt']" value="${applicationForm?.consentForUseInResearch?.formType}" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-header"><b>R&D approval details</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <g:if test="${applicationForm?.randDApproval?.letter}">
                            <div class="col-lg-12">
                                <label for="consentForUseInResearchForm">Copy of the approval letter  <span style="color: red">*</span></label><br>
                                <label>${applicationForm?.randDApproval?.letter?.toString()?.split('_')?.last()}</label>
                                %{--<g:link action="download" id="${applicationForm?.ethicalApproval?.id}"> <a class="btn btn-danger btn-xs" href="#" onclick="showDeleteModal()"><i class="glyphicon glyphicon-trash"></i> Delete Letter & Reload</a></g:link>--}%
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="randDApprovalLetter">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='randDApprovalLetter' id='randDApprovalLetter' required>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        </g:else>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="randDApproval.bodyName">Approval Body <span style="color: red">*</span></label>
                                <input type='text' name='randDApproval.bodyName' id='randDApproval.bodyName' value="${applicationForm?.randDApproval?.bodyName}" placeholder='Enter Approval Body' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="randDApproval.referenceNo">Reference No <span style="color: red">*</span></label>
                                <input type='text' name='randDApproval.referenceNo' id='randDApproval.referenceNo' value="${applicationForm?.randDApproval?.referenceNo}" placeholder='Enter Reference No' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <p>
                                <label for="randDApproval.otherInformation">Other Information</label>
                                <textarea rows="4" cols="50" type='text' name='randDApproval.otherInformation' id='randDApproval.otherInformation' placeholder='Enter Other Information'>${applicationForm?.randDApproval?.otherInformation}</textarea>
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
                                <label for="registrationOnPortfolioName">Name of portfolio <span style="color: red">*</span></label><br>
                                <input type='text' name='registrationOnPortfolioName' id='registrationOnPortfolioName' value="${applicationForm?.registrationOnPortfolioName}" placeholder='Enter Name of portfolio' required>
                                <div class="help-block with-errors"></div>
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
                                <label for="sponsorOrganisation">Organisation <span style="color: red">*</span></label><br>
                                <input type='text' name='sponsorOrganisation' id='sponsorOrganisation' value="${applicationForm?.sponsorOrganisation}" placeholder='Enter Organisation' required>
                                <div class="help-block with-errors"></div>
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
                                <label for="mTAArranged">Please select <span style="color: red">*</span></label><br>
                                <g:select name="mTAArranged" id="mTAArranged" from="['Yes', 'No Needed', 'Within CTA']" value="${applicationForm?.mTAArranged}" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <g:if test="${applicationForm?.mTAOrCTA}">
                            <div class="col-lg-12">
                                <label for="consentForUseInResearchForm">Copy of the MTA or CTA <span style="color: red">*</span></label><br>
                                <label>${applicationForm?.mTAOrCTA?.toString()?.split('_')?.last()}</label>
                                %{--<g:link action="download" id="${applicationForm?.ethicalApproval?.id}"> <a class="btn btn-danger btn-xs" href="#" onclick="showDeleteModal()"><i class="glyphicon glyphicon-trash"></i> Delete Letter & Reload</a></g:link>--}%
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <label for="mTAOrCTA">Please attach a copy of the MTA or CTA <span style="color: red">*</span></label><br>
                                    <input type='file' name='mTAOrCTA' id='mTAOrCTA' required="">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
        <g:hiddenField name="stepNumber" value="3"/>
        <g:hiddenField name="applicationFormId" value="${applicationForm?.id}"/>
    </g:uploadForm>
</div>
<div id="step-4">
    <g:form action="saveForm" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
        <div id="form-step-3" role="form" data-toggle="validator">
            <h3 class="border-bottom border-gray pb-2">Section 4 Project details</h3>
            <div class="card">
                <div class="card-header"><b>Trial Details</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="trial.trialTitle">Trial title <span style="color: red">*</span></label>
                                <input type='text' name='trial.trialTitle' id='trial.trialTitle' value="${applicationForm?.trial?.trialTitle}" placeholder='Enter Trial title' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="trial.expectedDuration">Expected duration <span style="color: red">*</span></label>
                                <input type='text' name='trial.expectedDuration' id='trial.expectedDuration' value="${applicationForm?.trial?.expectedDuration}" placeholder='Enter Expected duration' required>
                                <div class="help-block with-errors"></div>
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
                                <textarea rows="4" cols="50" type='text' name='trial.laySummary' id='trial.laySummary' placeholder=''>${applicationForm?.trial?.laySummary}</textarea>
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
                                <label for="trial.nHSPathologist">Please select <span style="color: red">*</span></label><br>
                                <g:select name="trial.nHSPathologist" from="['Yes', 'No']" value="${applicationForm?.trial?.nHSPathologist}" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <g:hiddenField name="stepNumber" value="4"/>
        <g:hiddenField name="applicationFormId" value="${applicationForm?.id}"/>
    </g:form>
</div>
<div id="step-5">
    <g:uploadForm action="saveForm" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
        <div id="form-step-4" role="form" data-toggle="validator">
            <h3 class="border-bottom border-gray pb-2">Section 5 Samples, service and data</h3>
            <div class="card">
                <div class="card-header"><b>Please identify every sample that the study requires (per patient)</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="timePoint">Timepoint <span style="color: red">*</span></label><br>
                                <g:select name="timePoint" id="timePoint"  from="['Screening', 'Disease progression', 'End of study']" value="${applicationForm?.timePoint}" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="sample1">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sampleSampleType1">What is required? <span style="color: red">*</span></label><br>
                                <g:select name="sample.sampleType1" id="sampleSampleType1" onChange="unstainedSection1()" from="['Unstained sections', 'Study samples that need processing and embedding, to turn it into a FFPE block', 'Archival block']" noSelection="['':'']" style="width:440px;height:30px;"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="unstainedSections1">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideNumber1">Number of sections <span style="color: red">*</span></label><br>
                                <input type='text' name='sample.slideNumber1' id='sample.slideNumber1' placeholder='Enter number of sections'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideThickness1">Thickness of sections <span style="color: red">*</span> </label><br>
                                <input type='text' name='sample.slideThickness1' id='sample.slideThickness1' placeholder='Enter thickness of sections'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideType1">Type of slide <span style="color: red">*</span></label><br>
                                <g:select name="sample.slideType1" id="sample.slideType1" from="['Charged', 'Uncharged']" noSelection="['':'']" style="width:180px;height:30px;"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.stained1">Do any need to be stained? <span style="color: red">*</span></label><br>
                                <g:select name="sample.stained1" id="sampleStained1" from="['Yes', 'No']" onchange="showStainedSpecify1Display()" noSelection="['':'']" style="width:180px;height:30px;"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="stainedSpecify1Display">
                            <div class="form-group">
                                <label for="sample.stainedSpecify1">Please specify <span style="color: red">*</span></label><br>
                                <textarea rows="4" cols="50" type='text' name='sample.stainedSpecify1' id='sample.stainedSpecify1' placeholder=''></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="sample.specialRequirements1">Any special requirements (labelling or cutting process)</label>
                                <textarea rows="4" cols="50" type='text' name='sample.specialRequirements1' id='sample.specialRequirements1' placeholder=''></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row" id="sample2">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.sampleType2">What is required? <span style="color: red">*</span></label><br>
                                <g:select name="sample.sampleType2" id="sampleSampleType2" onChange="unstainedSection2()" from="['Unstained sections', 'Study samples that need processing and embedding, to turn it into a FFPE block', 'Archival block']" value="" noSelection="['':'']" style="width:440px;height:30px;"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="unstainedSections2">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sampleSlideNumber2">Number of sections <span style="color: red">*</span></label><br>
                                <input type='text' name='sample.slideNumber2' id='sampleSlideNumber2' placeholder='Enter number of sections'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideThickness2">Thickness of sections <span style="color: red">*</span> </label><br>
                                <input type='text' name='sample.slideThickness2' id='sample.slideThickness2' placeholder='Enter thickness of sections'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideType2">Type of slide <span style="color: red">*</span></label><br>
                                <g:select name="sample.slideType2" id="sample.slideType2" from="['Charged', 'Uncharged']" noSelection="['':'']" style="width:180px;height:30px;"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.stained2">Do any need to be stained? <span style="color: red">*</span></label><br>
                                <g:select name="sample.stained2" id="sampleStained2" from="['Yes', 'No']" onchange="showStainedSpecify2Display()" noSelection="['':'']" style="width:180px;height:30px;"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="stainedSpecify2Display">
                            <div class="form-group">
                                <label for="sample.stainedSpecify2">Please specify <span style="color: red">*</span></label><br>
                                <textarea rows="4" cols="50" type='text' name='sample.stainedSpecify2' id='sample.stainedSpecify2' placeholder=''></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="sample.specialRequirements2">Any special requirements (labelling or cutting process)</label>
                                <textarea rows="4" cols="50" type='text' name='sample.specialRequirements2' id='sample.specialRequirements2' placeholder=''></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>
                                <label>Please not that you could request multiple samples per timepoint, click on the Add button </label><br>
                                <button class="btn btn-light" type="button" onclick="showSample2()"><i class="fas fa-plus-circle"></i> Add</button>
                            </p>
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
                                <textarea rows="4" cols="50" type='text' name='howMaterialUsed' id='howMaterialUsed' placeholder='' required=""></textarea>
                                <div class="help-block with-errors"></div>
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
                                <label for="dataRequirements">Please select <span style="color: red">*</span></label><br>
                                <g:select name="dataRequirements" id="dataRequirements" from="['Pathology Report', 'None', 'Other']" onchange="showDataRequirementsOtherDisplay()" value="${applicationForm?.dataRequirements}" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="dataRequirementsOtherDisplay">
                            <div class="form-group">
                                <label for="dataRequirementsOther">Please specify <span style="color: red">*</span></label><br>
                                <input type='text' name='dataRequirementsOther' id='dataRequirementsOther'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-header"><b>Is there a clinical trial that we or the pathologist have to complete?</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="clinicalTrialForm">Please attach </label><br>
                                <input type='file' name='clinicalTrialForm' id='clinicalTrialForm'>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
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
                                <label for="terms">I agree with the T&C</label>
                                <input type="checkbox" id="terms" data-error="Please accept the Terms and Conditions" required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <g:hiddenField name="stepNumber" value="5"/>
        <g:hiddenField name="applicationFormId" value="${applicationForm?.id}"/>
    </g:uploadForm>
</div>
</div>
</div>
%{--</form>--}%
</div>

<!-- Include jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Include jQuery Validator plugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.5/validator.min.js"></script>


<!-- Include SmartWizard JavaScript source -->
<asset:javascript src="jquery.smartWizard.min.js"/>

<script type="text/javascript">
    $(document).ready(function(){
        var btnFinish = $('<button></button>').text('Exit Without Save')
                .addClass('btn btn-info')
                .on('click', function(){ window.location = '/OCHRE'});
        var btnSubmit = $('<button></button>').text('Submit')
                .addClass('btn btn-danger')
                .on('click', function(){
                    document.forms[4].submit()
                });
        $("#smartwizard").on("showStep", function(e, anchorObject, stepNumber, stepDirection) {
            // Enable finish button only on last step
            if($('button.sw-btn-next').hasClass('disabled')){
//                $('.sw-btn-group-extra button.btn.btn-success').hide();
                $('.sw-btn-group-extra button.btn.btn-danger').show();
            }else{
                $('.sw-btn-group-extra button.btn.btn-danger').hide();
//                $('.sw-btn-group-extra button.btn.btn-success').show();
            }
        });
        // Smart Wizard
        $('#smartwizard').smartWizard({
            selected: 0,
            theme: 'arrows',
            transitionEffect:'fade',
            toolbarSettings: {toolbarPosition: 'bottom',
                toolbarExtraButtons: [btnSubmit,btnFinish]
            },
            anchorSettings: {
                markDoneStep: true, // add done css
                markAllPreviousStepsAsDone: true, // When a step selected by url hash, all previous steps are marked done
                removeDoneStepOnNavigateBack: false, // While navigate back done step after active step will be cleared
                enableAnchorOnDoneStep: true // Enable/Disable the done steps navigation
            },
            lang: {
                next:'Save & Next'
            }
        });
        $("#smartwizard").on("leaveStep", function(e, anchorObject, stepNumber, stepDirection) {
            var elmForm = $("#form-step-" + stepNumber);
            // stepDirection === 'forward' :- this condition allows to do the form validation
            // only on forward navigation, that makes easy navigation on backwards still do the validation when going next
            if(stepDirection === 'forward' && elmForm){
                elmForm.validator('validate');
                var elmErr = elmForm.find('.has-error');
                if(elmErr && elmErr.length > 0){
                    // Form validation failed
                    return false;
                }else{
                    document.forms[stepNumber].submit()
                }
            }
            return true;
        });

    });
    shippingHide();
    unstainedSection1();
    unstainedSection2();
    hideSample2();
    function shippingShow(){
        $("#shipping").show();
        document.getElementById("shippingDetails.jobTitle").required = true;
        document.getElementById("shippingDetails.familyName").required = true;
        document.getElementById("shippingDetails.firstName").required = true;
        document.getElementById("shippingDetails.workAddress").required = true;
        document.getElementById("shippingDetails.telephoneNumber").required = true;
        document.getElementById("shippingDetails.emailAddress").required = true;

    }
    function shippingHide(){
        $("#shipping").hide();
        document.getElementById("shippingDetails.jobTitle").required = false;
        document.getElementById("shippingDetails.familyName").required = false;
        document.getElementById("shippingDetails.firstName").required = false;
        document.getElementById("shippingDetails.workAddress").required = false;
        document.getElementById("shippingDetails.telephoneNumber").required = false;
        document.getElementById("shippingDetails.emailAddress").required = false;
    }
    function unstainedSection1(){
        if ($("#sampleSampleType1").val() == 'Unstained sections' ){
            $("#unstainedSections1").show()
        }else{
            $("#unstainedSections1").hide()
        }
    }
    function unstainedSection2(){
        if ($("#sampleSampleType2").val() == 'Unstained sections' ){
            $("#unstainedSections2").show()
        }else{
            $("#unstainedSections2").hide()
        }
    }
    function showSample2(){
        $("#sample2").show();
        $("#stainedSpecify2Display").hide()
    }
    function hideSample2(){
        $("#sample2").hide()
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
    function showStainedSpecify2Display(){
        if ($("#sampleStained2").val()  == 'Yes'){
            $("#stainedSpecify2Display").show();
            document.getElementById("sample.stainedSpecify2").required = true;
        }else{
            $("#stainedSpecify2Display").hide();
            document.getElementById("sample.stainedSpecify2").required = false;
        }
    }
</script>
</body>
</html>