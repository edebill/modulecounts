class JuliaPagination < ActiveRecord::Migration[5.2]
  def change
    r = Repository.find_by(name: "Julia")
    new_sampler = JsonHashKeyCountSampler.new(data_url: "https://pkg.julialang.org/docs/pkgs.json",
                                              offset: -4)
    r.sampler = new_sampler
  end
end
