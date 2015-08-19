<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="Css/bootstrapp.css" rel="stylesheet" type="text/css" />
        <title>Admin Dashboard</title>
    </head>

    <body>
        <div id="chartdiv" style="width: 500px; height: 600px; overflow: hidden; text-align: left;">

            <div class="amcharts-main-div" style="position: relative;">

                <div class="amcharts-chart-div" style="overflow: hidden; position: relative; text-align: left; width: 500px; height: 552px;"><svg version="1.1" style="position: absolute; width: 500px; height: 552px;"><desc>JavaScript chart by amCharts 3.13.3</desc><g><path cs="100,100" d="M0.5,0.5 L499.5,0.5 L499.5,551.5 L0.5,551.5 Z" fill="#FFFFFF" stroke="#000000" fill-opacity="0" stroke-width="1" stroke-opacity="0"></path><path cs="100,100" d="M0.5,0.5 L424.5,0.5 L424.5,499.5 L0.5,499.5 L0.5,0.5 Z" fill="#FFFFFF" stroke="#DADADA" fill-opacity="0" stroke-width="1" stroke-opacity="1" transform="translate(55,32)"></path></g><g><g transform="translate(55,32)"><g><path cs="100,100" d="M0.5,0.5 L0.5,0.5 L424.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,100.5 L0.5,100.5 L424.5,100.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,200.5 L0.5,200.5 L424.5,200.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,299.5 L0.5,299.5 L424.5,299.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,399.5 L0.5,399.5 L424.5,399.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M0.5,499.5 L0.5,499.5 L424.5,499.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g></g><g transform="translate(55,32)" visibility="visible"><g><path cs="100,100" d="M0.5,499.5 L0.5,499.5 L0.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M106.5,499.5 L106.5,499.5 L106.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M212.5,499.5 L212.5,499.5 L212.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M318.5,499.5 L318.5,499.5 L318.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g><g><path cs="100,100" d="M424.5,499.5 L424.5,499.5 L424.5,0.5" fill="none" stroke-width="1" stroke-opacity="0.1" stroke="#000000"></path></g></g></g><g></g><g></g><g></g><g><g transform="translate(55,32)"><g transform="translate(0,451)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L212.5,37.5 L212.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,409)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L204.5,37.5 L204.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,351)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L214.5,37.5 L214.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,309)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L307.5,37.5 L307.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,252)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L189.5,37.5 L189.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,210)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L320.5,37.5 L320.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,152)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L165.5,37.5 L165.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,110)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L237.5,37.5 L237.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,52)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L66.5,37.5 L66.5,0.5 L0.5,0.5 Z" fill="#81acd9" stroke="#FCD202" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g><g transform="translate(0,10)" visibility="visible"><path cs="100,100" d="M0.5,0.5 L0.5,37.5 L180.5,37.5 L180.5,0.5 L0.5,0.5 Z" fill="#ADD981" stroke="#FF6600" fill-opacity="1" stroke-width="1" stroke-opacity="0"></path></g></g></g><g><g transform="translate(55,32)"><g></g></g><g transform="translate(55,32)"><g></g></g></g><g clip-path="url(#AmChartsEl-2)"></g><g><g><path cs="100,100" d="M0.5,0.5 L0.5,499.5" fill="none" stroke-width="1" stroke-opacity="0" stroke="#000000" transform="translate(55,32)"></path></g><g><path cs="100,100" d="M0.5,0.5 L424.5,0.5" fill="none" stroke-width="1" stroke-opacity="0" stroke="#000000" transform="translate(55,32)" visibility="visible"></path></g></g><g></g><g></g><g><g transform="translate(55,32)"></g><g transform="translate(55,32)"></g></g><g><g transform="translate(55,32)"><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,48)"><tspan y="6" x="0" style="font-size: 11px;">2005</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,148)"><tspan y="6" x="0" style="font-size: 11px;">2006</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,248)"><tspan y="6" x="0" style="font-size: 11px;">2007</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,347)"><tspan y="6" x="0" style="font-size: 11px;">2008</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(-12,447)"><tspan y="6" x="0" style="font-size: 11px;">2009</tspan></text></g><g transform="translate(55,32)" visibility="visible"><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(0,-17)"><tspan y="6" x="0" style="font-size: 11px;">15</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(106,-17)"><tspan y="6" x="0" style="font-size: 11px;">20</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(212,-17)"><tspan y="6" x="0" style="font-size: 11px;">25</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(318,-17)"><tspan y="6" x="0" style="font-size: 11px;">30</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="middle" transform="translate(424,-17)"><tspan y="6" x="0" style="font-size: 11px;">35</tspan></text></g></g><g><g></g></g><g></g><g><g transform="translate(419,40)" visibility="hidden"><rect x="0.5" y="0.5" width="69" height="27" rx="0" ry="0" stroke-width="1" fill="#e5e5e5" stroke="#e5e5e5" fill-opacity="1" stroke-opacity="1" opacity="0" transform="translate(-8,-8)"></rect><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="start" transform="translate(0,7)"><tspan y="6" x="0" style="font-size: 11px;">Show all</tspan></text></g></g><g></g><clipPath id="AmChartsEl-2"><rect x="55" y="32" width="424" height="499" rx="0" ry="0" stroke-width="0"></rect></clipPath></svg><a href="http://www.amcharts.com/javascript-charts/" title="JavaScript charts" style="position: absolute; text-decoration: none; color: rgb(0, 0, 0); font-family: Verdana; font-size: 11px; opacity: 0.7; display: block; left: 352px; top: 37px;">JS chart by amCharts</a></div><div class="amChartsLegend amcharts-legend-div" style="overflow: hidden; position: relative; text-align: left; width: 500px; height: 48px;"><svg version="1.1" style="position: absolute; width: 500px; height: 48px;"><desc>JavaScript chart by amCharts 3.13.3</desc><g transform="translate(55,0)"><path cs="100,100" d="M0.5,0.5 L424.5,0.5 L424.5,37.5 L0.5,37.5 Z" fill="#FFFFFF" stroke="#000000" fill-opacity="0" stroke-width="1" stroke-opacity="0"></path><g transform="translate(0,11)"><g cursor="pointer" transform="translate(0,0)"><path cs="100,100" d="M-7.5,8.5 L8.5,8.5 L8.5,-7.5 L-7.5,-7.5 Z" fill="#ADD981" stroke="#ADD981" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(8,8)"></path><g transform="translate(8,8)" visibility="hidden"><path cs="100,100" d="M-5.5,-5.5 L6.5,6.5" fill="none" stroke="#FFFFFF" stroke-width="3"></path><path cs="100,100" d="M-5.5,6.5 L6.5,-5.5" fill="none" stroke="#FFFFFF" stroke-width="3"></path></g><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="start" transform="translate(21,7)"><tspan y="6" x="0" style="font-size: 11px;">Income</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(130,7)"> </text><rect x="16" y="0" width="114" height="18" rx="0" ry="0" stroke-width="0" stroke="none" fill="#fff" fill-opacity="0.005"></rect></g><g cursor="pointer" transform="translate(145,0)"><path cs="100,100" d="M-7.5,8.5 L8.5,8.5 L8.5,-7.5 L-7.5,-7.5 Z" fill="#81acd9" stroke="#81acd9" fill-opacity="1" stroke-width="1" stroke-opacity="1" transform="translate(8,8)"></path><g transform="translate(8,8)" visibility="hidden"><path cs="100,100" d="M-5.5,-5.5 L6.5,6.5" fill="none" stroke="#FFFFFF" stroke-width="3"></path><path cs="100,100" d="M-5.5,6.5 L6.5,-5.5" fill="none" stroke="#FFFFFF" stroke-width="3"></path></g><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="start" transform="translate(21,7)"><tspan y="6" x="0" style="font-size: 11px;">Expenses</tspan></text><text y="6" fill="#000000" font-family="Verdana" font-size="11" opacity="1" text-anchor="end" transform="translate(130,7)"> </text><rect x="16" y="0" width="114" height="18" rx="0" ry="0" stroke-width="0" stroke="none" fill="#fff" fill-opacity="0.005"></rect></g></g></g></svg></div></div></div>

        <div id="users" class="aler alert-success">
            <table class="table table-condensed">
                <tr>
                    <td>Total Users</td>&nbsp;&nbsp;<td>15</td>
                </tr>
                <tr>
                    <td>Total Products</td>  &nbsp;&nbsp;<td>50</td>
                </tr>
                <tr>
                    <td>Today Income</td> &nbsp;&nbsp;<td>Rs&nbsp;: 250000.00</td> 
                </tr>



            </table>

        </div>





        <style type="text/css">
            #users{
                width: 400px;
                
                height: auto;
                float: left;
                


            }




        </style>
    </body>
</html>