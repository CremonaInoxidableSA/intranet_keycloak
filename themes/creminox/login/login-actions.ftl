<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('email'); section>
    <#if section = "header">
        ¿Olvidaste tu contraseña?
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <div id="kc-login-actions-container">
                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-options">
                            <div class="instruction">
                                <p>Ingresa tu correo electrónico. Allí vas a recibir el paso a paso para recuperar tu contraseña.</p>
                            </div>
                        </div>
                    </div>
                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <#if actionUri?has_content>
                                <a href="${actionUri}" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" id="kc-action-button">Continuar</a>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
