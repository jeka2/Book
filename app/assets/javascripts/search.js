document.addEventListener("turbolinks:load", function(){
	$input = $("#search")

	var options = {
		getValue: "name",
		url: function(search) {
			return "/search.json?q=" + search;
		},
		categories: [
			{
				listlocation: "names",
				header: "<strong>Book</strong>"
			},
			{
				listlocation: "authors",
				header: "<strong>Author</strong>"
			}
		],
		list: {
			onChooseEvent : function() {
				var url = $input.getSelectedItemData().url;
				console.log(url);
			}
		}
	}

	$input.easyAutocomplete(options);
});