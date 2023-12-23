# Sub_enum
Este script em Bash permite a enumeração de subdomínios de um domínio alvo, verifica a atividade dos subdomínios e salva os ativos em um arquivo.


## Funcionalidades

- Utiliza subfinder, amass, e outras ferramentas para enumerar subdomínios.
- Verifica a atividade dos subdomínios usando httpx.
- Remove subdomínios duplicados e salva os ativos em um arquivo.


## Requisitos

Para executar este script, você precisa ter o Go (Golang) instalado no seu sistema.
Se o Go não estiver instalado, você pode fazer o download e instalar a partir do site oficial: https://go.dev/doc/install

- subfinder - https://github.com/projectdiscovery/subfinder
- amass - https://github.com/owasp-amass/amass
- anew - https://github.com/tomnomnom/anew
- httpx - https://github.com/projectdiscovery/httpx
- chaos - https://github.com/projectdiscovery/chaos-client
- findomain - https://github.com/Findomain/Findomain
- haktrails - https://github.com/hakluke/haktrails
- assetfinder - https://github.com/tomnomnom/assetfinder



## Uso

Execute o script fornecendo a URL alvo e o nome do arquivo de saída: 

Exemplo: ./sub_enum.sh example.com output.txt

## Contribuição

Sinta-se à vontade para contribuir com melhorias ou reportar problemas através de issues ou pull requests.


