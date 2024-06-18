#Patrick Hiroshi Katsuta
#Jonathan José Gonzalez

#! /bin/bash
escolher_diretório(){
local tipo_dir=$1 #recebe o tipo de diretório (origem ou destino) como argumento
local diretorio #declara uma variável local para armazenar o diretório
echo -e "Deseja [1] criar um novo diretório ou [2] escolher um diretório existente para $tipo_dir?"
read escolha #lê a escolha do usuário

case $escolha in
        1)
          echo "Por favor, insira o nome do novo diretório:
          read novo_diretorio
          mkdir -p "$novo_diretorio"
          diretorio="$novo_diretorio"
          echo "Diretório 'novo_diretorio' criado."
          break
          ;;
        2)
          echo "Por favor, insira o caminho do diretório existente:"
          read dir_existente
          if [ -d "$dir_existente" ]; then
            diretorio="dir_existente"
            echo "Você escolheu o diretório 'dir_existente'."
            break

          else
            echo "O diretório 'dir_existente' não existe. Por favor, tente novamente."
          fi
          ;;
        *)
          echo "Escolha inválida. Por favor, insira 1 ou 2."
esac
done
}

echo "Escolha o diretório de origem para o backup:"
dir_fonte=$(escolher_diretorio "o diretório de origem")

echo "Escolha o diretório de destino para armazenar o backup:"
dir_destino=$(escolha_diretorio "o diretório de destino")

nome_do_backup="Backup_$(date).tar"

tar -czf "$nome_do_backup" -C "$dir_fonte #-c cria um novo arquivo tar, -z comprime com gzip e -f especifica o nome do arquivo
mv "$nome_do_backup" "$dir_destino"

echo "Backup do diretório 'dir_fonte' criado e movido para 'dir_destino/$nome_do_backup'."
