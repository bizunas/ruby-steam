Spec::Matchers.define :be_from_list do |items|
  match do |object|
    items.include?(object)
  end
end

Spec::Matchers.define :be_more_than do |expected|
  match do |actual|
    actual > expected
  end
end