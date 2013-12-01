
require('./suggestion.js');


// search plugin

module.exports = (function($) {
  
  $.fn.search = function(options) {

    fire = function(keyword) {
      window.location = '/results?q=' + encodeURIComponent(keyword);
    };    
    
    return this.each(function() {

      options = $.extend({}, {
          endpoint: '/api/search',
          suggest: {
            enabled: true,
            count:6,
            endpoint: '/api/suggest'
        }
      }, options);

      // generate html ...

      var $this = $(this);      
      var $wrapper = $('<div class="search-wrapper" />');     
      var $button = $('<input type="button" class="search-button" value="Search" />');
      var $textbox = $('<input type="text" class="search-textbox" />');

      setTimeout(function (argument) {
        // event binding ...
        $button.on('click', function () {
          fire($textbox.val());
        });

        $textbox.on('keypress', function (e) {
          if(e.which == 13) {
            fire($(this).val());
          }
        });

        // features enabling
        if (options.suggest.enabled)
          $textbox.autosuggestion(options.suggest);
      }, 20);

      return $this.append(
        $wrapper
          .append($textbox)
          .append($button))
    });
  };
})(jQuery);

