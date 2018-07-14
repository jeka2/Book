json.names do 
	json.array!(@names) do |book|
		json.name book.name
		json.url book_path(book)
	end
end 

json.authors do 
	json.array!(@author) do |book|
		json.author book.author
		json.url book_path(book)
	end
end 
