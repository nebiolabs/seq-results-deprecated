FactoryGirl.define do
  factory :alignment_metric do
    sequence(:rg_id) { |i| i }
    sequence(:category) {|i| "NUMBER#{1}" }
  end
end