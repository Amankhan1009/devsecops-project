# DevSecOps CI/CD Pipeline Project

## Project Overview

This project demonstrates a complete DevSecOps CI/CD pipeline implementation integrating automated security scanning, Infrastructure as Code (IaC) validation, container security scanning, secrets management, Docker containerization, and multi-environment deployment using GitHub Actions.

The pipeline automates:
- Continuous Integration (CI)
- Continuous Deployment (CD)
- Secret scanning
- Container vulnerability scanning
- Infrastructure security scanning
- Docker image creation and deployment
- Multi-environment deployment
- Secrets management

---

# Technologies Used

| Technology | Purpose |
|---|---|
| GitHub Actions | CI/CD Automation |
| Flask | Python Web Application |
| Docker | Containerization |
| DockerHub | Container Registry |
| Gitleaks | Secret Scanning |
| Trivy | Container Vulnerability Scanning |
| Terraform | Infrastructure as Code |
| Checkov | IaC Security Scanning |
| HashiCorp Vault | Secrets Management |
| AWS EC2 | Deployment Environment |

---

# Project Architecture

```text
Developer → GitHub Repository → GitHub Actions Pipeline
                                ↓
                     Security Scanning Stage
              (Gitleaks, Trivy, Checkov)
                                ↓
                       Docker Image Build
                                ↓
                      Push Image to DockerHub
                                ↓
            Deploy to Dev → Staging → Production
                                ↓
                             AWS EC2
```

---

# Project Workflow

## Step 1 — Code Push

The CI/CD pipeline starts automatically whenever code is pushed into the GitHub repository.

---

## Step 2 — GitHub Actions Trigger

GitHub Actions detects the push event and triggers the workflow defined inside:

```bash
.github/workflows/pipeline.yml
```

---

## Step 3 — Dependency Installation

Python dependencies required for the Flask application are installed using:

```bash
pip install -r requirements.txt
```

---

## Step 4 — Secret Scanning using Gitleaks

Gitleaks scans the repository for:
- AWS keys
- API tokens
- passwords
- hardcoded secrets

If secrets are detected, the pipeline fails automatically.

---

## Step 5 — Docker Image Build

Docker builds the Flask application image using the Dockerfile.

Example:

```bash
docker build -t flask-devsecops-app .
```

---

## Step 6 — Container Vulnerability Scanning using Trivy

Trivy scans the Docker image for:
- vulnerable packages
- known CVEs
- insecure dependencies

This helps secure containerized applications.

---

## Step 7 — Infrastructure as Code (IaC) Scanning using Checkov

Terraform configuration files are scanned using Checkov to validate cloud security best practices.

The Terraform code contains AWS S3 bucket configurations with:
- encryption
- versioning
- public access blocking

---

## Step 8 — DockerHub Push

After successful scanning:
- Docker image is tagged
- image is pushed into DockerHub

Example:

```bash
docker push amankhan1009/flask-devsecops-app:latest
```

---

## Step 9 — Multi-Environment Deployment

The application is deployed into multiple environments using Docker containers.

| Environment | Port |
|---|---|
| Development | 5000 |
| Staging | 5001 |
| Production | 5002 |

---

# Secrets Management using HashiCorp Vault

HashiCorp Vault was implemented for centralized secrets management.

Vault securely stored:
- DockerHub credentials
- AWS credentials
- deployment-related secrets

Example commands:

## Start Vault

```bash
vault server -dev
```

## Set Vault Environment Variables

```bash
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='your_root_token'
```

## Store Secrets

```bash
vault kv put secret/devsecops \
DOCKERHUB_USERNAME="username" \
DOCKERHUB_PASSWORD="password"
```

## Retrieve Secrets

```bash
vault kv get secret/devsecops
```

---

# Terraform Infrastructure Configuration

Terraform was used to define AWS S3 infrastructure resources.

Security configurations included:
- KMS encryption
- versioning enabled
- public access block
- policy validation

---

# Security Controls Implemented

## Secret Scanning
Implemented using Gitleaks.

## Container Scanning
Implemented using Trivy.

## IaC Security Scanning
Implemented using Checkov.

## Policy Gates
Pipeline fails automatically if security violations are detected.

## Secrets Management
Implemented using HashiCorp Vault and GitHub Secrets.

---

# GitHub Actions Workflow

The pipeline YAML file contains:
- code checkout
- dependency installation
- secret scanning
- Docker build
- Trivy scanning
- Checkov scanning
- DockerHub push
- multi-environment deployment

Workflow file location:

```bash
.github/workflows/pipeline.yml
```

---

# Challenges Faced

- Gitleaks license and configuration issues
- DockerHub token permission errors
- Vault token configuration issues
- Vault container capability issues
- Checkov policy violations
- Terraform configuration troubleshooting
- Multiple pipeline debugging iterations

---

# Learning Outcomes

Through this project I learned:
- DevSecOps principles
- CI/CD pipeline automation
- Docker containerization
- security scanning integration
- Infrastructure as Code validation
- secrets management
- GitHub Actions workflows
- pipeline troubleshooting
- secure deployment practices

---

# Future Improvements

Future enhancements may include:
- Kubernetes deployment
- Helm charts
- ArgoCD integration
- Dynamic Vault secrets
- Monitoring using Prometheus and Grafana
- Runtime security monitoring
- SIEM integration

---

# Conclusion

This project successfully demonstrates a complete DevSecOps CI/CD pipeline integrating automated security controls, Infrastructure as Code validation, container security scanning, secrets management, and multi-environment deployment.

The project highlights how security can be integrated into every stage of the software development lifecycle using DevSecOps practices.

---

# References

- https://docs.github.com/actions
- https://www.docker.com/
- https://developer.hashicorp.com/vault
- https://aquasecurity.github.io/trivy
- https://www.checkov.io/
- https://gitleaks.io/
- https://developer.hashicorp.com/terraform
