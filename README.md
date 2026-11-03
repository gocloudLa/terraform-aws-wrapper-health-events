# Standard Platform - Terraform Module 🚀🚀
<p align="right"><a href="https://partners.amazonaws.com/partners/0018a00001hHve4AAC/GoCloud"><img src="https://img.shields.io/badge/AWS%20Partner-Advanced-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Partner"/></a><a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-green?style=for-the-badge&logo=apache&logoColor=white" alt="LICENSE"/></a></p>

Welcome to the Standard Platform — a suite of reusable and production-ready Terraform modules purpose-built for AWS environments.
Each module encapsulates best practices, security configurations, and sensible defaults to simplify and standardize infrastructure provisioning across projects.

## 📦 Module: Terraform AWS Health Events Module
<p align="right"><a href="https://github.com/gocloudLa/terraform-aws-wrapper-health-events/releases/latest"><img src="https://img.shields.io/github/v/release/gocloudLa/terraform-aws-wrapper-health-events.svg?style=for-the-badge" alt="Latest Release"/></a><a href=""><img src="https://img.shields.io/github/last-commit/gocloudLa/terraform-aws-wrapper-health-events.svg?style=for-the-badge" alt="Last Commit"/></a><a href="https://registry.terraform.io/modules/gocloudLa/wrapper-health-events/aws"><img src="https://img.shields.io/badge/Terraform-Registry-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Registry"/></a></p>
The Terraform Wrapper for Health Events captures events from the AWS Health Dashboard, allowing the detection of issues, scheduled changes, and other notifications at the account level. It uses EventBridge rules to capture these events into an SNS and then sends them to a Lambda to process the message.

### ✨ Features




## 🚀 Quick Start
```hcl
health_events_parameters = {
  enable = true # default false
  # email  = "xxxxxx@gmail.com"
  # sns_topics_targets = []
  # excluded_event_type_codes = ["AWS_VPN_REDUNDANCY_LOSS", "AWS_ECS_TASK_PATCHING_RETIREMENT"]
  # excluded_services = ["VPN", "ECS"]
}
```


## 🔧 Additional Features Usage



## 📑 Inputs
| Name                      | Description                                            | Type     | Default   | Required |
| ------------------------- | ------------------------------------------------------ | -------- | --------- | -------- |
| enable                    | Enable or disable the creation of Health notifications | `bool`   | `false`   | no       |
| event_bus_name            | Name of the EventBridge Bus (if a custom one is used)  | `string` | `default` | no       |
| sns_topics_targets        | List of sns topics targets                             | `list`   | `[]`      | no       |
| email                     | Email address to receive AWS Health notifications      | `string` | `null`    | no       |
| excluded_event_type_codes | List of event type codes to exclude from notifications | `list`   | `[]`      | no       |
| excluded_services         | List of services to exclude from notifications         | `list`   | `[]`      | no       |
| tags                      | A map of tags to assign to resources.                  | `map`    | `{}`      | no       |








---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 