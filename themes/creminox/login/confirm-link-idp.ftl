<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("confirmLinkIdpTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <div class="kc-confirm-link-info">
                    <p class="kc-confirm-link-message">
                        ${msg("federatedIdentityConfirmLinkMessage", (newUser.firstName!'' + ' ' + newUser.lastName!'')?trim, (broker.displayName!''))}
                    </p>
                    <p class="kc-confirm-link-submessage">
                        ${msg("confirmLinkIdpContinue")}
                    </p>
                </div>

                <form id="kc-confirm-link-idp-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">
                            ${msg("username")}
                        </label>
                        <input tabindex="2" id="username" class="${properties.kcInputClass!}" name="username" value="${(auth.attemptedUsername!'')}"  type="text"
                               autofocus autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />
                        <#if messagesPerField.existsError('username')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <label for="email" class="${properties.kcLabelClass!}">
                            ${msg("email")}
                        </label>
                        <input tabindex="3" id="email" class="${properties.kcInputClass!}" name="email" value="${(user.email!'')}"  type="email"
                               autocomplete="email"
                               aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                        />
                        <#if messagesPerField.existsError('email')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('email'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <label for="firstName" class="${properties.kcLabelClass!}">
                            ${msg("firstName")}
                        </label>
                        <input tabindex="4" id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(user.firstName!'')}"  type="text"
                               aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                        />
                        <#if messagesPerField.existsError('firstName')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <label for="lastName" class="${properties.kcLabelClass!}">
                            ${msg("lastName")}
                        </label>
                        <input tabindex="5" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(user.lastName!'')}"  type="text"
                               aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                        />
                        <#if messagesPerField.existsError('lastName')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="kc-form-buttons-group">
                            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="updateProfile">${msg("confirmLinkIdpContinue")}</button>
                            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="linkAccount">${msg("confirmLinkIdpReviewProfile")}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
