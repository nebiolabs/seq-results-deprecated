FactoryGirl.define do
  factory :insert_size do
    sequence(:rg_id) {|i| i }
    sequence(:insert_size) {|i| i }
    fr_count 1
  end
end