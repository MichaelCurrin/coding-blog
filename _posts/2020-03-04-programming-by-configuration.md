---
title: Programming by configuration
description: 'About declarative programming and the use of configs for managing systems '

---
It is becoming more popular to use systems which use a config to define how your application should run or how the infrastructure (such as a website or monitor) should be setup. This is declarative programming which means you don't have to spend time writing step-by-step code which would probably be more detailed and error-prone.

### Config-based systems

Below is a list of systems I have worked with or read about which use config files to manage state (such as deploying and running a web application).

* AWS infrastructure management
  - DNS and Cloudfront (cache). 
  - Configuration is managed by a directory Terraform files. Which includes `.tf` and `.tfvar` files, depending how you do it.
* DataDog synthetic tests
  - Cloud monitoring as a service.
  - Configuration is managed by a directory Terraform files.
  - See [datadoghq.com/](https://www.datadoghq.com/).
* Containers
  * Docker containers 
    - `Dockerfile`, `docker-compose.yml`.
  * Kubernetes (for deploying containers) 
    - YAML file. 
    - See [declarative config](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/ "https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/") on the Kubernetes docs.
  * Helm 
    - YAML file. This config is known as a "Helm chart". 
    - See [Getting started](https://helm.sh/docs/chart_template_guide/getting_started/) for example files and layout. See also [helm.sh](https://helm.sh/) homepage.
* Deploys
  * CircleCI
    - `config.yml` file.
    - For Continuous Integration / Continuous Deplomyments (CI/CD).
    - See [circleci.com/](https://circleci.com/).
  * BuildKite
    - YAML file configs.
    - See [buildkite.com](https://buildkite.com)
    - Deploy applications including running tests and building containers.
  * Github Pages 
    - `_config.yml`. 
    - This describes attributes like the title, URL, theme, Jekyll plugins. Locally you might use a `Gemfile`, but the config itself is sufficient for deploying remotely.  See [Github Pages](https://pages.github.com/).
  * Netlify 
    - `netlify.toml`. 
    - Netlify is similar to Github Pages but allows more fine-grained control. You can use the config to set similar details but also custom build commands (such as using _npm_, _Hugo_ or _Gatsby_). While you can set details through the Netlify UI, having it in a config file makes it easier to manage, especially when setting the website up a second time using the same details as before. See [Netlify](https://netlify.com).
  * Github Actions 
    - `.github/workflows/action-name.yml`.
    - See [Actions](https://github.com/features/actions) page on Github.
    - Can be used running automated tests and publishing a package or deploying. This could be for a Ruby or Python or Github Pages project for example. It can also be used for automation like sending a tweet or maintaining a Github repo with a bot.
* Managing servers
  * Puppet 
    - `puppet.conf`. 
    - See [puppet docs](https://puppet.com/docs/puppet/latest/config_file_main.html).
  * Ansible 
    - `playbook.yml`. 
    - See [Ansible setup on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-automate-initial-server-setup-on-ubuntu-18-04) tutorial.
  * Chef 
    - `.chef/knife.rb`. 
    - See [Beginners guide to Chef](https://www.linode.com/docs/applications/configuration-management/beginners-guide-chef/) blog post.

### Other declarative systems

Here are some other forms of programming which are not config-based but still use declarative logic, or manage tasks or state at a high-level.

* Jenkins _Pipeline_ 
  - `Jenkinsfile` or `pipeline.gvy`. This runs in the Groovy language (built on Java) typically on a Jenkins server. This is a way of running named items in a sequence and is useful for deploying to or backing up, especially to multiple servers. You can run groovy scripts and shell commands in the file. See [Pipeline](https://jenkins.io/doc/book/pipeline/)  doc or [Creating your first Pipeline](https://jenkins.io/doc/pipeline/tour/hello-world/).
* Python _Fabric_ 
  - `fabfile.py` See [fabfile.org](http://www.fabfile.org/ "http://www.fabfile.org/"). Similar to _Pipeline_, Fabric is the Python way of running tasks like shell commands for a deploy.
* React
  - See [reactjs.org](https://reactjs.org/ "https://reactjs.org/"). 
  - This is a JS library with a main advantage managing state, to make DOM manipulations and preserving state might lighter.
* Postgres 
  - A flavor of SQL, Postgres is declarative as the SQL query describes what you want to achieve (selecting, grouping, filtering, ordering) and the server decides how to handle this. In fact, you can run the same query multiple times and depending on things like the number of rows or what indexes are available, it can run different logic behind the scenes for the best performance. See the [EXPLAIN](http://postgresguide.com/performance/explain.html) command.

### Resources

* [Declarative programming](https://en.wikipedia.org/wiki/Declarative_programming) on Wikipedia.
* [Imperative vs Declarative Programming](https://tylermcginnis.com/imperative-vs-declarative-programming/ "https://tylermcginnis.com/imperative-vs-declarative-programming/") blog post.
  > “Imperative programming is like **how** you do something, and declarative programming is more like **what** you do.”
