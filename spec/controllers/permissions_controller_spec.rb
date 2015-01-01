require 'rails_helper'

RSpec.describe PermissionsController, :type => :controller do
  before do
    @user = create(:user)
  end

  describe 'Accessibility' do
    context 'When signed out' do
      before do
        test_signout
      end

      context 'GET new' do
        before { get :new }

        it { expect(response).to redirect_to signin_path }
      end

      context 'POST create' do
        before { post :create, user: {name: 'foo', password: 'bar'} }

        it { expect(response).to redirect_to signin_path }
      end

      context 'GET show' do
        before { get :show, id: 1 }

        it { expect(response).to redirect_to signin_path }
      end

      context 'GET index' do
        before { get :index }

        it { expect(response).to redirect_to signin_path }
      end
    end

    context 'When signed in' do
      before do
        test_signin(@user)
      end

      context 'GET new' do
        before { get :new }

        it { expect(response).to be_success }
      end

      context 'POST create' do
        before { post :create, permission: {name: 'foo', enabled: true} }

        it { expect(response).to be_success }
      end
    end
  end

end
