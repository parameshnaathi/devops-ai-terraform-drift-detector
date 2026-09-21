Build a Terraform Drift Detection platform that continuously compares Terraform state files against actual cloud infrastructure to identify configuration drift.

The system retrieves expected resource metadata from Terraform state and actual resource metadata from cloud provider APIs, normalizes both into a common model, and highlights differences such as deleted resources, modified attributes, and tag changes.

Users can run scans on demand or on a schedule and view drift reports through a simple dashboard, CLI, or JSON output.

The solution should be cloud-agnostic, extensible, and optimized for fast infrastructure visibility without requiring Terraform plan or apply operations.

Let's create a plan first.

# Terraform Drift Detection Architecture

The platform compares infrastructure defined in Terraform state with the
actual state of resources running in the cloud.

## Architecture

```mermaid
flowchart TD

    A[Terraform State<br/>terraform.tfstate]
    B[Cloud Provider<br/>AWS / Azure / GCP]

    A --> C[State Reader]
    C --> D[Resource Extractor]
    D --> E[Expected Resource Model]

    B --> F[Cloud Fetcher]
    F --> G[Resource Extractor]
    G --> H[Actual Resource Model]

    E --> I[Drift Engine<br/>Compare Expected vs Actual]
    H --> I

    I --> J[Report Generator]

    J --> K[Console Output]
    J --> L[JSON Report]



