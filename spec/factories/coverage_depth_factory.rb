FactoryGirl.define do
  factory :coverage_depth do
    sequence(:rg_id) {|i| i }
    sequence(:depth) {|i| i }
    chromosome 'chr1'
    num_bases 249250621
    frac_bases 0.106853
  end
end