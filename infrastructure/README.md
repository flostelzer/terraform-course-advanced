# Terraform Advanced Course 
This project considers some important aspects in using terraform in large scale projects. Especially, in setup where root and child modules are used. In the following questions are mentioned, which can be answered with this project setup.

## TF Project Structure 
- Which tf files are necessary?
- How to name tf files?
- When to use locals?

## Resource Structure
- How to name tf resources?
- How to structure arguments in tf resources?
- When and how to use "count" and instead when to use "for_each"?
- What is "depends_on" and "lifecycle"?
- What is the use case for implementing "dynamic" in resources?

## Modules
- How to separate tf code?
- What is Azure Verfied Modules?

### Design Child Modules
- What are the characteristics of a child module?
- How to implement variables?
- How to use "terraform test"?

### Versioning
- What is semantic versioning?
- What syntax of versioning tf has?
- How to pin versions?
- How to handle different major versions in child modules?

## Provider
- How to declare a provider in root and child modules?
- What are Aliases and how to use them?

## Terraform State Handling
- How is the interaction between state, code and target platform?
- What is backend and how to use it?
- What can I do with terraform workspaces?

## Terraform State Modification
- Which commands are available to modify tf state?
- Which declarative code is available to modify tf state?

