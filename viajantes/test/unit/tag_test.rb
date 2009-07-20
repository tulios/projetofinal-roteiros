require 'test_helper'

class TagTest < ActiveSupport::TestCase
 
	test "Deveria criar uma tag" do
		#verifica que um objeto vazio nao e valido
		tag = Tag.new
		assert (not tag.valid?)
		#verifica os erros lancados
		assert_invalidos(tag, [:name])
		
		# O length minimo eh 4
		conteudo = {:name => "IN"} 
		tag = Tag.new(conteudo)
		assert (not tag.valid?)
		#verifica os erros lancados
		assert_invalidos(tag, [:name])		

		# Com nome repetido (em fixture)
		conteudo = {:name => "Aventura"} 
		tag = Tag.new(conteudo)
		assert (not tag.valid?)
		#verifica que lancou erros
		assert_invalidos(tag, [:name])

		# Com nome de tamanho correto
		conteudo = {:name => "NOME"} 
		tag = Tag.new(conteudo)
		assert (tag.valid?)
		#verifica que nao lancou erros
		assert_validos(tag, [:name])	
	end

end
