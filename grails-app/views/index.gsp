<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to OCHRe</title>
</head>
<body>
<sec:ifNotLoggedIn>
    <div class="container" style="position: relative;">
        <br>
        <asset:image style="height: 30%;width: 100%" src="background.png"/>
        <div class="text-block" style="position: absolute;bottom: 40%;right: 9%;background-color: #ffffff;color: #000000;">
            <h1><center><b>Oxford Centre for Histopathology Research (OCHRe)</b></center></h1>
        </div>
        <div class="text-block" style="position: absolute;bottom: 20%;right: 35%;background-color: #ffffff;color: #000000;">
            <h2><center><span><b> Clinical Trials Web Portal </b></span></center></h2>
        </div>
    </div>
    <div class="container">
        <section>
            <hr>
            <p align="justify">
                OCHRe is the research team that support research and clinical trials on behalf of Cellular Pathology here at the John Radcliffe Hospital in Oxford.
            </p>
            <p align="justify">
                If a diagnostic sample is needed for a clinical trial and the clinical trial has not already been set up with ourselves, then please use the online ‘create an application’ form.  If you already have an OCHRe application number for this trial, e.g. 17/A123, 18/A123, you will not need to complete this form again.
            </p>
            <p align="justify">
                This website will allow users to create login in details, create clinical trial applications using the online form, track the progress of the application from submission to approval and view all previous applications made to us through this portal.
            </p>
            <p>
                You will need to read and agree to our terms and conditions, before you can submit an application, so please ensure a copy of this is read and kept on file for future reference.
            </p>
            <p align="justify">
                The online application is made up of 5 sections, and you will be able to save a draft and come back to it if you do not have all the information and documents needed to submit the form.  This form needs to be completed fully, and you will not be able to submit the form if all mandatory fields aren’t completed.  Once submitted, you will not be able to make changes to the form on this portal, so if you have any questions regarding the application, please do contact us before you submit. Amendments (as submitted to REC) will be managed by email, not through this App.
            </p>
            <p align="justify">
                If you do not complete the form properly, you will be notified to go back and make adjustments before we will accept a submitted application.  This will delay getting the approval for the trial.
            </p>
            <p align="justify">
                A helpful guide to using this online website and application can be downloaded here.
            </p>
            <p align="justify">
                If you have any questions, please contact us using the details below:
            </p>
            <p align="justify">
                Telephone: <a href="tel:01865 220557">01865 220557</a>, <a href="tel:01865 228963">01865 228963</a>, <a href="tel:01865 220550">01865 220550</a>
            </p>
            <p align="justify">
                For general enquires: <a href="mailto:ochre@ndcls.ox.ac.uk" target="_top">ochre@ndcls.ox.ac.uk</a><br>
            </p>
            <p align="justify">
                For patient confidential enquiries: <a href="mailto:orh-tr.ochre@nhs.net" target="_top">orh-tr.ochre@nhs.net</a>
            </p>
        </section>
    </div>
    <br>
    <br>
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>
    <br>
    <br>
    <h3><center><i class="fas fa-tasks"></i> Applications</center></h3>
    <hr>
</sec:ifLoggedIn>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <div class="container-fluid">
        <section id="info">
            <div class="equal">
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fas fa-spinner"></i> Draft in Progress
                        </div>
                        <div class="panel-body">
                            <g:link controller="applicationForm" action="applicationList" params="[applicationType:'Drafted']"><i class="fas fa-list-alt"></i> Application List</g:link>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fas fa-hand-point-up"></i> Submitted Pending Attachments
                        </div>
                        <div class="panel-body">
                            <g:link controller="applicationForm" action="applicationList" params="[applicationType:'Submitted Pending Attachments']"><i class="fas fa-list-alt"></i> Application List</g:link>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fas fa-hand-point-up"></i> Submitted
                        </div>
                        <div class="panel-body">
                            <g:link controller="applicationForm" action="applicationList" params="[applicationType:'Submitted']"><i class="fas fa-list-alt"></i> Application List</g:link>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fas fa-users"></i> OCHRe Committee Meeting
                        </div>
                        <div class="panel-body">
                            <g:link controller="applicationForm" action="applicationList" params="[applicationType:'OCHRe Committee Meeting']"><i class="fas fa-list-alt"></i> Application List</g:link>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fas fa-calendar-check"></i> Approved
                        </div>
                        <div class="panel-body">
                            <g:link controller="applicationForm" action="applicationList" params="[applicationType:'Application Approved']"><i class="fas fa-list-alt"></i> Application List</g:link>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <hr>
    <div style="height: 50%">
    </div>
</sec:ifAnyGranted>
</body>
</html>
