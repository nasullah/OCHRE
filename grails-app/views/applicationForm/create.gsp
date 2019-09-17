
<!doctype html>
<html lang="en">
<head>
    <title>OCHRe Application</title>
    <meta  charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <asset:link rel="icon" href="ochre.png" type="image/x-ico" />
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
<div id="nav">
<a class="btn btn-info btn-xs" href="/OCHRE" style="margin-left:20px;">&#171; Back to homepage</a>
<hr>
</div>
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
                                            <label for="leadApplicant.jobTitle">Title <span style="color: red">*</span></label><br>
                                            <input type='text' name='leadApplicant.jobTitle' id='leadApplicant.jobTitle' value="${applicationForm?.leadApplicant?.jobTitle}" placeholder='Enter Title' required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="leadApplicant.name">Name <span style="color: red">*</span></label><br>
                                            <input type='text' name='leadApplicant.name' id='leadApplicant.name' value="${applicationForm?.leadApplicant?.name}" placeholder='Enter Name' required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="leadApplicant.workAddress">Work Address <span style="color: red">*</span></label><br>
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
                                            <input type='email' name='leadApplicant.emailAddress' id='leadApplicant.emailAddress' value="${applicationForm?.leadApplicant?.emailAddress}" placeholder='Enter Email Address' required>
                                            <div class="help-block with-errors"></div>
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
                                            <label for="contactPerson.jobTitle">Title <span style="color: red">*</span></label><br>
                                            <input type='text' name='contactPerson.jobTitle' id='contactPerson.jobTitle' value="${applicationForm?.contactPerson?.jobTitle}" placeholder='Enter Title' required="">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="contactPerson.name">Name <span style="color: red">*</span></label><br>
                                            <input type='text' name='contactPerson.name' id='contactPerson.name' value="${applicationForm?.contactPerson?.name}" placeholder='Enter Name' required>
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
                                            <input type='email' name='contactPerson.emailAddress' id='contactPerson.emailAddress' value="${applicationForm?.contactPerson?.emailAddress}" placeholder='Enter Email Address' required>
                                            <div class="help-block with-errors"></div>
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
                                            <label for="sampleRequestContact.jobTitle">Title <span style="color: red">*</span></label><br>
                                            <input type='text' name='sampleRequestContact.jobTitle' id='sampleRequestContact.jobTitle' value="${applicationForm?.sampleRequestContact?.jobTitle}" placeholder='Enter Title' required="">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="sampleRequestContact.name">Name <span style="color: red">*</span></label><br>
                                            <input type='text' name='sampleRequestContact.name' id='sampleRequestContact.name' value="${applicationForm?.sampleRequestContact?.name}" placeholder='Enter Name' required="">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="sampleRequestContact.workAddress">Work Address <span style="color: red">*</span></label><br>
                                            <textarea name='sampleRequestContact.workAddress' id='sampleRequestContact.workAddress' placeholder='Enter Work Address' required="">${applicationForm?.sampleRequestContact?.workAddress}</textarea>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="sampleRequestContact.telephoneNumber">Telephone Number <span style="color: red">*</span></label><br>
                                            <input type='text' name='sampleRequestContact.telephoneNumber' id='sampleRequestContact.telephoneNumber' value="${applicationForm?.sampleRequestContact?.telephoneNumber}" placeholder='Enter Telephone Number' required="">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="sampleRequestContact.emailAddress">Email Address <span style="color: red">*</span></label><br>
                                            <input type='email' name='sampleRequestContact.emailAddress' id='sampleRequestContact.emailAddress' value="${applicationForm?.sampleRequestContact?.emailAddress}" placeholder='Enter Email Address' required="">
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
                                            <label for="shippingDetails.jobTitle">Title <span style="color: red">*</span></label><br>
                                            <input type='text' name='shippingDetails.jobTitle' id='shippingDetails.jobTitle' value="${applicationForm?.shippingDetails?.jobTitle}" placeholder='Enter Title'>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="shippingDetails.name">Name <span style="color: red">*</span></label><br>
                                            <input type='text' name='shippingDetails.name' id='shippingDetails.name' value="${applicationForm?.shippingDetails?.name}" placeholder='Enter Name'>
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
                                            <input type='email' name='shippingDetails.emailAddress' id='shippingDetails.emailAddress' value="${applicationForm?.shippingDetails?.emailAddress}" placeholder='Enter Email Address'>
                                            <div class="help-block with-errors"></div>
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
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPersonQuotationFunding.name">Name <span style="color: red">*</span></label><br>
                                <input type='text' name='contactPersonQuotationFunding.name' id='contactPersonQuotationFunding.name' value="${applicationForm?.contactPersonQuotationFunding?.name}" placeholder='Enter Name' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contactPersonQuotationFunding.workAddress">Work Address <span style="color: red">*</span></label><br>
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
                                <input type='email' name='contactPersonQuotationFunding.emailAddress' id='contactPersonQuotationFunding.emailAddress' value="${applicationForm?.contactPersonQuotationFunding?.emailAddress}" placeholder='Enter Email Address' required>
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
            <br>
            <h3 class="border-bottom border-gray pb-2">Section 3 Approval details</h3>
            <div class="card">
                <div class="card-header"><b>Ethical approval details</b> </div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <g:if test="${applicationForm?.ethicalApproval}">
                            <div class="col-lg-12">
                                <label for="ethicalApprovalLetter">Copy of the approval letter <span style="color: red">*</span></label><br>
                                %{--<label>${applicationForm?.ethicalApproval?.letter?.toString()?.split('_')?.last()}</label>--}%
                                %{--<g:link action="download" id="${applicationForm?.ethicalApproval?.id}"> <a class="btn btn-danger btn-xs" href="#" onclick="showDeleteModal()"><i class="glyphicon glyphicon-trash"></i> Delete Letter & Reload</a></g:link>--}%
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="ethicalApprovalLetter1">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='ethicalApprovalLetter1' id='ethicalApprovalLetter1' required>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    %{--<label for="ethicalApprovalLetterPending">Pending?</label>--}%
                                    %{--<input type="checkbox" name="ethicalApprovalLetterPending" id="ethicalApprovalLetterPending" onclick="ethicalApprovalLetterFunction()">--}%
                                    %{--<div class="help-block with-errors"></div>--}%
                                    <label for="ethicalApprovalLetterComplete">Have you uploaded all documents?</label><br>
                                    <input type="radio" name="ethicalApprovalLetterComplete" value="Yes" onclick="ethicalApprovalLetterCompleteFunction()" required> Yes
                                    <input type="radio" name="ethicalApprovalLetterComplete" onclick="ethicalApprovalLetterPending()" value="Pending"> Pending
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showEthicalApprovalLetter2">
                                <div class="form-group">
                                    <label for="ethicalApprovalLetter2">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='ethicalApprovalLetter2' id='ethicalApprovalLetter2' required="">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showEthicalApprovalLetter3">
                                <div class="form-group">
                                    <label for="ethicalApprovalLetter3">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='ethicalApprovalLetter3' id='ethicalApprovalLetter3' required="">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showEthicalApprovalLetter4">
                                <div class="form-group">
                                    <label for="ethicalApprovalLetter4">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='ethicalApprovalLetter4' id='ethicalApprovalLetter4' required="">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showEthicalApprovalLetter5">
                                <div class="form-group">
                                    <label for="ethicalApprovalLetter5">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='ethicalApprovalLetter5' id='ethicalApprovalLetter5' required="">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-4" id="hideEthicalApprovalLetter2">
                                <p>
                                    <label>Remove documents </label><br>
                                    <button class="btn btn-light" type="button" onclick="hideEthicalApprovalLetterFunction()"><i class="fas fa-plus-circle"></i> Remove</button>
                                </p>
                            </div>
                            <div class="col-lg-8">
                                <p>
                                    <label>Attach more documents </label><br>
                                    <button class="btn btn-light" type="button" onclick="showEthicalApprovalLetterFunction()"><i class="fas fa-plus-circle"></i> Add</button>
                                </p>
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
                            <div class="col-lg-12">
                                <label for="consentForUseInResearchForm">Copy of the consent form <span style="color: red">*</span></label><br>
                                %{--<label>${applicationForm?.consentForUseInResearch?.form?.toString()?.split('_')?.last()}</label>--}%
                                %{--<g:link action="download" id="${applicationForm?.ethicalApproval?.id}"> <a class="btn btn-danger btn-xs" href="#" onclick="showDeleteModal()"><i class="glyphicon glyphicon-trash"></i> Delete Letter & Reload</a></g:link>--}%
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="consentForUseInResearchForm1">Please attach all copies of consent forms and corresponding PIS’s. <span style="color: red">*</span></label><br>
                                    <input type='file' name='consentForUseInResearchForm1' id='consentForUseInResearchForm1' required>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    %{--<label for="consentForUseInResearchFormPending">Pending?</label>--}%
                                    %{--<input type="checkbox" name="consentForUseInResearchFormPending" id="consentForUseInResearchFormPending" onclick="consentForUseInResearchFormFunction()">--}%
                                    %{--<div class="help-block with-errors"></div>--}%
                                    <label for="consentForUseInResearchFormComplete">Have you uploaded all documents?</label><br>
                                    <input type="radio" name="consentForUseInResearchFormComplete" value="Yes" onclick="consentForUseInResearchFormCompleteFunction()" required> Yes
                                    <input type="radio" name="consentForUseInResearchFormComplete" onclick="consentForUseInResearchFormPending()" value="Pending"> Pending
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showConsentForUseInResearchForm2">
                                <div class="form-group">
                                    <label for="consentForUseInResearchForm2">Please attach all copies of consent forms and corresponding PIS’s. <span style="color: red">*</span></label><br>
                                    <input type='file' name='consentForUseInResearchForm2' id='consentForUseInResearchForm2' required="">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showConsentForUseInResearchForm3">
                                <div class="form-group">
                                    <label for="consentForUseInResearchForm3">Please attach all copies of consent forms and corresponding PIS’s. <span style="color: red">*</span></label><br>
                                    <input type='file' name='consentForUseInResearchForm3' id='consentForUseInResearchForm3' required="">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showConsentForUseInResearchForm4">
                                <div class="form-group">
                                    <label for="consentForUseInResearchForm4">Please attach all copies of consent forms and corresponding PIS’s. <span style="color: red">*</span></label><br>
                                    <input type='file' name='consentForUseInResearchForm4' id='consentForUseInResearchForm4' required="">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showConsentForUseInResearchForm5">
                                <div class="form-group">
                                    <label for="consentForUseInResearchForm5">Please attach all copies of consent forms and corresponding PIS’s. <span style="color: red">*</span></label><br>
                                    <input type='file' name='consentForUseInResearchForm5' id='consentForUseInResearchForm5' required="">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-4" id="hideConsentForUseInResearchForm2">
                                <p>
                                    <label></label><br>
                                    <label>Remove documents </label><br>
                                    <button class="btn btn-light" type="button" onclick="hideConsentForUseInResearchFormFunction()"><i class="fas fa-plus-circle"></i> Remove</button>
                                </p>
                            </div>
                            <div class="col-lg-8">
                                <p>
                                    <label>Attach more documents </label><br>
                                    <button class="btn btn-light" type="button" onclick="showConsentForUseInResearchFormFunction()"><i class="fas fa-plus-circle"></i> Add</button>
                                </p>
                            </div>
                        </g:else>
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
                                <label for="randDApproval.organisation">Organisation<span style="color: red">*</span></label>
                                <g:select name="randDApproval.organisation" id="randDApprovalOrganisation" from="['OUH', 'Other']" value="${applicationForm?.randDApproval?.organisation}" onChange="showOtherLabel()" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="randDApproval.pid">PID <span style="color: red">*</span></label><br>
                                <input type='text' name='randDApproval.pid' id='randDApproval.pid' value="${applicationForm?.randDApproval?.pid}" placeholder='Enter PID' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <p>
                                <label id="otherInformation">Other Information</label>
                                <textarea rows="4" cols="50" type='text' name='randDApproval.otherInformation' id='randDApprovalOtherInformation' placeholder='Enter Other Information'>${applicationForm?.randDApproval?.otherInformation}</textarea>
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
                                <label for="registrationOnPortfolio">Please select <span style="color: red">*</span></label><br>
                                <g:select name="registrationOnPortfolio" id="registrationOnPortfolio" from="['Registered to a portfolio', 'Not registered on a portfolio']" onChange="registrationOnPortfolioNameShow()" value="${applicationForm?.registrationOnPortfolio}" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="registrationOnPortfolioNameSection">
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
                                <g:select name="mTAArranged" id="mTAArranged" from="['Yes', 'No Needed', 'Within CTA']" value="${applicationForm?.mTAArranged}" onChange="showMTAOrCTA()" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="mTAOrCTA">
                        <g:if test="${applicationForm?.mTAOrCTA}">
                            <div class="col-lg-12">
                                <label for="consentForUseInResearchForm">Copy of the MTA or CTA <span style="color: red">*</span></label><br>
                                <label>${applicationForm?.mTAOrCTA?.toString()?.split('_')?.last()}</label>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="mTAOrCTA1">Please attach a copy of the MTA or CTA <span style="color: red">*</span></label><br>
                                    <input type='file' name='mTAOrCTA1' id='mTAOrCTA1'>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    %{--<label for="mTAOrCTAPending">Pending?</label>--}%
                                    %{--<input type="checkbox" name="mTAOrCTAPending" id="mTAOrCTAPending" onclick="mTAOrCTAFunction()">--}%
                                    %{--<div class="help-block with-errors"></div>--}%
                                    <label for="mTAOrCTAComplete">Have you uploaded all documents?</label><br>
                                    <input type="radio" name="mTAOrCTAComplete" id="mTAOrCTAComplete" value="Yes" onclick="mTAOrCTACompleteFunction()" required> Yes
                                    <input type="radio" name="mTAOrCTAComplete" value="Pending" onclick="mTAOrCTAPending()"> Pending
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showMTAOrCTA2">
                                <div class="form-group">
                                    <label for="mTAOrCTA2">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='mTAOrCTA2' id='mTAOrCTA2'>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showMTAOrCTA3">
                                <div class="form-group">
                                    <label for="mTAOrCTA3">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='mTAOrCTA3' id='mTAOrCTA3'>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showMTAOrCTA4">
                                <div class="form-group">
                                    <label for="mTAOrCTA4">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='mTAOrCTA4' id='mTAOrCTA4'>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="showMTAOrCTA5">
                                <div class="form-group">
                                    <label for="mTAOrCTA5">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                    <input type='file' name='mTAOrCTA5' id='mTAOrCTA5'>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-4" id="hideMTAOrCTA2">
                                <p>
                                    <label>Remove documents </label><br>
                                    <button class="btn btn-light" type="button" onclick="hideMTAOrCTAFunction()"><i class="fas fa-plus-circle"></i> Remove</button>
                                </p>
                            </div>
                            <div class="col-lg-8">
                                <p>
                                    <label>Attach more documents </label><br>
                                    <button class="btn btn-light" type="button" onclick="showMTAOrCTAFunction()"><i class="fas fa-plus-circle"></i> Add</button>
                                </p>
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
            <br>
            <h3 class="border-bottom border-gray pb-2">Section 4 Project details</h3>
            <div class="card">
                <div class="card-header"><b>Trial Details</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="trial.trialTitle">Trial title <span style="color: red">*</span></label><br>
                                <input type='text' name='trial.trialTitle' id='trial.trialTitle' value="${applicationForm?.trial?.trialTitle}" placeholder='Enter Trial title' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="trial.siteEndDate">Site end date <span style="color: red">*</span></label><br>
                                <input type='date' name='trial.siteEndDate' id='trial.siteEndDate' value="${applicationForm?.trial?.siteEndDate?.toString()?.substring(0,10)}" placeholder='Enter site end date' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="trial.recruitmentAgreedTarget">Agreed recruitment target <span style="color: red">*</span></label><br>
                                <input type='text' name='trial.recruitmentAgreedTarget' id='trial.recruitmentAgreedTarget' value="${applicationForm?.trial?.recruitmentAgreedTarget}" placeholder='Enter recruitment agreed target' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="trial.sponsor">Sponsor <span style="color: red">*</span></label><br>
                                <input type='text' name='trial.sponsor' id='trial.sponsor' value="${applicationForm?.trial?.sponsor}" placeholder='Enter sponsor' required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-header"><b>Lay summary</b>  (this may be made available on the OCHRe website, please advise if confidential)<span style="color: red">*</span></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <p>
                                <textarea rows="4" cols="50" type='text' name='trial.laySummary' id='trial.laySummary' placeholder='' required="">${applicationForm?.trial?.laySummary}</textarea>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-header"><b>Protocol synopsis</b><span style="color: red">*</span></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <p>
                                <textarea rows="4" cols="50" type='text' name='trial.protocolSynopsis' id='trial.protocolSynopsis' placeholder='' required="">${applicationForm?.trial?.protocolSynopsis}</textarea>
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
                                <g:select name="trial.nHSPathologist" id="nHSPathologist" from="['Yes', 'No']" value="${applicationForm?.trial?.nHSPathologist}" noSelection="['':'']" style="width:180px;height:30px;" required="" onchange="nhsPathologistShow()"/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="nHSPathologistName">
                            <div class="form-group">
                                <label for="pathologistName">Pathologist Name <span style="color: red">*</span></label>
                                <input type='text' name='trial.pathologistName' id='pathologistName' value="${applicationForm?.trial?.pathologistName}" placeholder='Enter Expected duration' required>
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
            <br>
            <h3 class="border-bottom border-gray pb-2">Section 5 Samples, service and data</h3>
            <div class="card">
                <div class="card-header"><b>Please identify every sample that the study requires (per patient)</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row" id="sample1">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="timePoint1">Timepoint <span style="color: red">*</span></label><br>
                                <g:select name="sample.timePoint1" id="timePoint1"  from="['Screening', 'Disease progression', 'End of study']" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sampleSampleFor2">What is this sample for? <span style="color: red">*</span></label><br>
                                <g:select name="sample.sampleFor1" id="sampleSampleFor1"  from="['Eligibility/randomisation', 'Primary or secondary outcomes', 'Exploratory outcome only']" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sampleSampleType1">What is required? <span style="color: red">*</span></label><br>
                                <g:select name="sample.sampleType1" id="sampleSampleType1" onChange="unstainedSection1()" from="['Unstained sections', 'Study samples that need processing and embedding, to turn it into a FFPE block', 'Archival block']" noSelection="['':'']" style="width:440px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <p style="color: blue" id="archivalNote1">If the study accepts sections or a block, please select unstained sections instead.  If having the block is imperative to the study, then extra consent may be needed if the study consent form does not adequately state the risks of blocks no longer being in the archive.</p>
                    <div class="row" id="unstainedSections1">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideNumber1">Number of sections <span style="color: red">*</span></label><br>
                                <input type='text' name='sample.slideNumber1' id='sample.slideNumber1' placeholder='Enter number of sections' required="">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideThickness1">Thickness of sections <span style="color: red">*</span> </label><br>
                                <input type='text' name='sample.slideThickness1' id='sample.slideThickness1' placeholder='Enter thickness of sections' required="">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideType1">Type of slide <span style="color: red">*</span></label><br>
                                <g:select name="sample.slideType1" id="sample.slideType1" from="['Charged', 'Uncharged']" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.stained1">Do any need to be stained? <span style="color: red">*</span></label><br>
                                <g:select name="sample.stained1" id="sampleStained1" from="['Yes', 'No']" onchange="showStainedSpecify1Display()" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="stainedSpecify1Display">
                            <div class="form-group">
                                <label for="sample.stainedSpecify1">Please specify staining <span style="color: red">*</span></label><br>
                                <textarea rows="4" cols="50" type='text' name='sample.stainedSpecify1' id='sample.stainedSpecify1' placeholder='' required=""></textarea>
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
                                <label for="timePoint2">Timepoint <span style="color: red">*</span></label><br>
                                <g:select name="sample.timePoint2" id="timePoint2"  from="['Screening', 'Disease progression', 'End of study']" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sampleSampleFor2">What is this sample for? <span style="color: red">*</span></label><br>
                                <g:select name="sample.sampleFor2" id="sampleSampleFor2"  from="['Eligibility/randomisation', 'Primary or secondary outcomes', 'Exploratory outcome only']" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.sampleType2">What is required? <span style="color: red">*</span></label><br>
                                <g:select name="sample.sampleType2" id="sampleSampleType2" onChange="unstainedSection2()" from="['Unstained sections', 'Study samples that need processing and embedding, to turn it into a FFPE block', 'Archival block']" value="" noSelection="['':'']" style="width:440px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <p style="color: blue" id="archivalNote2">If the study accepts sections or a block, please select unstained sections instead.  If having the block is imperative to the study, then extra consent may be needed if the study consent form does not adequately state the risks of blocks no longer being in the archive.</p>
                    <div class="row" id="unstainedSections2">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sampleSlideNumber2">Number of sections <span style="color: red">*</span></label><br>
                                <input type='text' name='sample.slideNumber2' id='sampleSlideNumber2' placeholder='Enter number of sections' required="">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideThickness2">Thickness of sections <span style="color: red">*</span> </label><br>
                                <input type='text' name='sample.slideThickness2' id='sample.slideThickness2' placeholder='Enter thickness of sections' required="">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.slideType2">Type of slide <span style="color: red">*</span></label><br>
                                <g:select name="sample.slideType2" id="sample.slideType2" from="['Charged', 'Uncharged']" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="sample.stained2">Do any need to be stained? <span style="color: red">*</span></label><br>
                                <g:select name="sample.stained2" id="sampleStained2" from="['Yes', 'No']" onchange="showStainedSpecify2Display()" noSelection="['':'']" style="width:180px;height:30px;" required=""/>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-6" id="stainedSpecify2Display">
                            <div class="form-group">
                                <label for="sample.stainedSpecify2">Please specify staining <span style="color: red">*</span></label><br>
                                <textarea rows="4" cols="50" type='text' name='sample.stainedSpecify2' id='sample.stainedSpecify2' placeholder='' required=""></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="sample.specialRequirements2">Any special requirements (labelling or cleaning process)</label>
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
                <div class="card-header"><b>How will material be used?</b>  (How will you use the materials requested in this application? For trials: include whether it is for screening (eligibility assessment), primary or secondary outcome measures, and/ or exploratory objectives?)<span style="color: red">*</span></div>
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
                <div class="card-header"><b>Is there a clinical trial specific form that we or the pathologist have to complete?</b></div>
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
                                <label for="terms">I agree with the <a href="${assetPath(src: 't&cv3.pdf')}" target="_blank">T&C </a><span style="color: red">*</span></label>
                                <input type="checkbox" name="terms" id="terms" data-error="Please accept the Terms and Conditions" required>
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
                    var elmForm = $("#form-step-4");
                    elmForm.validator('validate');
                    var elmErr = elmForm.find('.has-error');
                    if(elmErr && elmErr.length > 0){
                        // Form validation failed
                        return false;
                    }else{
                        document.forms[4].submit()
                    }
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
                enableAnchorOnDoneStep: false // Enable/Disable the done steps navigation
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