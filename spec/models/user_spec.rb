require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全項目が存在すれば登録できること' do
       expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
       @user.password = '1234ab'
       @user.password_confirmation = '1234ab'
       expect(@user).to be_valid
      end

      it 'passwordが半角英数字混合なら登録できる' do
       @user.password = '123abc'
       @user.password_confirmation = '123abc'
       expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
       @user.name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailには「@」を含めなければできない' do
       @user.email = '111aaa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    
      it 'passwordが6文字以下では登録できない' do
       @user.password = '00000'
       @user.password_confirmation = '00000'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみでは登録できない' do 
       @user.password = 'aaaaaa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 

      it 'passwordが半角数字のみでは登録できない' do 
       @user.password = '123456'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 

      it 'passwordが全角では登録できない' do 
       @user.password = 'kbc１２３'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 
    end
  end    
end