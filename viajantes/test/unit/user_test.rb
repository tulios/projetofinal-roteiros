require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead.
  # Then, you can remove it from this and the functional test.

  test "Deveria criar um usuario" do
    assert_difference 'User.count' do
      user = create_user
      assert !user.new_record?, "#{user.errors.full_messages.to_sentence}"
    end
  end

  test "Deveria obrigar a preencher o login" do
    assert_no_difference 'User.count' do
      u = create_user(:login => nil)
      assert u.errors.on(:login)
    end
  end

  test "Deveria obrigar a preencher a senha" do
    assert_no_difference 'User.count' do
      u = create_user(:password => nil)
      assert u.errors.on(:password)
    end
  end

  test "Deveria obrigar a preencher a confirmacao da senha" do
    assert_no_difference 'User.count' do
      u = create_user(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end

  test "Deveria obrigar a preencher o email" do
    assert_no_difference 'User.count' do
      u = create_user(:email => nil)
      assert u.errors.on(:email)
    end
  end
  
  test "Deveria obrigar a preencher a cidade" do
    assert_no_difference 'User.count' do
      u = create_user(:city_id => nil)
      assert u.errors.on(:city_id)
    end
  end

  test "Deveria obrigar a preencher o sexo" do
    assert_no_difference 'User.count' do
      u = create_user(:sex => nil)
      assert u.errors.on(:sex)
    end
  end

  
  test "Deveria obrigar a preencher a data de nascimento" do
    assert_no_difference 'User.count' do
      u = create_user(:birthday => nil)
      assert u.errors.on(:birthday)
    end
  end
  
  test "Deveria validar o formato do email" do
    assert_no_difference 'User.count' do
      u = create_user(:email => 'email')
      assert u.errors.on(:email)
    end
    
    assert_difference 'User.count' do
      u = create_user(:email => 'email@gmail.com')
    end    
  end
  
  test "Deveria validar o tamanho da senha" do
    assert_no_difference 'User.count' do
      u = create_user(:password => '123')
      assert u.errors.on(:password)
      
      u = create_user(:password => '12345678901234567890123456789012345678901234567890')
      assert u.errors.on(:password)
    end
  end
  
  test "Deveria validar o tamanho do login" do
    assert_no_difference 'User.count' do
      u = create_user(:login => 'eu')
      assert u.errors.on(:login)
      
      u = create_user(:login => 'abcdefghijabcdefghijabcdefghijabcdefghijk')
      assert u.errors.on(:login)
    end
  end

  test "Deveria validar o login como unico" do
    # Cria um usuario com o login 'login'
    assert_difference 'User.count' do
      u = create_user(:login => 'login')
    end
    
    # Tenta criar um usuário com o mesmo login 'login'
    assert_no_difference 'User.count' do
      u = create_user(:login => 'login')
      assert u.errors.on(:login)      
    end
  end
  
  test "Deveria validar o email como unico" do
    # Cria um usuario com o login 'login'
    assert_difference 'User.count' do
      u = create_user(:email => 'email@gmail.com')
    end
    
    # Tenta criar um usuário com o mesmo login 'login'
    assert_no_difference 'User.count' do
      u = create_user(:email => 'email@gmail.com')
      assert u.errors.on(:email)      
    end
  end

  test "Deveria trocar a senha" do
    quentin = users(:quentin)
    quentin.update_attributes(:password => 'new password', :password_confirmation => 'new password')
    
    assert(quentin.errors.empty?,  quentin.errors.inspect)
    assert_equal users(:quentin), User.authenticate('quentin', 'new password')
  end

  test "Deveria nao trocar o hash da senha" do
    users(:quentin).update_attributes(:login => 'quentin2')
    assert_equal users(:quentin), User.authenticate('quentin2', 'test')
  end

  test "Deveria autenticar o usuario" do
    assert_equal users(:quentin), User.authenticate('quentin', 'test')
  end

  test "Deveria ligar o token de lembrar" do
    users(:quentin).remember_me
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
  end

  test "Deveria desligar o token de lembrar" do
    users(:quentin).remember_me
    assert_not_nil users(:quentin).remember_token
    users(:quentin).forget_me
    assert_nil users(:quentin).remember_token
  end

  test "Deveria lembrar do usuario por 1 semana" do
    before = 1.week.from_now.utc
    users(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert users(:quentin).remember_token_expires_at.between?(before, after)
  end

  test "Deveria lembrar do usuario ate 1 semana" do
    time = 1.week.from_now.utc
    users(:quentin).remember_me_until time
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert_equal users(:quentin).remember_token_expires_at, time
  end

  test "Deveria lembrar do usuario por 2 semanas, valor padrao" do
    before = 2.weeks.from_now.utc
    users(:quentin).remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert users(:quentin).remember_token_expires_at.between?(before, after)
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
    record = User.new(userHash.merge(options))
    record.save
    record
  end
end
