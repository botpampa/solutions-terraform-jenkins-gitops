/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*****************************************
  Locals
 *****************************************/
locals {
  bucket_name = "e-bucket-${var.environment}"
}

/*****************************************
  Google Provider Configuration
 *****************************************/
provider "google" {
  project     = "livello-${var.environment}"
  region      = "us-central1"
}


module "cloud-storage" {
     source        = "../../example-create/cloud-storage"
     project_id    = "livello-${var.environment}"
     name_id       = local.bucket_name
     location_id   = "us-central1"
}



