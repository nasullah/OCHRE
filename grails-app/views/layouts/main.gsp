<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
    <asset:link rel="icon" href="ochre.jpg" type="image/x-ico" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    &nbsp;
    <i class="fa grails-icon">
        <asset:image src="ochre.jpg"/>
    </i>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/OCHRE/"><i class="fas fa-home"></i> Home</a>
                </li>
                <sec:ifLoggedIn>
                    %{--<li class="nav-item">--}%
                        %{--<g:if test="${sec?.username()?.toString()?.contains('.')}">--}%
                            %{--<g:link class="nav-link" controller="login" action="auth"><i class="fas fa-user"></i> ${sec?.username()?.toString()?.substring(0, sec?.username()?.toString()?.lastIndexOf('.'))?.capitalize()}</g:link>--}%
                        %{--</g:if>--}%
                        %{--<g:else>--}%
                            %{--<g:link class="nav-link" controller="login" action="auth"><i class="fas fa-user"></i> ${sec?.username()?.capitalize()}</g:link>--}%
                        %{--</g:else>--}%
                    %{--</li>--}%
                </sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li class="nav-item">
                        <g:link class="nav-link" controller="applicationType" action="index"><i class="fas fa-list-alt"></i> Application status</g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link" url="${createLink(uri: '/user')}"><i class="fas fa-list-alt"></i> User List</g:link>
                    </li>
                </sec:ifAnyGranted>
                    <li class="nav-item">
                        <g:link class="nav-link" controller="applicationForm" action="create"><i class="fas fa-plus-circle"></i> Submit New Application</g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link" controller="applicationForm" action="yourExistingApplications"><i class="fas fa-list-alt"></i>  Track Existing Applications</g:link>
                    </li>
                <sec:ifNotLoggedIn>
                    <li class="nav-item">
                        <g:link class="nav-link" controller="login" action="auth"><i class="fas fa-sign-in-alt"></i> Login</g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link" controller="applicationForm" action="registration"><i class="fas fa-user-plus"></i> Create Login Details</g:link>
                    </li>
                </sec:ifNotLoggedIn>
                <li class="nav-link">
                    <sec:ifLoggedIn>
                        <g:form controller="logout">
                            <a class="nav-link" href="#" onclick="document.forms[0].submit(); [0].submit();"><i class="fas fa-sign-out-alt"></i> Log out</a>
                        </g:form>
                    </sec:ifLoggedIn>
                </li>
            </ul>
        </div>
    </div>
</nav>


<g:layoutBody/>
<br>
<footer style="position:relative;;;bottom:0;width:100%;height:80px;   /* Height of the footer */background:rgba(225, 230, 255, 0.21)">
    <div class="container" style="text-align:center">
        <div>
            <br/>
            &#169; University of Oxford 2019
        </div>
    </div>
</footer>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

%{--<asset:javascript src="application.js"/>--}%

</body>
</html>

