$(document).ready(function() {
    $.cookiesDirective({
      backgroundOpacity: '85',
      backgroundColor: '#262626',
      linkColor: '#FFF',
      buttonClass: 'button small',
      position: 'bottom',
      explicitConsent: false,
      message: 'Dette netsted bruger cookies til statistik og brugerkommentarer. Du acepterer brugen af disse cookies om du vælger at fortsætte med at besøge netstedet.',
      privacyPolicyUri: '/cookies'
    });
});