json.names do 
	json.array!(@names) do |book|
		json.name book.name
		json.url book_path(book)
	end
end 

