FactoryGirl.define do
  factory :duplicate_read do
    sequence(:rg_id) {|i| i }
    sequence(:fold_reads) {|i| i }
    fold_unique 1.0
  end
end