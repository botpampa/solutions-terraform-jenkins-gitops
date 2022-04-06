# Módulo do Terraform Google Cloud Storage 

Este módulo facilita a criação de um bucket do GCS e a atribuição de permissões básicas para usuários arbitrários.

Os recursos/serviços/ativações/exclusões que este módulo irá criar/acionar são:


- Um bucket do GCS
- Zero ou mais vinculações do IAM para esse bucket

## Compatibilidade

Este módulo destina-se ao uso com o Terraform 0.12.

## Uso

O uso básico deste módulo é o seguinte:

```hcl
module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 1.3"

  name       = "example-bucket"
  project_id = "example-project"
  location   = "us-east1"
  iam_members = [{
    role   = "roles/storage.objectViewer"
    member = "user:example-user@example.com"
  }]
}
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Entradas

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_policy\_only | Habilita o acesso somente da política de bucket a um bucket. | `bool` | `true` | NÃO |
| cors | Configuração de CORS para bucket com estrutura conforme definido em https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket#cors. | `any` | `[]` | NÃO |
| encryption | Uma chave do Cloud KMS que será usada para criptografar objetos inseridos neste bucket | <pre>object({<br>    default_kms_key_name = string<br>  })</pre> | `null` | NÃO |
| force\_destroy | Ao excluir um bucket, esta opção booleana excluirá todos os objetos contidos. Se for false, o Terraform não conseguirá excluir buckets que contenham objetos. | `bool` | `false` | NÃO |
| iam\_members | A lista de membros do IAM para conceder permissões no bucket. | <pre>list(object({<br>    role   = string<br>    member = string<br>  }))</pre> | `[]` | NÃO |
| labels | Um conjunto de pares de rótulos de chave/valor para atribuir ao bucket. | `map(string)` | `null` | NÃO |
| lifecycle\_rules | A configuração das regras de ciclo de vida do bucket. | <pre>list(object({<br>    # Objetos com chaves:<br>    # - type - O tipo de ação desta regra do ciclo de vida. valores suportados: Delete and SetStorageClass.<br>    # - storage_class - (Obrigatório se o tipo de ação for SetStorageClass) A classe de armazenamento de destino dos objetos afetados por esta regra de ciclo de vida.<br>    ação = any<br><br>    # Objeto com chaves:<br>    # - age - (Optional) Minimum age of an object in days to para atendar a essa condição.<br>    # - created_before - (Opcional) Data de crição d eum objeto no RFC 3339 (e.g. 2017-06-13) to satisfy this condition.<br>    # - with_state - (Optional) Combine com objetos ativos e/ou arquivados. Os valores suportados incluem: "LIVE", "ARCHIVED", "ANY".<br>    # - matches_storage_class - (Opcional) Classe de armazenamento de objetos para satisfazer esta condição. Os valores suportados incluem: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, STANDARD, DURABLE_REDUCED_AVAILABILITY.<br>    # - num_newer_versions - (Opcional) Relevante apenas para objetos com versão. O número de versões mais recentes de um objeto para atender a essa condição.<br>    condição = any<br>  }))</pre> | `[]` | NÃO |
| location | A localização DO bucket. | `string` | n/a | SIM |
| log\_bucket | O bucket que receberá objetos de log. | `string` | `null` | NÃO |
| log\_object\_prefix |O prefixo do objeto para objetos de log. Se não for fornecido, por padrão, o GCS o definirá com o nome deste bucket | `string` | `null` | NÃO |
| name | O nome do bucket. | `string` | n/a | SIM |
| project\_id | O ID do projeto no qual criar o bucket. | `string` | n/a | SIM |
| retention\_policy | Configuração da política de retenção de dados do bucket para quanto tempo os objetos no bucket devem ser retidos. | <pre>object({<br>    is_locked        = bool<br>    retention_period = number<br>  })</pre> | `null` | NÃO |
| storage\_class | A classe de armazenamento do novo bucket. | `string` | `null` | NÃO |
| versioning | Enquanto definido como verdadeiro, o controle de versão está totalmente ativado para este bucket. | `bool` | `true` | NÃO |
| website | Mapa de valores do site. Atributos compatíveis: main\_page\_suffix, not\_found\_page | `map(any)` | `{}` | NÃO |

## Saídas

| Name | Description |
|------|-------------|
| bucket | bucket que foi criado |


