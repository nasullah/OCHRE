<!DOCTYPE html>
<html>
<head>
    <meta  charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <asset:stylesheet src="smart_wizard_theme_arrows.css"/>
    <asset:stylesheet src="smart_wizard.css"/>
</head>
<body>
<br>
<h3><center>Upload Pending Documents For Application ${applicationForm?.id}</center></h3>
<div class="container">
    <a class="btn btn-primary btn-xs" href="/OCHRE" style="margin-left:20px;">&#171; Back to homepage</a>
    <hr>
    <g:uploadForm action="savePendingUpload" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8">
        <g:if test="${applicationForm?.ethicalApproval?.ethicalApprovalLetterPending}">
            <div class="card">
                <div class="card-header"><b>Ethical approval letter</b> </div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
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
                    </div>
                </div>
            </div>
            <br>
        </g:if>
        <g:if test="${applicationForm?.consentForUseInResearch?.consentForUseInResearchFormPending}">
            <div class="card">
                <div class="card-header"><b>Consent forms and PIS’s</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row">
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
                    </div>
                </div>
            </div>
            <br>
        </g:if>
        <g:if test="${applicationForm?.mTAOrCTA?.mTAOrCTAPending}">
            <div class="card">
                <div class="card-header"><b>Copy of the MTA or CTA</b></div>
                <div class="card-block p-0" style="margin: auto;width: 50%">
                    <br>
                    <div class="row" id="mTAOrCTA">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="mTAOrCTA1">Please attach a copy of the MTA or CTA <span style="color: red">*</span></label><br>
                                <input type='file' name='mTAOrCTA1' id='mTAOrCTA1' required="">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                %{--<label for="mTAOrCTAPending">Pending?</label>--}%
                                %{--<input type="checkbox" name="mTAOrCTAPending" id="mTAOrCTAPending" onclick="mTAOrCTAFunction()">--}%
                                %{--<div class="help-block with-errors"></div>--}%
                                <label for="mTAOrCTAComplete">Have you uploaded all documents?</label><br>
                                <input type="radio" name="mTAOrCTAComplete" value="Yes" onclick="mTAOrCTACompleteFunction()" required> Yes
                                <input type="radio" name="mTAOrCTAComplete" value="Pending" onclick="mTAOrCTAPending()"> Pending
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-8" id="showMTAOrCTA2">
                            <div class="form-group">
                                <label for="mTAOrCTA2">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                <input type='file' name='mTAOrCTA2' id='mTAOrCTA2' required="">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-8" id="showMTAOrCTA3">
                            <div class="form-group">
                                <label for="mTAOrCTA3">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                <input type='file' name='mTAOrCTA3' id='mTAOrCTA3' required="">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-8" id="showMTAOrCTA4">
                            <div class="form-group">
                                <label for="mTAOrCTA4">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                <input type='file' name='mTAOrCTA4' id='mTAOrCTA4' required="">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="col-lg-8" id="showMTAOrCTA5">
                            <div class="form-group">
                                <label for="mTAOrCTA5">Please attach a copy of the approval letter <span style="color: red">*</span></label><br>
                                <input type='file' name='mTAOrCTA5' id='mTAOrCTA5' required="">
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
                    </div>
                </div>
            </div>
            <br>
        </g:if>
        <g:hiddenField name="applicationFormId" value="${applicationForm?.id}"/>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="Save" />
        </fieldset>
    </g:uploadForm>
</div>
<br>
<br>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Include jQuery Validator plugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.5/validator.min.js"></script>


<!-- Include SmartWizard JavaScript source -->
<asset:javascript src="jquery.smartWizard.min.js"/>

<script type="text/javascript">
    var countEthicalApprovalLetter = 2;
    setupEthicalApprovalLetter();
    function setupEthicalApprovalLetter(){
        var i;
        for (i = countEthicalApprovalLetter; i < 6; i ++) {
            $("#showEthicalApprovalLetter"+i).hide();
            $("#hideEthicalApprovalLetter"+i).hide();
            if (document.getElementById("ethicalApprovalLetter"+i)){
                document.getElementById("ethicalApprovalLetter"+i).required = false;
            }
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
            if (document.getElementById("consentForUseInResearchForm"+i)){
                document.getElementById("consentForUseInResearchForm"+i).required = false;
            }
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
            if(document.getElementById("mTAOrCTA"+i)){
                document.getElementById("mTAOrCTA"+i).required = false;
            }
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