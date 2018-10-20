class BansController < ApplicationController

	def index
	
	end

	def search
		h = Hash.new{ |hsh,key| hsh[key] = [] }
		BanStorage.delete_all
		banned_names = []
		user_names = User.all.ransack(username_cont: params[:q]).result
		Ban.all.each{ |ban| h[ban.user_id].push(ban.group_id) }
		h.each do |key, value|
			banned_names << User.find(key).username
			BanStorage.create!(user_id: key, group_hash: value)
		end
		banned_names.uniq!
		@banned_users = user_names.where(username: banned_names)
	end

	
	def create

	end

	def destoy

	end

	def list

	end
end