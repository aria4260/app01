require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    let!(:user) { build :user }

    it '値が正常な場合' do
      user.password = "hogehoge"
      expect(user.save).to eq(true)
    end

    it '値が異常な場合' do
      user.email = ""
      user.password = ""
      p user.password
      expect(user.save).to eq(false)
      expect(user.errors.messages[:email].present?).to eq(true)
      #expect(user.errors.messages[:password].present?).to eq(true)
    end
  end

  describe 'パスワード暗号化' do
    let!(:user) { build :user }

    it '値が正常な場合' do
      user.password = "hogehoge"
      p user.password_digest
      expect(user.password_digest.present?).to eq(true)
    end

    it '値が異常な場合' do
      p user.password_digest
      expect(user.password_digest.present?).to eq(false)
    end
  end

  describe 'verify_token発行' do
    let!(:user) { build :user }

    it '値が正常な場合' do
      user.password = "hogehoge"
      user.save
      p user.verify_token
      expect(user.verify_token.present?).to eq(true)
    end

    it '値が異常な場合' do
      user.save
      p user.verify_token
      expect(user.verify_token.present?).to eq(false)
    end
  end

  describe 'ユーザー情報更新' do
    let!(:user) { build :user }

    it 'verify_tokenが更新されないこと' do
      user.password = "hogehoge"
      user.save
      p user.name
      update_before = user.verify_token
      user.name = "hoge"
      user.save
      p user.name
      update_after = user.verify_token
      expect(update_after).to eq(update_before)
    end
  end

end
