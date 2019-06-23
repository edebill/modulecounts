class AddCpanSearch < ActiveRecord::Migration[4.2]
  def up
    Repository.create!(:name => "CPAN (search)",
                       :url => "http://search.cpan.org",
                       :regex => ",\\s+(\\d+)\\sDistributions")
  end

  def down
    Repository.where(:name => "CPAN (search)").last.try(:destroy)
  end
end
