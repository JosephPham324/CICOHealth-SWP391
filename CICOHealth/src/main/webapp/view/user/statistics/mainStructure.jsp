<main>
  <div class="choices">
    <label for="display-type">Display Type:</label>
    <select id="display-type">
      <option value="table">Table</option>
      <option value="chart">Chart</option>
    </select>

    <label for="data">Data:</label>
    <select id="data">
      <option value="data-1">Data 1</option>
      <option value="data-2">Data 2</option>
      <option value="data-3">Data 3</option>
    </select>

    <label for="start-date">Start Date:</label>
    <input type="date" id="start-date" />

    <label for="end-date">End Date:</label>
    <input type="date" id="end-date" />
  </div>

  <div id="statistics-container">
    <div class="statistics-table"></div>
    <div class="statistics-chart">
      <canvas id="statistics-chart" width="400" height="400"></canvas>
    </div>
  </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.2/dist/chart.min.js"></script>
