FactoryGirl.define do
  factory :base_bias do
    sequence(:rg_id) {|i| i }
    sequence(:read_position) {|i| i }
    num_a 109548751
    num_c 65783940
    num_g 64237662
    num_t 76338722
    num_n 157197
    num_x 0
  end
end