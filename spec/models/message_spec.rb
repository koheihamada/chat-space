require 'rails_helper'
describe Message do
  describe '#create' do
    context 'メッセージを保存できる場合' do
      it "is valid with a body" do
        message = build(:message)
        expect(message).to be_valid
      end

      it "is valid with a image" do
        message = build(:message)
        expect(message).to be_valid
      end

      it "is valid with image & body" do
        message = build(:message)
        expect(message).to be_valid
      end
    end
    context 'メッセージを保存できない場合' do
      it "is invalid without image nor body" do
        message = build(:message, image: nil, body: nil)
        message.valid?
        expect(message.errors[:body_or_image]).to include( "を入力してください")
      end

      it "is invalid without a group_id" do
        message = build(:message, group_id: :nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it "is invalid without a user_id" do
        message = build(:message, user_id: :nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end

end
