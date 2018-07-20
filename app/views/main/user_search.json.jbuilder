json.emails do 
	json.array!(@user) do |user|
		json.email user.email
	end
end 