#!bin/bash

echo "Olá, este é um script simples que cria usuários e suas respectivas senhas."
echo -e "Por padrão deste exercício, as senhas criadas seguirão este formato: x1000 até 'x'(1000+n)"
echo -e "/n Quantos usuários deseja criar?"
read num_usuarios

for ((i=0; i<num_usuarios; i++)) do
    echo "Digite o nome do usuário $((i+1)):"
    read nome
    sudo useradd -m -s /bin/bash "$nome" #-m cria um diretório home para o usuário, -s /bin/bash define o shell padrão para o usuário (no caso o Bash)
    senha = "x$((1000+i))"
    echo "$nome: $senha" | sudo chpasswd
    echo ""Usuário $nome criado com sucesso com a senha padrão $senha."
done