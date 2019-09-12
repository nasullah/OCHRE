<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>
    <asset:stylesheet src='spring-security-ui-auth.css'/>
</head>
<body>
<p/>
<div class="login s2ui_center ui-corner-all" style='text-align:center;'>
    <div class="login-inner">
        <s2ui:form type='login' focus='username'>
            <div class="sign-in">
                <h2>User login</h2>
                <table>
                    <tr>
                        <td><label for="username"><label for="username">Email address</label></label></td>
                        <td><input type="email" name="${securityConfig.apf.usernameParameter}" id="username" class='formLogin' size="20"/></td>
                    </tr>
                    <tr>
                        <td><label for="password"><g:message code='spring.security.ui.login.password'/></label></td>
                        <td><input type="password" name="${securityConfig.apf.passwordParameter}" id="password" class="formLogin" size="20"/></td>
                    </tr>
                    %{--<tr>--}%
                        %{--<td colspan='2'>--}%
                            %{--<input type="checkbox" class="checkbox" name="${securityConfig.rememberMe.parameter}" id="remember_me" checked="checked"/>--}%
                            %{--<label for='remember_me'><g:message code='spring.security.ui.login.rememberme'/></label> |--}%
                            %{--<span class="forgot-link">--}%
                                %{--<g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link>--}%
                            %{--</span>--}%
                        %{--</td>--}%
                    %{--</tr>--}%
                    <tr>
                        <td colspan='2'>
                            %{--<s2ui:linkButton elementId='register' controller='register' messageCode='spring.security.ui.login.register'/>--}%
                            <button type="submit" class="btn btn-info active"><span class="fa fa-sign-in-alt"></span> Login</button>
                        </td>
                    </tr>
                </table>
            </div>
        </s2ui:form>
    </div>
</div>
<div style="height: 45%">
</div>
</body>
</html>