FactoryGirl.define do
  factory :gc_bias do
    sequence(:rg_id) {|i| i }
    sequence(:pct_gc) {|i| i }
    num_reads 2890
    num_windows 132990
    mean_base_quality 10
    normalized_coverage 0.161646
    error_bar_width 0.003007
  end
end