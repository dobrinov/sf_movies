# SF Movies
Find a movie by production company.

![Build Status](https://circleci.com/gh/dobrinov/sf_movies.svg?style=shield&circle-token=:circle-token)

## Demo
http://ddsfmovies.herokuapp.com/

## Stack
<table align="center">
  <tr>
    <th rowspan="2">Frontend</th>
    <td>&nbsp;</td>
    <td>Twitter Typeahead</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Mustache</td>
    <td>jQuery</td>
    <td>Twitter Bootstrap</td>
  </tr>
  <tr>
    <th rowspan="3">Backend</th>
    <td colspan="3">Puma</td>
  </tr>
  <tr>
    <td colspan="3">Sinatra</td>
  </tr>
  <tr>
    <td colspan="3">Ruby</td>
  </tr>
</table>

#### Frontend
* **[Mustache](http://mustache.github.io/)** - JavaScript logicless template engine.
* **[Twitter Typeahead](https://twitter.github.io/typeahead.js/)** - JavaScript text autocompletion library.
* **[jQuery](https://jquery.com/)** - Javascript library.
* **[Twitter Bootstrap](http://getbootstrap.com/)** - HTML, CSS, and JS framework.

#### Backend
* **[Puma](http://puma.io/)** - Concurrent Ruby web server with small memory footprint. Also it is the one recommended by Heroku.
* **[Sinatra](http://www.sinatrarb.com/)** - Web application DSL for Rack applications. I have 4,5 years of experience with Rails which is Rack based web framework too, but I am using pure Sinatra for the first time. Using Rails was going to be an overkill for such a task.
* **[Ruby](https://www.ruby-lang.org/)** - Dynamic open source programming language. I have 4,5 years of experience with it. I decided to use this language mainly because I have a lot of experience with it.

## Development
Install required gems:
```
bundle install
```

Start Puma:
```
puma
```

Open a browser:
```
http://localhost:9292/
```

## Deployment
### Production
```
git push heroku master
```
