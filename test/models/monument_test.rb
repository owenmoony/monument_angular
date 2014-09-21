require "test_helper"

class MonumentGroupTest< ActiveSupport::TestCase

  setup do
    @name = Faker::Lorem.words(2)
    @group = FactoryGirl.create(:monument_group)
  end

  test 'should create create the monument' do
    monument = Monument.create(group: @group, name: @name)
    assert_equal @group, monument.group
    assert_equal @name, monument.name
  end

  test 'should not create the monument without a group' do
    refute Monument.create(name: @name).valid?
  end

  test 'should have categories' do
    category = FactoryGirl.create(:category)
    monument = Monument.create(group: @group, name: @name, categories: [category])
    assert_equal category, monument.categories.first
  end
end