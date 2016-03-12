function searchForMovies(productionCompany){
  showMoviesPreloader();

  $.ajax({
    url: moviesPath(productionCompany),
    dataType: 'json'
  }).done(function(movies) {
    loadMovies(movies);
  });
}

function moviesPath(productionCompany){
  var path = '/movies';

  if(0 != productionCompany.length){
    path = path + "?production_company=" + productionCompany;
  }

  return path;
}

function loadMovies(movies){
  $.get('templates/movies.mts', function(template) {
    var rendered = Mustache.render(template, { movies: movies });
    $('#movies').html(rendered);
  });
}

function showMoviesPreloader(){
  $.get('templates/movies_preloader.mts', function(template) {
    var rendered = Mustache.render(template);
    $('#movies').html(rendered);
  });
}

$(document).ready(function(){

  var productionCompanies = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: '/production_companies',
    remote: {
      url: '/production_companies?name=%QUERY',
      wildcard: '%QUERY'
    }
  });

  // Setup typeahead
  typeaheadCtrl = $('.typeahead').typeahead(null, {
    name: 'production-companies',
    source: productionCompanies
  });

  // Hide spinner on request
  typeaheadCtrl.on('typeahead:asyncrequest', function (event, data) {
    $('.typeahead').addClass('typeahead-loading');
  });

  // Hide spinner on receive
  typeaheadCtrl.on('typeahead:asyncreceive', function (event, data) {
    $('.typeahead').removeClass('typeahead-loading');
  });

  // Hide spinner on cancel
  typeaheadCtrl.on('typeahead:asynccancel', function (event, data) {
    $('.typeahead').removeClass('typeahead-loading');
  });

  // Submit on return
  $('.typeahead').keyup(function(e){
    if(e.keyCode == 13){
      searchForMovies(e.currentTarget.value);
    }
  });
});
