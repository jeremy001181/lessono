
require('./suggestion.js');


// search plugin

module.exports = (function($) {
  
  fire = function(keyword) {
    window.location = '/results?q=' + encodeURIComponent(keyword);
  };


  $.fn.search = function(options) {
    
    return this.each(function() {

      options = $.extend({}, {
          autocomplete: {
            enabled: true,
            count:6,
            endpoint: '/autocomplete'
        }
      }, options);

      var $this = $(this);      
      var $wrapper = $('<div class="search-wrapper" />');     
      var $button = $('<input type="button" class="search-button" value="Search" />');
      var $textbox = $('<input type="text" class="search-textbox" />');

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

      if (options.autocomplete.enabled)
        $textbox.autosuggestion(options.autocomplete);

      // generate html ...

      return $this.append($wrapper
        .append($textbox)
        .append($button));
    });
  };
})(jQuery);

