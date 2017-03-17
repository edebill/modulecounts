class HideGodocAndBower < ActiveRecord::Migration[5.0]
  def change
    r = Repository.where(name: "Bower (JS)").first
    r.hidden = true
    r.save

    r = Repository.where(name: "GoDoc (Go)").first
    r.hidden = true
    r.save
  end
end
