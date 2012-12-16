package codecanaan

class CommonTagLib {
    def justfont = { attr, body ->

        def ctv = [attr.ct1, attr.ct2, attr.ct3, attr.ct4, attr.ct5]

        for (def i = 0; i < ctv.size(); i++) {
            def val = ctv[i]
            if (val) {
                val = val.split(',')
                for (def j = 0; j < val.length; j++) {
                    val[j] = val[j]?.trim()
                }
                if (val.length == 1) {
                    val = val[0]
                }
                else {
                    def val2 = [:]
                    def c = 0
                    val.each {
                        val2[c++] = it
                    }
                    val = val2
                }
            }
            ctv[i] = val
        }

        def json = new groovy.json.JsonBuilder()
        json {
            ct1 ctv[0]
            ct2 ctv[1]
            ct3 ctv[2]
            ct4 ctv[3]
            ct5 ctv[4]
        }

        def tag = json.toString().replace('"',"'")

        out << "window.jfAsyncInit=function(){ctb.main({'appId':'${grailsApplication.config.grails.justfont.appId}','tag':${tag}});};(function(){var jf=document.createElement('script');jf.type='text/javascript';jf.async=true;jf.src='http://ds.justfont.com/core/js/v1.${grailsApplication.config.grails.justfont.appId}.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(jf,s);})();"
    }

    def analytics = { attr, body ->
        out << """
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '${grailsApplication.config.grails.analytics.account}']);
  _gaq.push(['_setDomainName', '${grailsApplication.config.grails.analytics.domainName}']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
"""
    }
}
