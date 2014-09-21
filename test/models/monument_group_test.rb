require "test_helper"

class MonumentGroupTest< ActiveSupport::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    @name = Faker::Lorem.words(2).join(' ')
  end

  test 'should create create the group' do
    group = MonumentGroup.create(owner: @user, name: @name)
    assert_equal @user, group.owner
    assert_equal @name, group.name
  end

  test 'should not create the group without an owner' do
    refute MonumentGroup.create(name: @name).valid?
  end

  test 'should have monuments' do
    group = MonumentGroup.create!(owner: @user, name: @name)
    group.monuments.create(name: @name)
    assert 1, group.monuments.count
  end
end