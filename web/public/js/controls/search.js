// auto suggestion plugin

(function($){
	
	// remoteSource = function(req, res) {
					
	// 	var root = this;
	// 	var term = req.term.trim();

	// 	// todo : refactoring this to be a function
	// 	if (root.options.preRequestedData &&
	// 		new RegExp("^" + root.options.preRequestedTerm, "i").test(term) && 
	// 		root.options.preRequestedData.length < settings.count) {
			
	// 		res($.grep(root.options.preRequestedData, function(item) {
	// 			return new RegExp("\\b" + term, "ig").test(item);
	// 		}));

	// 		return;
	// 	}

	// 	$.ajax({
	// 		url : settings.endpoint + "?term=" + term,
	// 	}).done(function(data) {
	// 		root.options.preRequestedData = data;
	// 		root.options.preRequestedTerm = term;
	// 		res(data);
	// 	});
	// };

	$.fn.autosuggestion = function(options)
	{
		var settings = $.extend({
			count : 6,
			endpoint : "/autocomplete"
		}, options);
		
		return this.each(function(){
			
			$(this).autocomplete(
			{
				source : ["Accountancy","Accounting","Aeronautical Engineering","Agriculture","Anthropology","Art","Arts and Humanities","Astronomy","Biology","Business","Chemical Engineering","Chemistry","Civil Engineering","Communications","Computer Science","Earth and Marine Sciences","Economics","Education","Electrical Engineering","Engineering","Engineering and Technology","Engineering Management","English Literature","Environmental Science","Fashion","Finance","Geography","History","International Relations","Law","Leisure and Tourism","Linguistics","Management","Marketing","Masters in Digital Marketing","Masters in Engineering","Masters in Finance","Masters in Hospitality Management","Masters in Journalism","Mathematics","Mechanical Engineering","Media and Communication Studies","Media Studies","Medical","Metallurgy","Modern Languages","Natural Sciences","Pharmacology","Pharmacy","Philosophy","Physics","Politics","Psychology","Public Health","Public Policy","Social Sciences","Sociology","Sport Science","Statistics","Veterinary Science"],
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


// search plugin

(function($) {
	
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