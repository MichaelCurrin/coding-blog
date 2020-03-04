---
title: Programming by configuration
description: A collect of systems which you setup using configs rather than code

---
It is becoming more popular to use systems which use a config to define how your application should run or how the infrastructure (such as a website or monitor) should be setup. This is declarative programming which means you don't have to spend time writing step-by-step code which would probably be more detailed and error-prone.

### Config-based systems

Below is a list of systems I have worked with or read about which use config files.

* AWS infrastructure management (DNS and Cloudfront) - managed by a directory Terraform files. Which includes `.tf` and `.tfvar` files, depending how you do it.
* DataDog synthetic tests - same as AWS above.
* Containers
  * Docker containers - `Dockerfile`, `docker-compose.yml`.
  * Kubernetes (for deploying containers) - YAML file. See [declarative config](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/ "https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/") on the Kubernetes docs.
* Websites
  * Github Pages - `_config.yml`. You don't even need a `Gemfile`.
  * Netlify - `netlify.toml.`
* Github actions (such as for running automated tests and publishing a package or deploying) - `.github/workflows/action-name.yml`.
* Managing servers
  * Puppet - `puppet.conf`. See [puppet docs](https://puppet.com/docs/puppet/latest/config_file_main.html).
  * Ansible - `playbook.yml`. See [Ansible setup on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-automate-initial-server-setup-on-ubuntu-18-04) tutorial.
  * Chef - `.chef/knife.rb`. See [Beginners guide to Chef](https://www.linode.com/docs/applications/configuration-management/beginners-guide-chef/) blog post.

### Resources

* [Declarative programming](https://en.wikipedia.org/wiki/Declarative_programming) on Wikipedia.
* [Imperative vs Declarative Programming](https://tylermcginnis.com/imperative-vs-declarative-programming/ "https://tylermcginnis.com/imperative-vs-declarative-programming/") blog post.
  > “Imperative programming is like **how** you do something, and declarative programming is more like **what** you do.”
