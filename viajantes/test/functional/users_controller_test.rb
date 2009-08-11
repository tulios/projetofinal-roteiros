require File.dirname(__FILE__) + '/../test_helper'
require 'users_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class UsersControllerTest < ActionController::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.

  def setup
    @controller = UsersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  test "Deveria carregar a tela de sign up" do
    # Verifica se o controlador respondeu sucesso
    get :new
    assert_response :success

		# Verifica que instanciou o usuario
    assert_not_nil assigns(:user)
  end

  test "Deveria permitir o cadastro de um novo usuario" do
    assert_difference 'User.count' do
		  # Verifica que o controlador criou um novo e redirecionou para o lugar certo
  		create_user
      assert_redirected_to "/"
    end
  end

  test "Deveria obrigar o preenchimento do login no cadastro" do
    assert_no_difference 'User.count' do
      create_user(:login => nil)
      assert assigns(:user).errors.on(:login)
      assert_response :success
    end
  end

  test "Deveria obrigar o preenchimento da senha no cadastro" do
    assert_no_difference 'User.count' do
      create_user(:password => nil)
      assert assigns(:user).errors.on(:password)
      assert_response :success
    end
  end

  test "Deveria obrigar o preenchimento da confirmacao da senha no cadastro" do
    assert_no_difference 'User.count' do
      create_user(:password_confirmation => nil)
      assert assigns(:user).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  test "Deveria obrigar o preenchimento do email no cadastro" do
    assert_no_difference 'User.count' do
      create_user(:email => nil)
      assert assigns(:user).errors.on(:email)
      assert_response :success
    end
  end
  
  test "Deveria obrigar o preenchimento do sexo no cadastro" do
    assert_no_difference 'User.count' do
      create_user(:sex => nil)
      assert assigns(:user).errors.on(:sex)
      assert_response :success
    end
  end
  
  test "Deveria obrigar o preenchimento da cidade no cadastro" do
    assert_no_difference 'User.count' do
      create_user(:city_id => nil)
      assert assigns(:user).errors.on(:city_id)
      assert_response :success
    end
  end

  test "Deveria obrigar o preenchimento da data de nascimento" do
    assert_no_difference 'User.count' do
      create_user(:birthday => nil)
      assert assigns(:user).errors.on(:birthday)
      assert_response :success
    end
  end
  
  test "Deveria validar o formato do email" do
    assert_no_difference 'User.count' do
      create_user(:email => 'email')
      assert assigns(:user).errors.on(:email)
      assert_response :success
    end
  end

  test "Deveria validar o tamnho do login" do
    assert_no_difference 'User.count' do
      create_user(:login => 'eu')
      assert assigns(:user).errors.on(:login)
      assert_response :success
      
       create_user(:login => 'abcdefghijabcdefghijabcdefghijabcdefghijk')
      assert assigns(:user).errors.on(:login)
      assert_response :success
    end
  end
  
  test "Deveria validar o login como unico" do
    assert_difference 'User.count' do
      create_user(:login => 'login')
    end
    
    assert_no_difference 'User.count' do
      create_user(:login => 'login')
      assert assigns(:user).errors.on(:login)
      assert_response :success
    end
  end
  
  test "Deveria validar o email como unico" do
    assert_difference 'User.count' do
      create_user(:email => 'email@gmail.com')
    end
    
    assert_no_difference 'User.count' do
      create_user(:email => 'email@gmail.com')
      assert assigns(:user).errors.on(:email)
      assert_response :success
    end
  end
  
  test "Deveria atualizar a senha do usuario" do
    quentin = users(:quentin)
    senhaCriptografada = quentin.crypted_password
    
    # Altera a senha
    update_user_password quentin.id
    
    # Recupera o usuario com a senha alterada
    quentin = User.find(quentin.id)
    
    # Verifica que as senha são diferentes
    assert_not_same(senhaCriptografada, quentin.crypted_password)
  end
  
   test "Deveria não alterar a senha ao informar a senha atual errada" do
    quentin = users(:quentin)
    senhaCriptografada = quentin.crypted_password
    
    # Altera a senha
    update_user_password quentin.id,{:current_password => "outraSenha"}
    
    # Recupera o usuario com a senha alterada
    quentin = User.find(quentin.id)
    
    # Verifica que as senha não são diferentes
    assert_equal(senhaCriptografada, quentin.crypted_password)
  end
  
  test "Deveria não alterar a senha ao informar a confirmação difedrente da nova senha" do
    quentin = users(:quentin)
    senhaCriptografada = quentin.crypted_password
    
    # Altera a senha
    update_user_password quentin.id,{:password_confirmation => "outraSenha"}
    
    # Recupera o usuario com a senha alterada
    quentin = User.find(quentin.id)
    
    # Verifica que as senha não são diferentes
    assert_equal(senhaCriptografada, quentin.crypted_password)
  end

  protected
    def create_user(options = {})
      userHash = { :login => 'quire',
                 :email => 'quire@example.com', 
                 :password => 'quire', 
                 :password_confirmation => 'quire', 
                 :sex => 'm', 
                 :birthday => '05/05/1985', 
                 :city_id => cities(:one)
               }
      post :create, :user => userHash.merge(options)
    end
    
    def update_user_password(user_id, options = {})
      passwordHash = { 
                  :id => "#{user_id}", 
                  :current_password => 'test',
                  :password => 'test2', 
                  :password_confirmation => 'test2'
                 }
      post :update_password, passwordHash.merge(options)
    end
end
