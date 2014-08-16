FactoryGirl.define do
  factory :bed_coverage do
    sequence(:rg_id) {|i| i }
    sequence(:bed_id) {|i| i }
  end
end