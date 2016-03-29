$(document).ready(function() {
    $.cookiesDirective({
      backgroundOpacity: '85',
      backgroundColor: '#262626',
      linkColor: '#FFF',
      buttonClass: 'button small',
      position: 'bottom',
      explicitConsent: false,
      message: 'Dette websted bruger cookies til trafikmåling og kommentar-systemet. Ved at fortsætte at bruge dette websted accepterer du brugen af cookies.',
      privacyPolicyUri: '/cookies'
    });
});