<div id="chart_div" style="width: 100%; height: 320px;"></div>
<r:script>
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Status', 'Count'],
        ['未練習', ${stats.empty}],
        ['練習中', ${stats.error}],
        ['已完成', ${stats.ok}]
    ]);
    var options = {
        title: null,
        backgroundColor: 'transparent',
        colors: ['#dadada', '#ff0000', '#00ff00'],
        pieSliceTextStyle: {color: 'black'}
    };
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}
</r:script>
