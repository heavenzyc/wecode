<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <style type="text/css">
        table
        {
            border-collapse: collapse;
            border: none;
            width: 216mm;
            height: 139mm;
        }
        td{border: solid #000 1px; padding: 5px}
        .noprint{visibility:hidden}
    </style>
</head>
<div id="printdiv">
<center>
        <div style="text-align: center; padding: 5px">货  物  承  运  单  （代收，发料单）</div>
<table border="1">
    <tr style="margin-top: 5px">
        <td>运输单号</td>
        <td colspan="4" style="border-right-color: #fff">${data.code}</td>
        <td style="text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
    </tr>
    <tr>
        <td>运输单位</td>
        <td colspan="2">${data.transport_merchant_name}</td>
        <td>出入库单号</td>
        <td colspan="2">${data.input_output_code}</td>
    </tr>
    <tr>
        <td>发货地址</td>
        <td colspan="5">${data.send_address}</td>
    </tr>
    <tr>
        <td>发货人</td>
        <td colspan="2">${data.send_person}</td>
        <td>发货人电话</td>
        <td colspan="2">${data.send_person_phone}</td>
    </tr>
    <tr>
        <td>收货单位</td>
        <td colspan="5">${data.accept_merchant}</td>
    </tr>
    <tr>
        <td>收货地址</td>
        <td colspan="5">${data.accept_address}</td>
    </tr>
    <tr>
        <td>收货人</td>
        <td colspan="2">${data.accept_person}</td>
        <td>收货人电话</td>
        <td colspan="2">${data.accept_person_phone}</td>
    </tr>
    <tr>
        <td>货物名称</td>
        <td colspan="2">${data.material_name}</td>
        <td>数量单位</td>
        <td colspan="2">${data.unit}</td>
    </tr>
    <tr>
        <td rowspan="2">装货地点</td>
        <td rowspan="2" style="width: 150px">${data.shipping_address}</td>
        <td rowspan="2">装货人电话</td>
        <td rowspan="2">${data.shipping_person_phone}</td>
        <td>发货日期</td>
        <td>${(data.send_time)?string("yyyy年MM月dd日")}</td>
    </tr>
    <tr>
        <td>卸货日期</td>
        <td>${(data.off_time)?string("yyyy年MM月dd日")}</td>
    </tr>
    <tr>
        <td>过磅人签字</td>
        <td></td>
        <td>联系电话</td>
        <td></td>
        <td>运输车号</td>
        <td>${data.car_num}</td>
    </tr>
    <tr>
        <td>发货人签字</td>
        <td></td>
        <td>承运人签字</td>
        <td></td>
        <td>司机签字</td>
        <td></td>
    </tr>
</table>
</center>
</div>
<center>
    <br>
    <button id="print" type="button" value="打印" style="width: 100px; height:30px;" onclick="JsPrint()">打印</button>
</center>

<script>
    function JsPrint(){
        document.body.innerHTML=document.getElementById('printdiv').innerHTML;
        window.print();
    }
</script>