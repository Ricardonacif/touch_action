(function(callback) {
    if (typeof YUI == 'undefined') {
        var script = document.createElement('script');
        var head = document.getElementsByTagName('head')[0];
        var done = false;
        script.onload = script.onreadystatechange = (function() {
            if (!done && (!this.readyState || this.readyState == 'loaded' 
                    || this.readyState == 'complete')) {
                done = true;
                script.onload = script.onreadystatechange = null;
                head.removeChild(script);
                callback();
            }
        });
        script.type = 'text/javascript';
        script.src = "//yui.yahooapis.com/3.18.1/build/yui/yui-min.js";
        head.appendChild(script);
    }
    else {
        callback();
    }
})(arguments[arguments.length - 1]);