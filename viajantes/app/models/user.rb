require 'digest/sha1'

# User - Usuário
#  
# Este modelo representa os modelos do sistema
#  
# Atributos:
#   String: login (O login do usuário)
#   String: email (O e-mail do usuário)
#   Date: birthday (A data de nascimento do usuário)
#   City: city (A cidade onde o usuário mora)
#		String: sex (O sexo do usuário)
#   String: crypted_password (A senha criptografada do usuário)
# 
class User < ActiveRecord::Base
  
  has_and_belongs_to_many :roles
  belongs_to :city
  
  validates_presence_of     :login, :email, :birthday, :sex, :city_id 
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_format_of 			:email, 	 :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,}\Z)/
  validates_format_of 			:birthday, :with =>  /\A\d{4}\-\d{2}\-\d{2}\Z/
  validates_confirmation_of :password,                   :if => :password_required?
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  before_save 							:encrypt_password
  
  def validate
    if birthday
      
    end
  end
  
  # Retorna true ou false caso o usuário tenha role passada por parâmetro ou não.
  # Retorna sempre true caso o usuário possua a role admin.
  #   
  def has_role?(role_in_question)
    @_list ||= self.roles.collect(&:name)
    return true if @_list.include?("admin")
    (@_list.include?(role_in_question.to_s) )
  end
  # ---------------------------------------
    
	# Atributo com os sexos disponiveis para o cadastro
	#
  @@sexes = {:m => "Masculino", :f => "Feminino"}
  
  # Atributo virtual para a senha não criptografada
  #
  attr_accessor :password

  # Método acessor para o atributo de classe sexes
  #
  def self.sexes
    @@sexes
  end

  # Atributos acessiveis
  #
  attr_accessible :login, :email, :password, :password_confirmation, :sex, :birthday, :city, :city_id

  # Autentica um usuário pelo login ou email e a senha não criptografada.
  # Retorna o usuário ou nil caso não autentique.
  #
  def self.authenticate(login, password)
    u = find(:first, :conditions => ["login = ? or email = ?", login, login])
    u && u.authenticated?(password) ? u : nil
  end

  # Criptograma a senha com o salt
  #
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Criptografa a senha com o usuário salt
  #
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  # Criptograma a senha passada por parâmetro e retorna 
  # a comparação com a senha criptografada do usuário.
  #
  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # Cria e reseta os campos requeridos para lembrar usuários entre browsers clones
  #
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Retorna true se o usuário acabou de ser ativado.
  #
  def recently_activated?
    @activated
  end

  # Compara se o id passado por parâmetro é igual ao id do usuário.
  #
  def me?(user_id)
    id == (Integer user_id)
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
end
