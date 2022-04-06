# Cloud Storage


Criação de `bucket` na Google Cloud Plataform.

Baseado no [módulo gcp-cloud-storage](https://github.com/nikotanaka/terraform-gcp/tree/master/modules/gcp-cloud-storage)

## Comandos

Para provisionar a infraestrutura utilize os seguintes comandos nesse diretório: 

- `terraform init` para inicializar a configuração
- `terraform plan` para ver o plano de execução da infraestrutura
- `terraform apply` para aplicar a construção da infraestrutura
- `terraform destroy` para destruir a infraestrutura

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Entradas

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-------------|------|---------|:--------:|
| project\_id | O ID do projeto no qual deve-se provisionar os recursos. | `string` | n/a | SIM |
| name | O nome do projeto no qual deve-se provisionar os recursos. | `string` | n/a | SIM |
| location | O local do projeto no qual deve-se provisionar os recursos. | `string` | n/a | SIM |

## Saídas

Nenhuma saída.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

