<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("confirmAccountLinking")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-first-broker-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                        <div class="kc-broker-info">
                            <p class="kc-broker-message">
                                ${msg("federatedIdentityConfirmLinkMessage", (broker.displayName!''))}
                            </p>
                        </div>

                        <#if !usernameHidden??>
                            <div class="${properties.kcFormGroupClass!}">
                                <label for="username" class="${properties.kcLabelClass!}">
                                    ${msg("username")}
                                </label>
                                <input tabindex="2" id="username" class="${properties.kcInputClass!}" name="username" value="${(auth.attemptedUsername!'')}"  type="text"
                                       autofocus autocomplete="username"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />
                                <#if messagesPerField.existsError('username','password')>
                                    <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </#if>

                        <#if (realm.user.profileUserAttributeRequired)!false>
                            <div class="${properties.kcFormGroupClass!}">
                                <label for="firstName" class="${properties.kcLabelClass!}">
                                    ${msg("firstName")}
                                </label>
                                <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(user.firstName!'')}" autocomplete="given-name" />
                            </div>

                            <div class="${properties.kcFormGroupClass!}">
                                <label for="lastName" class="${properties.kcLabelClass!}">
                                    ${msg("lastName")}
                                </label>
                                <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(user.lastName!'')}" autocomplete="family-name" />
                            </div>

                            <div class="${properties.kcFormGroupClass!}">
                                <label for="email" class="${properties.kcLabelClass!}">
                                    ${msg("email")}
                                </label>
                                <input type="email" id="email" class="${properties.kcInputClass!}" name="email" value="${(user.email!'')}" autocomplete="email" />
                            </div>
                        </#if>

                        <div class="${properties.kcFormGroupClass!}">
                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="updateProfile">${msg("doSubmit")}</button>
                            </div>
                        </div>
                    </form>
                </#if>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
