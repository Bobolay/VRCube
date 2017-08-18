var _gaq = _gaq || [];
_gaq.push(["_setAccount", "UA-1234-1"]);
_gaq.push(["_setDomainName", "none"]);
_gaq.push(["_trackPageview"]);

(function(i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r;
    i[r] = i[r] || function() {
        (i[r].q = i[r].q || []).push(arguments)
    }, i[r].l = 1 * new Date();
    a = s.createElement(o),
    m = s.getElementsByTagName(o)[0];
    a.async = true;
    a.src = g;
    m.parentNode.insertBefore(a, m);
})(window, document, 'script', 'http://www.google-analytics.com/analytics.js', 'ga');

// real klient GA ID (for production)
ga( 'create', 'UA-104147567-1', 'auto' );

// studio GA account ID (for development)
// ga( 'create', 'UA-104756132-1', 'auto' );
ga( 'send', 'pageview' );


// for localhost
// ga("create", "UA-1234-1", {"cookieDomain":"none"});
// ga("send", "pageview");