<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Registration</title>
    <asset:stylesheet src='spring-security-ui-auth.css'/>
</head>
<body>
<p/>
<g:if test="${flash.message}">
    <div class="alert alert-error" style="display: block; color: red">${flash.message}</div>
</g:if>
<div class="login s2ui_center ui-corner-all" style='text-align:center;'>
    <div class="login-inner">
        <g:form type='login' focus='username' controller="applicationForm" action="saveRegistration" role="form" method="post" accept-charset="utf-8">
            <div class="sign-in">
                <h2>User registration</h2>
                <table>
                    <tr>
                        <td><label for="emailAddress">Email address</label></td>
                        <td><input type="email" name="emailAddress" id="emailAddress" class='formLogin' size="20"/></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password</label></td>
                        <td><input type="password" name="password" id="password" class="formLogin" size="20"/></td>
                    </tr>
                    <tr>
                        <td><label for="repeatPassword">Re-enter password</label></td>
                        <td><input type="password" name="repeatPassword" id="repeatPassword" class="formLogin" size="20"/></td>
                    </tr>
                    <tr>
                        <td colspan='2'>
                            <button type="submit" class="btn btn-info active"><span class="fa fa-user-plus"></span> Register</button>
                        </td>
                    </tr>
                </table>
            </div>
        </g:form>
    </div>
</div>
<div style="height: 45%">
</div>
</body>
</html>