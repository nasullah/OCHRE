<%@ page import="ochre.ApplicationForm" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main" />
    <title>Your Application List</title>
</head>

<body>

<br>
<h1><center>Your Application List</center></h1>

<section id="list-freezer" class="first">

    <table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <g:sortableColumn property="leadApplicant" title="Lead Applicant" />

            <g:sortableColumn property="contactPerson" title="Contact Person" />

            <g:sortableColumn property="researchFunder" title="Research Funder" />

            <g:sortableColumn property="applicationType" title="Application Status" />

            <td>Action</td>

        </tr>
        </thead>
        <tbody>
        <g:each in="${applicationList}" status="i" var="applicationInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td>${fieldValue(bean: applicationInstance?.leadApplicant, field: "familyName")}</td>

                <td>${fieldValue(bean: applicationInstance?.contactPerson, field: "familyName")}</td>

                <td>${fieldValue(bean: applicationInstance, field: "researchFunder")}</td>

                <td>${fieldValue(bean: applicationInstance, field: "applicationType")}</td>

                <g:if test="${applicationInstance?.applicationType?.applicationTypeName == 'Drafted'}">
                    <td><g:link action="completeApplication" params="[applicationFormId:applicationInstance?.id]"><span style="color: red">Complete Application</span></g:link></td>
                </g:if>
                <g:else>
                    <td><g:link action="applicationStatus" params="[applicationFormId:applicationInstance?.id]">View Progress</g:link></td>
                </g:else>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div>
    </div>
</section>

</body>

</html>