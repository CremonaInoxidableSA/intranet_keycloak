<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayInfo=realm.duplicateEmailsAllowed; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="formulariosMargin">
                        <label for="username" class="${properties.kcLabelClass!}">
                            ${msg("usernameOrEmail")}
                        </label>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" value="${(auth.attemptedUsername!'')}" autofocus autocomplete="username" />
                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>
                    <div class="kc-form-buttons-group2">
                        <div id="kc-form-buttons2" class="${properties.kcFormButtonsClass!}">
                            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Submit">${msg("doSubmit")}</button>
                        </div>
                    </div>
                    <div id="kc-reset-info2" class="${properties.kcFormGroupClass!}">
                        <div id="kc-reset-info-wrapper2" class="${properties.kcInfoAreaWrapperClass!}">
                            ${msg("emailInstruction")}
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
