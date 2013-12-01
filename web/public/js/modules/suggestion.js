
// auto suggestion plugin

module.exports = (function($){
  
  remoteSource = function(req, res) {
          
   var root = this;
   var term = req.term.trim();

   // todo : refactoring this to be a function
   if (root.options.preRequestedData &&
     new RegExp("^" + root.options.preRequestedTerm, "i").test(term) && 
     root.options.preRequestedData.length < settings.count) {
      
     res($.grep(root.options.preRequestedData, function(item) {
       return new RegExp("\\b" + term, "ig").test(item);
     }));

     return;
   }

   $.ajax({
     url : settings.endpoint + "?term=" + term,
   }).done(function(data) {
     root.options.preRequestedData = data;
     root.options.preRequestedTerm = term;
     res(data);
   });
  };

  $.fn.autosuggestion = function(options)
  {
    var settings = $.extend({
      count : 6,
      endpoint : "/api/suggest"
    }, options);
    
    return this.each(function(){
      
      $(this).autocomplete(
      {
        source : function(req, res) {       
          var root = this;
          var term = req.term.trim();

          // todo : refactoring this to be a function
          if (root.options.preRequestedData &&
            new RegExp("^" + root.options.preRequestedTerm, "i").test(term) && 
            root.options.preRequestedData.length < settings.count) {
              
            res($.grep(root.options.preRequestedData, function(item) {
              return new RegExp("\\b" + term, "ig").test(item);
            }));

            return;
          }

          $.ajax({
            url : settings.endpoint + "?q=" + term,
          }).done(function(data) {
            root.options.preRequestedData = data;
            root.options.preRequestedTerm = term;
            res(data);
          });
        },
        delay: 0
      }).data("ui-autocomplete")._renderItem = function(ul, item) {

        var term = this.term.trim();

        var highlightedLabel = item.label.replace(new RegExp("\\b(" + term + ")", "ig"),
            "<b>$1</b>");

        return highlightedLabel == item.label
          ? $(this) 
          : $("<li class='ui-menu-item' role='presentation'></li>").append(
            $('<a class="ui-corner-all"></a>').append(highlightedLabel)).data(
            "ui-autocomplete-item", item).appendTo(ul);
      };
    });   
  };  
}(jQuery));
