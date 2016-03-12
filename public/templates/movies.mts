<table class="table table-stripped">
  <thead>
    <tr>
      <th>Title</th>
      <th>Director</th>
      <th>Release year</th>
      <th>Production company</th>
    </tr>
  </thead>
  <tbody>
    {{#movies}}
      <tr>
        <td>{{title}}</td>
        <td>{{director}}</td>
        <td>{{release_year}}</td>
        <td>{{production_company}}</td>
      </tr>
    {{/movies}}
    {{^movies}}
      <tr>
        <td colspan="4" style="text-align:center;">No movies were found.</td>
      </tr>
    {{/movies}}
  </tbody>
</table>
