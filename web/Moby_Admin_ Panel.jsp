<%-- 
    Document   : Moby_Admin_ Panel
    Created on : Mar 27, 2015, 9:15:03 PM
    Author     : Sathishka
--%>

<%@page import="DB.UserReg"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Css/bootstrapp.css" rel="stylesheet" type="text/css" />
        <script src="Js/jquery-1.11.1.js"></script>
        <script src="Js/light.js" type="text/javascript"></script>
        <title>Admin panel</title>



        <script type="text/javascript">
            $(document).ready(function() {

                $('#bt').click(function() {
                    $('#content').load('Moby_Admin_ Panel.jsp');
                });

                $('#bt1').click(function() {
                    $('#content').load('Product_Register.jsp');
                });
                $('#bt2').click(function() {
                    $('#content').load('mobyUser_Management.jsp');
                });
                $('#bt3').click(function() {
                    $('#content').load('Moby_Product_Manage.jsp');
                });

            });
        </script>
        <script type="text/javascript">



            // in order to set theme for a chart, all you need to include theme file
            // located in amcharts/themes folder and set theme property for the chart.

            var chart1;
            var chart2;

            makeCharts("light", "#FFFFFF");

            // Theme can only be applied when creating chart instance - this means
            // that if you need to change theme at run time, youhave to create whole
            // chart object once again.

            function makeCharts(theme, bgColor, bgImage) {

                if (chart1) {
                    chart1.clear();
                }
                if (chart2) {
                    chart2.clear();
                }

                // background
                if (document.body) {
                    document.body.style.backgroundColor = bgColor;
                    document.body.style.backgroundImage = "url(" + bgImage + ")";
                }

                // column chart
                chart1 = AmCharts.makeChart("chartdiv1", {
                    type: "serial",
                    theme: theme,
                    dataProvider: [{
                            "year": 2005,
                            "income": 23.5,
                            "expenses": 18.1
                        }, {
                            "year": 2006,
                            "income": 26.2,
                            "expenses": 22.8
                        }, {
                            "year": 2007,
                            "income": 30.1,
                            "expenses": 23.9
                        }, {
                            "year": 2008,
                            "income": 29.5,
                            "expenses": 25.1
                        }, {
                            "year": 2009,
                            "income": 24.6,
                            "expenses": 25
                        }],
                    categoryField: "year",
                    startDuration: 1,
                    categoryAxis: {
                        gridPosition: "start"
                    },
                    valueAxes: [{
                            title: "Million USD"
                        }],
                    graphs: [{
                            type: "column",
                            title: "Income",
                            valueField: "income",
                            lineAlpha: 0,
                            fillAlphas: 0.8,
                            balloonText: "[[title]] in [[category]]:<b>[[value]]</b>"
                        }, {
                            type: "line",
                            title: "Expenses",
                            valueField: "expenses",
                            lineThickness: 2,
                            fillAlphas: 0,
                            bullet: "round",
                            balloonText: "[[title]] in [[category]]:<b>[[value]]</b>"
                        }],
                    legend: {
                        useGraphSettings: true
                    }

                });

                // pie chart
                chart2 = AmCharts.makeChart("chartdiv2", {
                    type: "pie",
                    theme: theme,
                    dataProvider: [{
                            "country": "Czech Republic",
                            "litres": 156.9
                        }, {
                            "country": "Ireland",
                            "litres": 131.1
                        }, {
                            "country": "Germany",
                            "litres": 115.8
                        }, {
                            "country": "Australia",
                            "litres": 109.9
                        }, {
                            "country": "Austria",
                            "litres": 108.3
                        }, {
                            "country": "UK",
                            "litres": 65
                        }, {
                            "country": "Belgium",
                            "litres": 50
                        }],
                    titleField: "country",
                    valueField: "litres",
                    balloonText: "[[title]]<br><b>[[value]]</b> ([[percents]]%)",
                    legend: {
                        align: "center",
                        markerType: "circle"
                    }
                });

            }






        </script>        
    </head>
    <body background="Images/backimage.jpg" background-repeat: repeat-x; >
        <%

            UserReg ur = (UserReg) session.getAttribute("s1");
            if (ur == null) {
                response.sendRedirect("Homepage.jsp");
            } else {

        %>
        <div class="container" >
            <div class="row">
                <div class="col-sm-3 col-md-3">
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span ">
                                        </span>Admin Menu</a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <ul class="list-group">
                                    <li class="list-group-item"><span ></span><a href="" id="bt">Dashboard</a>

                                    </li>

                                    <li class="list-group-item" ><span ></span><a href="#" id="bt1">Product Register</a></li>

                                    <li class="list-group-item"><span ></span><a href="#" id="bt2">User Management</a></li>

                                    <li class="list-group-item"> <span ></span><a href="#" id="bt3">Product Manage</a></li>

                                </ul>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="glyphicon glyphicon-file">
                                        </span>Reports</a>
                                </h4>
                            </div>
                            <div id="collapseFour" class="panel-collapse collapse">
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        Cras justo odio
                                    </a>
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            Cras justo odio
                                        </a>

                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive"><span class="glyphicon glyphicon-heart">
                                        </span>Reports</a>
                                </h4>
                            </div>
                            <div id="collapseFive" class="panel-collapse collapse">
                                <div class="list-group">
                                    <a href="#" class="list-group-item">

                                    </a>
                                </div>
                                <div class="list-group">
                                    <a href="#" class="list-group-item active">

                                    </a>
                                </div>
                                <div class="list-group">
                                    <a href="#" class="list-group-item">

                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9 col-md-9">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Dashboard </h3>
                        </div>
                        <div class="panel-body" id="content">
                            <div id="chartdiv" style="width: 500px; height: 600px; overflow: hidden; text-align: left;">

                                <div class="amcharts-main-div" style="position: relative;">

                                    <div class="amcharts-chart-div" style="overflow: hidden; position: relative; text-align: left; width: 500px; height: 552px;"><svg version="1.1" style="position: absolute; width: 500px; height: 552px;"><desc>JavaScript chart by amCharts 3.13.3</desc><g><path cs="100,100" d="M0.5,0.5 L499.5,0.5 L499.5,551.5 L0.5,551.5 Z" fill="#FFFFFF" stroke="#000000" fill-opacity="0" stroke-width="1" stroke-opacity="0"></path><path cs="100,100" d="M0.5,0.5 L424.5,0.5 L424.5,499.5 L0.5,499.5 L0.5,0.5 Z" fill="#FFFFFF" stroke="#DADADA" fill-opacity="0" stroke-width="1" stroke-opacity="1" transform="translate(55,32)"></path></g><g><g transform="translate(55,32)"><g><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L424.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,100.5 L0.5,100.5 L424.5,100.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,200.5 L0.5,200.5 L424.5,200.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,299.5 L0.5,299.5 L424.5,299.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,399.5 L0.5,399.5 L424.5,399.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,499.5 L0.5,499.5 L424.5,499.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g></g><g transform="translate(55,32)" visibility="visible"><g><path cs="100,100" d="M0.5,499.5 L0.5,499.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M106.5,499.5 L106.5,499.5 L106.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M212.5,499.5 L212.5,499.5 L212.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M318.5,499.5 L318.5,499.5 L318.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M424.5,499.5 L424.5,499.5 L424.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g></g></g><g></g><g></g><g></g><g><g transform="translate(55,32)"><g transform="translate(0,451)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L212.5,37.5 L212.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,409)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L204.5,37.5 L204.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,351)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L214.5,37.5 L214.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,309)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L307.5,37.5 L307.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,252)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L189.5,37.5 L189.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,210)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L320.5,37.5 L320.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,152)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L165.5,37.5 L165.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,110)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L237.5,37.5 L237.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,52)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L66.5,37.5 L66.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,10)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L180.5,37.5 L180.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g></g></g><g><g transform="translate(55,32)"><g></g></g><g transform="translate(55,32)"><g></g></g></g><g clip-path="url(#AmChartsEl-2)"></g><g><g><path cs="100,100" d="M0.5,0.5 L0.5,499.5" fill="none" stroke-width="1" stroke-opacity="0" stroke="#000000" transform="translate(55,32)"></path></g><g><path cs="100,100" d="M0.5,0.5 L424.5,0.5" fill="none" stroke-width="1" stroke-opacity="0" stroke="#000000" transform="translate(55,32)" visibility="visible"></path></g></g><g></g><g></g><g><g transform="translate(55,32)"></g><g transform="translate(55,32)"></g></g><g><g transform="translate(55,32)"><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,48)"><tspan y="6" x="0" style="font-size: 11px;">2005</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,148)"><tspan y="6" x="0" style="font-size: 11px;">2006</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,248)"><tspan y="6" x="0" style="font-size: 11px;">2007</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,347)"><tspan y="6" x="0" style="font-size: 11px;">2008</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,447)"><tspan y="6" x="0" style="font-size: 11px;">2009</tspan></text></g><g transform="translate(55,32)" visibility="visible"><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(0,-17)"><tspan y="6" x="0" style="font-size: 11px;">15</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(106,-17)"><tspan y="6" x="0" style="font-size: 11px;">20</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(212,-17)"><tspan y="6" x="0" style="font-size: 11px;">25</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(318,-17)"><tspan y="6" x="0" style="font-size: 11px;">30</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(424,-17)"><tspan y="6" x="0" style="font-size: 11px;">35</tspan></text></g></g><g><g></g></g><g></g><g><g transform="translate(419,40)" visibility="hidden"><rect x="0.5" y="0.5" width="69" height="27" rx="0" ry="0" stroke-width="1" fill="#e5e5e5" stroke="#e5e5e5" fill-opacity="1" stroke-opacity="1" opacity="0" transform="translate(-8,-8)"></rect><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="start" transform="translate(0,7)"><tspan y="6" x="0" style="font-size: 11px;">Show all</tspan></text></g></g><g></g><clipPath id="AmChartsEl-2"><rect x="55" y="32" width="424" height="499" rx="0" ry="0" stroke-width="0"></rect></clipPath></svg><a href="http://www.amcharts.com/javascript-charts/" title="JavaScript charts" style="position: absolute; text-decoration: none; color: rgb(0, 0, 0); font-family: Verdana; font-size: 11px; opacity: 0.7; display: block; left: 352px; top: 37px;">JS chart by amCharts</a></div><div class="amChartsLegend amcharts-legend-div" style="overflow: hidden; position: relative; text-align: left; width: 500px; height: 48px;"><svg version="1.1" style="position: absolute; width: 500px; height: 48px;"><desc>JavaScript chart by amCharts 3.13.3</desc><g transform="translate(55,0)"><path cs="100,100" d="M0.5,0.5 L424.5,0.5 L424.5,37.5 L0.5,37.5 Z" fill="#FFFFFF" stroke="#000000" fill-opacity="0" stroke-width="1" stroke-opacity="0"></path><g transform="translate(0,11)"><g cursor="pointer" transform="translate(0,0)"><path cs="100,100" d="M-7.5,8.5 L8.5,8.5 L8.5,-7.5 L-7.5,-7.5 Z" fill="#ADD981" stroke="#ADD981" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(8,8)"></path><g transform="translate(8,8)" visibility="hidden"><path cs="100,100" d="M-5.5,-5.5 L6.5,6.5" fill="none" stroke="#FFFFFF" stroke-width="3"></path><path cs="100,100" d="M-5.5,6.5 L6.5,-5.5" fill="none" stroke="#FFFFFF" stroke-width="3"></path></g><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="start" transform="translate(21,7)"><tspan y="6" x="0" style="font-size: 11px;">Income</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(130,7)"> </text><rect x="16" y="0" width="114" height="18" rx="0" ry="0" stroke-width="0" stroke="none" fill="#fff" fill-opacity="0.005"></rect></g><g cursor="pointer" transform="translate(145,0)"><path cs="100,100" d="M-7.5,8.5 L8.5,8.5 L8.5,-7.5 L-7.5,-7.5 Z" fill="#81acd9" stroke="#81acd9" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(8,8)"></path><g transform="translate(8,8)" visibility="hidden"><path cs="100,100" d="M-5.5,-5.5 L6.5,6.5" fill="none" stroke="#FFFFFF" stroke-width="3"></path><path cs="100,100" d="M-5.5,6.5 L6.5,-5.5" fill="none" stroke="#FFFFFF" stroke-width="3"></path></g><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="start" transform="translate(21,7)"><tspan y="6" x="0" style="font-size: 11px;">Expenses</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(130,7)"> </text><rect x="16" y="0" width="114" height="18" rx="0" ry="0" stroke-width="0" stroke="none" fill="#fff" fill-opacity="0.005"></rect></g></g></g></svg></div></div></div>


                        </div>
                        


                                    </div>
                                </div>
                            </div>

                        </div>




                        <style type="text/css">

                            body{margin:50px;}
                            #accordion .glyphicon { margin-right:10px; }
                            .panel-collapse>.list-group .list-group-item:first-child {border-top-right-radius: 0;border-top-left-radius: 0;}
                            .panel-collapse>.list-group .list-group-item {border-width: 1px 0;}
                            .panel-collapse>.list-group {margin-bottom: 0;}
                            .panel-collapse .list-group-item {border-radius:0;}

                            .panel-collapse .list-group .list-group {margin: 0;margin-top: 10px;}
                            .panel-collapse .list-group-item li.list-group-item {margin: 0 -15px;border-top: 1px solid #ddd !important;border-bottom: 0;padding-left: 30px;}
                            .panel-collapse .list-group-item li.list-group-item:last-child {padding-bottom: 0;}

                            .panel-collapse div.list-group div.list-group{margin: 0;}
                            .panel-collapse div.list-group .list-group a.list-group-item {border-top: 1px solid #ddd !important;border-bottom: 0;padding-left: 30px;}
                            .panel-collapse .list-group-item li.list-group-item {border-top: 1px solid #DDD !important;}





                        </style>
                        <%}%>
                        </body>
                        </html>
