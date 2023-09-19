## VET_CLINIC_DATABASE

> The project contain database created using a relational database. to store the information for clinic, so you can store the information for all the animals that come and treat in this clinic and the visits, the specializations and the vets there. 
## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<a name="readme-top"></a>
# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 \[VET\_CLINIC\_DATABASE\] ](#-vet_clinic_database-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [🚀 Live Demo ](#-live-demo-)
  - [Getting Started](#getting-started-1)
    - [Requirements](#requirements)
    - [Clone this repository](#clone-this-repository)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
  - [👥 Authors ](#-authors-)
  - [Authors](#authors)
  - [🔭 Future Features ](#-future-features-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 [VET_CLINIC_DATABASE] <a name="about-project"></a>

> Describe your project in 1 or 2 sentences.

**[VET_CLINIC_DATABASE]** is a...

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

> Describe the tech stack and include only the relevant sections that apply to your project.

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

> Describe between 1-3 key features of the application.

- **[key_feature_1]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

> Add a link to your deployed project.

- [Live Demo Link](<replace-with-your-deployment-URL>)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

To get a local copy up and running, follow these steps.
### Requirements
- PostgreSQL server installed and running
- psql installed

### Clone this repository

```bash
$ git@github.com:obibaadoma/Vet_clinic_database.git
$ cd vet_clinic_database
```
1. Connect to your PostgreSQL server with `psql`
```bash
psql
```
2. Create the database `vet-clinic`
```bash
CREATE DATABASE vet-clinic;
```
3. Connect to your database `vet-clinic`
```bash
\c vet-clinic
```

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database.
### Setup

### Install

Install this project with:

### Usage

To run the project, execute the following command:

### Run tests

### Deployment


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

> Mention all of the collaborators of this project.

## Authors

👤 **Derek Akrasi Konadu**

 **GitHub**  | [@githubhandle](https://github.com/obibaadoma)
**Twitter**: [@twitterhandle](https://twitter.com/twitterhandle)
**LinkedIn**: [LinkedIn](https://linkedin.com/in/derek-akrasi-konadu)

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> Describe 1 - 3 features you will add to the project.

- [ ] **[new_feature_1]**
- [ ] **[new_feature_2]**
- [ ] **[new_feature_3]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
