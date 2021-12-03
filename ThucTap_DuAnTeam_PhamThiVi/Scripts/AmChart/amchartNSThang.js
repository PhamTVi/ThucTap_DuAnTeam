﻿$(document).ready(() => {
    ChartHelper.InitChart();
})
var ChartManager = {
    GetChartData: function () {
        var url = '../HieuXuatCV/loadDGThangLamViec';
        var params = '';
        JsonResult(url, params, onSuccessCallBack, onErrorCallBack);
        function onSuccessCallBack(values) {
            if (values.status) {
                console.log(values.dataList);
                params =`[`
                $.each(values.dataList, (index, item) => {
                    params += `{
                "year": '${item.tenNSu}',
                "soGio": '${item.TBThang}',
                "TBPhanTran":'${item.tongTG}',},`;
                });
                params +=`]`;
            }

        }
        function onErrorCallBack(err) {
            console.log(err);
        }
    }
};
const JsonResult = (url, params, onSuccessCallBack, onErrorCallBack) => {
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'JSON',
        contentType: 'application/json; charset-utf-8',
        data: params,
        success: onSuccessCallBack,
        error: onErrorCallBack
    })
}
var ChartHelper = {
    InitChart: function () {
        ChartHelper.loadChart();
    },
    loadChart: function () {
        am5.ready(function () {

            // Create root element
            // https://www.amcharts.com/docs/v5/getting-started/#Root_element
            var root = am5.Root.new("chartdiv");


            // Set themes
            // https://www.amcharts.com/docs/v5/concepts/themes/
            root.setThemes([
                am5themes_Animated.new(root)
            ]);


            // Create chart
            // https://www.amcharts.com/docs/v5/charts/xy-chart/
            var chart = root.container.children.push(am5xy.XYChart.new(root, {
                panX: false,
                panY: false,
                wheelX: "panX",
                wheelY: "zoomX",
                layout: root.verticalLayout
            }));


            // Add legend
            // https://www.amcharts.com/docs/v5/charts/xy-chart/legend-xy-series/
            var legend = chart.children.push(
                am5.Legend.new(root, {
                    centerX: am5.p50,
                    x: am5.p50
                })
            );
            var data = ChartManager.GetChartData();
            // Create axes
            // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
            var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
                categoryField: "year",
                renderer: am5xy.AxisRendererX.new(root, {
                    cellStartLocation: 0.1,
                    cellEndLocation: 0.9
                }),
                tooltip: am5.Tooltip.new(root, {})
            }));

            xAxis.data.setAll(data);

            var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
                renderer: am5xy.AxisRendererY.new(root, {})
            }));


            // Add series
            // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
            function makeSeries(name, fieldName) {
                var series = chart.series.push(am5xy.ColumnSeries.new(root, {
                    name: name,
                    xAxis: xAxis,
                    yAxis: yAxis,
                    valueYField: fieldName,
                    categoryXField: "year"
                }));

                series.columns.template.setAll({
                    tooltipText: "{name}, {categoryX}:{valueY}",
                    width: am5.percent(90),
                    tooltipY: 0
                });

                series.data.setAll(data);

                // Make stuff animate on load
                // https://www.amcharts.com/docs/v5/concepts/animations/
                series.appear();

                series.bullets.push(function () {
                    return am5.Bullet.new(root, {
                        locationY: 0,
                        sprite: am5.Label.new(root, {
                            text: "{valueY}",
                            fill: root.interfaceColors.get("alternativeText"),
                            centerY: 0,
                            centerX: am5.p50,
                            populateText: true
                        })
                    });
                });

                legend.data.push(series);
            }

            makeSeries("Số giờ", "soGio");
            makeSeries("Trung bình phần trăm", "TBPhanTran");


            // Make stuff animate on load
            // https://www.amcharts.com/docs/v5/concepts/animations/
            chart.appear(1000, 100);

        }); // end am5.ready()
    }
}