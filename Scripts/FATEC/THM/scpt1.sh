# um comentário em Bash é feito com a hashtag (#)
# um script em Bash sempre começa com a seguinte linha de comando: #!/bin/bash

# Isso serve para que o seu shell (qualquer um que esteja usando) saiba que precisa rodar o arquivo usando o bash no terminal (CMD)

#Assume-se que o leitor já tenha um conhecimento prévio de Linux. Se não tiver, passe pelos Fundamentos de Linux de outro roadmap.

#Não se incluirá o '#!/bin/bash' no começo dos scripts de aula, pois assume-se que todos os terão.
#Para rodar o script devemos dar permissão para ele como o comando: chmod +x seuarquivo.sh ------ e o executamos com o './'; Exemplo: ./seuarquivo.sh

name="Jammy" #sem espaços, diferente do restante das LPs
echo $name

# Para depurar o arquivo (debugging) é possível usar o comando -x, no arquivo todo ou em partes dele. Para depurar partes do arquivo bash, usa-se o comando set -x (para o começo) e set +x (para o final da parte que se quer depurar)

#-------------------------------------
# Parâmetros: existem várias formas, mas geralmente eles vêm com o prefixo '$' porque um parâmetro ainda é uma variável.

name=$1 #diferente das outras linguagens, o bash não aceita espaços nas declarações de variáveis
echo $name

#se quiséssemos o segundo parâmetros em vez do primeiro, é só colocar um $2, então name=$2

#arrays são usados para armazenar vários pedaços de informação em uma variável, que pode ser extraídos usando um índice. São escritas desta forma: var[posição_do_índice]

#os arrays começam na posição 0 e não na posição 1. 
transport=('car' 'train' 'bike' 'bus')
echo "${transport[0]}" #que sintaxe de merda kkkkk
echo "${transport[3]}"

unset transport[0] #o comando unset deleta a posição do array desejada. Neste cado, o elemento de posição zero.
transport[1] = 'trainride' #o comando 'trainride' altera o elemento do array. Então:
echo "${transport}" # car trainride bike bus




# if [alguma coisa] else
#then
#    alguma coisa
#else
#    outra coisa
#fi


count=10
if [$count -eq 10] #aqui também poderia ser escrito como $count=10
then
    echo "true"
else
    echo "false"
fi #fi neste caso é o contrário de 'if', que marca o fim do loop

#operadores:
# -ne (not equal)
# -eq (equal)
# -gt (greater than)
# -lt (less than)
# -ge (greater than or equal)
# -le (less than or equal)
# -and (and)
# -or (or)

value="guessme"
guess=$1
if ["$value"="$guess"]
    then
echo "São iguais"
else
echo "Não são iguais"
fi