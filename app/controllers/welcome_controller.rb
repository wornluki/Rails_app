class WelcomeController < ApplicationController
	before_action :find_book

	def index
		@books = Book.all.order("created_at DESC")
	end

	def panel
	end

	private

	def find_book
		@books = Book.order("created_at DESC")
	end
end
