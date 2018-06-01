require 'rails_helper'

RSpec.describe User, type: :model do
  describe '検証' do
    let!(:user) { build :user }

    it '値が正常な場合' do
      expect(user.save).to eq(true)
    end

    it '値が異常な場合' do
      user.email = ""
      user.password = ""
      expect(user.save).to eq(false)
      p user.password
      expect(user.errors.messages[:email].present?).to eq(true)
      # expect(user.errors.messages[:password].present?).to eq(true)
    end
   end
end
