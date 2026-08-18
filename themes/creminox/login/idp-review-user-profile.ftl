<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email'); section>
    <#if section = "header">
        ${msg("loginIdpReviewProfileTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-idp-review-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="kc-idp-profile-info">
                        <p class="kc-idp-profile-message">
                            ${msg("confirmEmailAddressVerification", (user.email!''))}
                        </p>
                    </div>

                    <#if (user.firstName?has_content)>
                        <div class="formulariosMargin">
                            <label for="firstName" class="${properties.kcLabelClass!}">
                                ${msg("firstName")}
                            </label>
                            <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(user.firstName!'')}" />
                            <#if messagesPerField.existsError('firstName')>
                                <span id="input-error-firstName" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <#if (user.lastName?has_content)>
                        <div class="formulariosMargin">
                            <label for="lastName" class="${properties.kcLabelClass!}">
                                ${msg("lastName")}
                            </label>
                            <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(user.lastName!'')}" />
                            <#if messagesPerField.existsError('lastName')>
                                <span id="input-error-lastName" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <#if (user.email?has_content)>
                        <div class="formulariosMargin">
                            <label for="email" class="${properties.kcLabelClass!}">
                                ${msg("email")}
                            </label>
                            <input type="email" id="email" class="${properties.kcInputClass!}" name="email" value="${(user.email!'')}" />
                            <#if messagesPerField.existsError('email')>
                                <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('email'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="kc-form-buttons-group">
                            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="updateProfile">${msg("confirmLinkIdpReviewProfile")}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
