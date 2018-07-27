module BookGroupsHelper
	def extractor(collection)
		col = []
		collection.each do |record|
			col << Group.find_by(id: record[:group_id])
		end
	end
	p col
end