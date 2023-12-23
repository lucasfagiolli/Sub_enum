#!/bin/bash

#Autor: Q.R.N - Lucas Fg
# Função para exibir mensagem de uso
usage() {
    echo "Uso: $0 <URL alvo> <Arquivo de saída>"
    echo "Exemplo: $0 example.com output.txt"
    exit 1
}

# Verifica se o número correto de argumentos foi passado
if [ "$#" -ne 2 ]; then
    usage
fi

# Verifica se as ferramentas necessárias estão instaladas
command -v subfinder >/dev/null 2>&1 || { echo >&2 "Subfinder não encontrado. Por favor, instale-o."; exit 1; }
command -v amass >/dev/null 2>&1 || { echo >&2 "Amass não encontrado. Por favor, instale-o."; exit 1; }
command -v anew >/dev/null 2>&1 || { echo >&2 "Anew não encontrado. Por favor, instale-o."; exit 1; }
command -v httpx >/dev/null 2>&1 || { echo >&2 "HTTPX não encontrado. Por favor, instale-o."; exit 1; }
command -v chaos >/dev/null 2>&1 || { echo >&2 "HTTPX não encontrado. Por favor, instale-o."; exit 1; }
command -v github-subdomains >/dev/null 2>&1 || { echo >&2 "HTTPX não encontrado. Por favor, instale-o."; exit 1; }
command -v findomain >/dev/null 2>&1 || { echo >&2 "HTTPX não encontrado. Por favor, instale-o."; exit 1; }
command -v haktrails >/dev/null 2>&1 || { echo >&2 "HTTPX não encontrado. Por favor, instale-o."; exit 1; }
command -v haktrails >/dev/null 2>&1 || { echo >&2 "HTTPX não encontrado. Por favor, instale-o."; exit 1; }

# Armazenando a URL alvo e o nome do arquivo de saída
domain="$1"
output_file="$2"

# Enumeração de subdomínios usando subfinder e amass
echo "Enumerando subdomínios..."
subfinder -d $domain -silent -o subdomains.txt
amass enum -d $domain -o - >> subdomains.txt
assetfinder -subs-only $domain >> subdomains.txt
chaos -d $domain >> subdomains.txt
echo "$domain" | haktrails >> subdomains
findomain -t $domain -q


# Remoção de subdomínios duplicados usando anew
echo "Removendo subdomínios duplicados..."
cat subdomains.txt | anew > unique_subdomains.txt

# Verificação de atividade com httpx e salvamento dos subdomínios ativos
echo "Verificando subdomínios ativos..."
cat unique_subdomains.txt | httpx -o active_subdomains.txt

# Salvando os subdomínios ativos no arquivo especificado pelo usuário
cp active_subdomains.txt "$output_file"

# Removendo os arquivos temporários
echo "Limpando arquivos temporários..."
rm subdomains.txt unique_subdomains.txt active_subdomains.txt

echo "Processo concluído. Os subdomínios ativos foram salvos em $output_file e os arquivos temporários foram removidos."
