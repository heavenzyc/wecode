<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <style type="text/css">
        table
        {
            border-collapse: collapse;
            border: none;
            width: 216mm;
            height: 100mm;
        }
        td{border: solid #000 1px; padding: 5px}
        .noprint{visibility:hidden}
    </style>
</head>
<div id="printdiv">
<center>
        <div style="text-align: center; padding: 5px">货  物  承  运  单  （代收，发料单）</div>
<table border="1">
    <tr>
        <td colspan="6" style="text-align: right; border-top: none; border-right: none; border-left:none ">&nbsp;&nbsp;&nbsp;${dates[0]}年&nbsp;&nbsp;&nbsp;${dates[1]}月&nbsp;&nbsp;&nbsp;${dates[2]}日</td>
    </tr>
    <tr style="margin-top: 5px">
        <td>运输单号</td>
        <td colspan="2">${data.code}</td>
        <td>运输单位</td>
        <td colspan="2">${data.transport_merchant_name}</td>
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
        <td>运输费</td>
        <td colspan="2">${data.fee}</td>
        <td>加工费</td>
        <td colspan="2">${data.process_fee}</td>
    </tr>
    <tr>
        <td>货物名称</td>
        <td colspan="2">${data.material_name}</td>
        <td>买入金额</td>
        <td colspan="2">${data.buy_money}</td>
    </tr>
    <tr>
        <td>货物类型</td>
        <td colspan="2">${data.material_standard_name}</td>
        <td>卖出金额</td>
        <td colspan="2">${data.sale_money}</td>
    </tr>
    <tr>
        <td>加工厂过磅数量</td>
        <td colspan="2">${data.weight_count}</td>
        <td>已加工数量</td>
        <td colspan="2">${data.process_count}</td>
    </tr>
    <tr>
        <td>加工单位</td>
        <td colspan="2">${data.process_merchant_name}</td>
        <td>已加工出成品数量</td>
        <td colspan="2">${data.count}</td>
    </tr>
    <tr>
        <td rowspan="2">装货地点</td>
        <td rowspan="2" style="width: 150px">${data.shipping_address}</td>
        <td rowspan="2">装货人电话</td>
        <td rowspan="2">${data.shipping_person_phone}</td>
        <td>发货日期</td>
        <td><#if (data.send_time)??>${(data.send_time)?string("yyyy年MM月dd日")}</#if></td>
    </tr>
    <tr>
        <td>卸货日期</td>
        <td><#if (data.off_time)??>${(data.off_time)?string("yyyy年MM月dd日")}</#if></td>
    </tr>
    <tr>
        <td>过磅人签字</td>
        <td>${data.weight_person_sign}</td>
        <td>过磅人电话</td>
        <td>${data.phone}</td>
        <td>运输车号</td>
        <td>${data.car_num}</td>
    </tr>
    <tr>
        <td>发货人签字</td>
        <td>${data.send_person_sign}</td>
        <td>承运人签字</td>
        <td>${data.transport_person_sign}</td>
        <td>司机签字</td>
        <td>${data.dirver_sign}</td>
    </tr>
    <tr>
        <td colspan="6" style="border-left: none; border-right: none; border-bottom: none; font-size: 14px">
            备注：第一联（白）财务稽核 第二联 发货单位（加工） 第三联 收货单位（加工） 第四联 公司 第五联 运输
        </td>
    </tr>
</table>
    <br>
    <button id="print" type="button" value="打印" style="width: 100px; height:30px;" onclick="JsPrint()">打印</button>
</center>
</div>

<script>
    function JsPrint(){
        document.getElementById("print").style.visibility="hidden";
        window.print();
        document.getElementById("print").style.visibility="visible";
    }
</script>