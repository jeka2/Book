document.addEventListener("turbolinks:load", function(){

	$input = $("[data-behavior='autocomplete']")

	var options = {
		getValue: "name",
		url: function(search) {
			return "/search.json?q=" + search;
		},
		categories: [
			{
				listLocation: "names",
				header: "<strong>Books</strong>"
			},
			{
				listLocation: "authors",
				header: "<strong>Authors</strong>"
			}
		],
		list: {
			onChooseEvent : function() {
				var url = $input.getSelectedItemData().url;
				$input.val('');
				Turbolinks.visit(url);
			}
		}
	}

	$input.easyAutocomplete(options);
});