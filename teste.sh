#!/bin/bash
echo "Hoje é  $(date)"
echo -e "/n Coloque o caminho do seu diretório: " 
read -r the_path

if [ -d "$the_path" ]; then
    echo -e "/nSeu caminho contém os seguintes arquivos e pastas: "
    ls "the_path"
else
    echo -e "O caminho fornecido não é um diretório válido."
fi 