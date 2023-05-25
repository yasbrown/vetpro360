<div id="top">
  Having used many practice management softwares in my time as a Veterinary Surgeon, all of them are janky and horrible to use in their own special ways.. I thought I'd try my hand at building my perfect practice management software, with an intuitive user-flow and easy to find buttons..so she says..
  
  <br>
  <br>
  It's a work in progress, we'll see how well I do!
</div>

<br>

<!-- INSTALLATION -->

## Installation

#### Setup

0. In order to run this website locally, you will need to have already installed Yarn and Rails. Check them with:
  

```
$ yarn -v
$ rails --version
```

If no version number is returned, please install [Yarn](https://classic.yarnpkg.com/en/docs/install) and/or [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html) before continuing.

#### Dependencies

1. You'll also need to install all dependencies of the project with:
```
$ bundle install && yarn install
```

The `bundle` command installs all Ruby Gems specified in the Gemfile. The `yarn install` command retrieves all dependencies from the project’s package.json file.
<br> 
<br>

2. Run the following command to create a database, load the schema, and initialize it with the seed data.
```
$ rails db:create db:migrate db:seed
```
 
#### Launch 🚀

Finally! Launch the app by running:

```
$ rails s
```

```
$ yarn build --watch
```

Then go to [localhost:3000](http://localhost:3000/)

<p align="right">(<a href="#top">back to top</a>)</p>
