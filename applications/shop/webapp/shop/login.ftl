<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<#-- Cato: now points to shop -->
<#assign janrainEnabled = getPropertyValue("shop.properties", "janrain.enabled")!"">
<#assign appName = getPropertyValue("shop.properties", "janrain.appName")!"">
<#if janrainEnabled == "Y">
<@script>
(function() {
    if (typeof window.janrain !== 'object') window.janrain = {};
    window.janrain.settings = {};
    
    janrain.settings.tokenUrl = '<@ofbizUrl fullPath="true" secure="true">janrainCheckLogin</@ofbizUrl>';

    function isReady() { janrain.ready = true; };
    if (document.addEventListener) {
      document.addEventListener("DOMContentLoaded", isReady, false);
    } else {
      window.attachEvent('onload', isReady);
    }

    var e = document.createElement('script');
    e.type = 'text/javascript';
    e.id = 'janrainAuthWidget';

    if (document.location.protocol === 'https:') {
      e.src = 'https://rpxnow.com/js/lib/${appName}/engage.js';
    } else {
      e.src = 'http://widget-cdn.rpxnow.com/js/lib/${appName}/engage.js';
    }

    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(e, s);
})();
</@script>
  <@section title=uiLabelMap.CommonRegistered>
    <@row class="+Signlogin">
      <@cell columns=6>
          <form method="post" action="<@ofbizUrl>login</@ofbizUrl>" name="loginform" class="horizontal">
            <fieldset>
              
                <label for="userName">${uiLabelMap.CommonUsername}</label>
                <input type="text" id="userName" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"/>
              
              <#if autoUserLogin?has_content>
                <p>(${uiLabelMap.CommonNot} ${autoUserLogin.userLoginId}? <a href="<@ofbizUrl>${autoLogoutUrl}</@ofbizUrl>">${uiLabelMap.CommonClickHere}</a>)</p>
              </#if>
              
                <label for="password">${uiLabelMap.CommonPassword}:</label>
                <input type="password" id="password" name="PASSWORD" value=""/>
              
              
                <input type="submit" class="${styles.link_run_session!} ${styles.action_login!}" value="${uiLabelMap.CommonLogin}"/>
              
              
                <label for="newcustomer_submit">${uiLabelMap.CommonMayCreateNewAccountHere}:</label>
                <a href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.CommonMayCreate}</a>
              
            </fieldset>
          </form>
         <div id="janrainEngageEmbed">
      </@cell>
    </@row>
  </@section>
<#else>
  <@section title=uiLabelMap.CommonRegistered>
    <form method="post" action="<@ofbizUrl>login</@ofbizUrl>" name="loginform" class="horizontal">
      <fieldset>
        
          <label for="userName">${uiLabelMap.CommonUsername}</label>
          <input type="text" id="userName" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"/>
        
        <#if autoUserLogin?has_content>
          <p>(${uiLabelMap.CommonNot} ${autoUserLogin.userLoginId}? <a href="<@ofbizUrl>${autoLogoutUrl}</@ofbizUrl>">${uiLabelMap.CommonClickHere}</a>)</p>
        </#if>
        
          <label for="password">${uiLabelMap.CommonPassword}:</label>
          <input type="password" id="password" name="PASSWORD" value=""/>
        
        
          <input type="submit" class="${styles.link_run_session!} ${styles.action_login!}" value="${uiLabelMap.CommonLogin}"/>
        
        
          <label for="newcustomer_submit">${uiLabelMap.CommonMayCreateNewAccountHere}:</label>
          <a href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.CommonMayCreate}</a>
        
      </fieldset>
    </form>
  </@section>
</#if>

<@section title=uiLabelMap.CommonForgotYourPassword>
  <form method="post" action="<@ofbizUrl>forgotpassword</@ofbizUrl>" class="horizontal">
    
      <label for="forgotpassword_userName">${uiLabelMap.CommonUsername}</label>
      <input type="text" id="forgotpassword_userName" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"/>
    
    
      <input type="submit" class="${styles.link_run_sys!} ${styles.action_view!}" name="GET_PASSWORD_HINT" value="${uiLabelMap.CommonGetPasswordHint}"/>
      <input type="submit" class="${styles.link_run_sys!} ${styles.action_send!}" name="EMAIL_PASSWORD" value="${uiLabelMap.CommonEmailPassword}"/>
    
  </form>
</@section>
<#--    
<@section title=uiLabelMap.CommonNewUser>
  <form method="post" action="<@ofbizUrl>newcustomer</@ofbizUrl>">
    
      <label for="newcustomer_submit">${uiLabelMap.CommonMayCreateNewAccountHere}:</p>
      <input type="submit" class="${styles.link_run_sys!} ${styles.action_add!}" id="newcustomer_submit" value="${uiLabelMap.CommonMayCreate}"/>
    
  </form>
</@section>
-->

<@script>
  <#if autoUserLogin?has_content>document.loginform.PASSWORD.focus();</#if>
  <#if !autoUserLogin?has_content>document.loginform.USERNAME.focus();</#if>
</@script>
