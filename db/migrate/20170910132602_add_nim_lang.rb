class AddNimLang < ActiveRecord::Migration[5.1]
		def up
			@repo_name = 'Nimble (Nim)'
			@url = 'https://github.com/nim-lang/nimble/'
			r = Repository.new(:name => @repo_name, :url => @url)
			s = JsonPathArrayLengthSampler.new
			s.data_url = "https://raw.githubusercontent.com/nim-lang/packages/master/packages.json"
			s.path = '$..url'
			s.offset = 0
			r.sampler = s

			r.save!
		end

		def down
			@repo_name = 'Nimble (Nim)'
			r = Repository.where(:name => @repo_name).first
			r.destroy
		end
end
