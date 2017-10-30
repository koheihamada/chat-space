require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  # userをcreateし、let内に格納


  context 'ログインしている場合' do
    describe 'GET #index' do
      before do
        login_user user
        # controller_macros.rb内のlogin_userメソッドを呼び出し
      end
      it "アクション内で定義しているインスタンス変数がある" do
        group = create(:group)
        get :index, params: { group_id: group.id }
        expect(assigns(:message)).to be_a_new(Message)
      end

      it ':indexテンプレートを表示すること' do
        group = create(:group)
        get :index, params: { group_id: group.id}
        expect(response).to render_template :index
      end
    end
  end

  context 'ログインしていない場合' do
    describe 'GET #index' do
      it "意図したビューにリダイレクトできているか" do
        group = create(:group)
        get :index, params: {group_id: group.id}
        expect(response).to redirect_to user_session_path
      end
    end
  end


  context 'メッセージを作成するアクション'do
    context 'ログインしているかつ、保存に成功した場合' do
      describe 'POST #create' do
        before do
          login_user user
          # controller_macros.rb内のlogin_userメソッドを呼び出し
        end
        it 'メッセージの保存はできたのか' do
          group = create(:group)
          message = create(:message)
          expect{ post :create,  params: {message: attributes_for(:message), group_id: group.id}}.to change(Message, :count).by(1)
        end

        it '意図した画面に遷移しているか(index)' do
          group = create(:group)
          message = create(:message)
          post :create,  params: {message: attributes_for(:message), group_id: group.id}
          expect(response).to redirect_to group_messages_path
        end
      end
    end

    context 'ログインしているが、保存に失敗した場合' do
      describe 'POST #create' do
        before do
          login_user user
          # controller_macros.rb内のlogin_userメソッドを呼び出し
        end
        it 'メッセージの保存は行われなかったか' do
          group =create(:group)
          message = create(:message)
          expect{ post :create,  params: {message: attributes_for(:message, body: nil, image: nil), group_id: group.id}}.not_to change(Message, :count)
        end

        it '意図したビューが描画されているか' do
          group = create(:group)
          message = create(:message)
          post :create,  params: {message: attributes_for(:message, body: nil, image: nil), group_id: group.id}
          expect(response).to render_template :index
        end
      end
    end

    context 'ログインしていない場合' do
      describe 'POST #create' do
        it '意図した画面にリダイレクトできているか' do
          group = create(:group)
          message = create(:message)
          post :create,  params: {message: attributes_for(:message), group_id: group.id}
          expect(response).to redirect_to user_session_path
        end
      end
    end
  end

end
