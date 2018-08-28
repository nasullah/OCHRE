<%--
  Created by IntelliJ IDEA.
  User: nasulla
  Date: 21/05/2018
  Time: 15:37
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'applicationForm.label', default: 'ApplicationForm')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Include Bootstrap CSS -->

    <!-- Include SmartWizard CSS -->
    <asset:stylesheet src="smart_wizard.css"/>

    <!-- Optional SmartWizard theme -->
    <asset:stylesheet src="smart_wizard_theme_circles.css"/>
</head>
<body>
<a href="#create-applicationForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<br>
<h2><center>Your Applications List</center></h2>
<hr>
<div class="container">
    <h5><center>Application 1234</center></h5>
    <br>
    <div id="smartwizard">
        <ul>
            <li><a href="#"> 1<br /><small>Draft In Progress</small></a></li>
            <li><a href="#"> 2<br /><small>Application Submitted</small></a></li>
            <li><a href="#"> 3<br /><small>OCHRe Committee Meeting</small></a></li>
            <li><a href="#"> 4<br /><small>Application Approved</small></a></li>
        </ul>
    </div>
</div>

<!-- Include jQuery -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->

<script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>

<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- Include SmartWizard JavaScript source -->
<asset:javascript src="jquery.smartWizard.min.js"/>

<script type="text/javascript">
    $(document).ready(function(){
        $('#smartwizard').smartWizard({
            selected: 2,
            theme: 'circles',
            transitionEffect:'fade',
            showStepURLhash: false
        });

    });
</script>

<hr>
</body>
</html>