<%@ page import="ochre.ApplicationForm" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main" />
    <title>${applicationType} Application List</title>
</head>

<body>

<br>
<h1><center>${applicationType} Application List</center></h1>

<section id="list-freezer" class="first">

    <table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <g:sortableColumn property="leadApplicant" title="Lead Applicant" />

            <g:sortableColumn property="contactPerson" title="Contact Person" />

            <g:sortableColumn property="researchFunder" title="Trial Title" />

            <g:sortableColumn property="applicationType" title="Application Status" />

            <g:sortableColumn property="applicationType" title="View" />

            <g:sortableColumn property="applicationType" title="Action" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${filteredApplicationList}" status="i" var="applicationInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>${fieldValue(bean: applicationInstance?.leadApplicant, field: "jobTitle")} ${fieldValue(bean: applicationInstance?.leadApplicant, field: "name")}</td>

                <td>${fieldValue(bean: applicationInstance?.contactPerson, field: "jobTitle")} ${fieldValue(bean: applicationInstance?.contactPerson, field: "name")}</td>

                <td>${fieldValue(bean: applicationInstance?.trial, field: "trialTitle")}</td>

                <td>${fieldValue(bean: applicationInstance, field: "applicationType")}</td>

                <td><g:link action="show" params="[id:applicationInstance?.id]">View Application</g:link></td>


                <g:if test="${applicationInstance?.applicationType?.applicationTypeName == 'Drafted'}">
                    <td><g:link action="completeApplication" params="[applicationFormId:applicationInstance?.id]"><span style="color: red">Complete Application</span></g:link></td>
                </g:if>
                <g:elseif test="${applicationInstance?.applicationType?.applicationTypeName == 'Submitted Pending Attachments'}">
                    <td><g:link action="uploadPendingDocs" params="[applicationFormId:applicationInstance?.id]"><span style="color: #ff8a1f">Attachment Pending Documents</span></g:link></td>
                </g:elseif>
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