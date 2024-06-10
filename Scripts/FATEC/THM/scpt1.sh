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
# Parâmetros: