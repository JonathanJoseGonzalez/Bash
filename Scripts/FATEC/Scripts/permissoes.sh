#Patrick Hiroshi Katsuta
#Jonathan José Gonzalez

#!/bin/bash
clear
ARQS_RISCO="/etc/passwd /etc/shadow /etc/group /etc/gshadow /etc/sudoers"

echo "Este é um simples programa para analisar permissões de arquivos de sistema."

for ARQ in $ARQS_RISCO
do
    if [ -e $ARQ ]; then #a flag -e verifica se o diretório existe
        PERMISSOES=$(stat -c "%a" $ARQ) #o comando stat é usado para exibir o status de um arquivo; a flag -c "%a" é uma opção de saída personalizada (no caso o formato octal)
        PERMISSOES_IDEAIS=600

        case $ARQ in
            "/etc/passwd")
                PERMISSOES_IDEAIS=644
                ;;
            "/etc/group")
                PERMISSOES_IDEAIS=644
                ;;
            "/etc/shadow" | "/etc/gshadow" | "/etc/sudoers")
                PERMISSOES_IDEAIS=600
                ;;
        esac

        printf "\n$ARQ --> Permissões atuais: $PERMISSOES"
        printf "\nPermissões ideais: $PERMISSOES_IDEAIS"

        if [ "$PERMISSOES" -ne "$PERMISSOES_IDEAIS" ]; then #a flag -ne significa 'not equal'
            echo -e "\nAlerta: Permissões incorretas em $ARQ"
            echo "Deseja corrigir as permissões para $PERMISSOES_IDEAIS? (s/N)"
            read -r resposta # a flag -r diz para tratar os caracteres de barra invertida literalmente. 
            if [[ "$resposta" =~ ^[sS]$ ]]; then 
#o bloco condicional é escrito com colchetes duplos, diferente dos parênteses simples usados em outras linguagens; o operador '=~' em Bash é equivalente ao '==' em outras linguagens; o '^' indica o começo da String (similar ao (0) em Java e outras linguagens), o 'sS' entre colchetes ([sS]) indica que qualquer um dos caracteres deve estar presente. O '$' indica o fim da String.
                sudo chmod $PERMISSOES_IDEAIS "$ARQ"
                echo "Permissões ajustadas para $PERMISSOES_IDEAIS em $ARQ"
            else
                echo "Permissões não alteradas em $ARQ"
            fi
        else
            echo "Permissões corretas em $ARQ"
        fi
    else
        echo "Arquivo $ARQ não existe"
    fi
    echo ""
done
