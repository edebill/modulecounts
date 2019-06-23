class AddDrupal < ActiveRecord::Migration[5.0]
  def up
    r = Repository.new(name: repo_name,
                       url: "https://www.drupal.org/project/project_module",
                       graph: false)
    s = RegexSampler.new
    s.data_url = "https://www.drupal.org/project/project_module"
    s.regex = ">([0-9,]+) Modules match your search"
    s.offset = 0
    r.sampler = s

    r.save!
  end

  def down
    r = Repository.where(:name => repo_name).first
    r.destroy
  end

  def repo_name
    "Drupal (php)"
  end
end
