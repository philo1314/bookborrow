module ApplicationHelper

	def full_title(pages_title)
		base_title = "Book Borrow"
		if pages_title.empty?
			base_title
		else
			"#{base_title} | #{pages_title}"
		end
	end

end
