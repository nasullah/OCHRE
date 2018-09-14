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

            <g:sortableColumn property="researchFunder" title="Research Funder" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${filteredApplicationList}" status="i" var="applicationInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${applicationInstance.id}">${fieldValue(bean: applicationInstance?.leadApplicant, field: "familyName")}</g:link></td>

                <td>${fieldValue(bean: applicationInstance?.contactPerson, field: "familyName")}</td>

                <td>${fieldValue(bean: applicationInstance, field: "researchFunder")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div>
    </div>
</section>

</body>

</html>