json.names do 
	json.array!(@names) do |book|
		json.name book.name
		json.url book_path(book)
	end
end 

json.authors do 
	json.array!(@authors) do |author|
		json.name author.name
		json.url book_path(book)
	end
end 