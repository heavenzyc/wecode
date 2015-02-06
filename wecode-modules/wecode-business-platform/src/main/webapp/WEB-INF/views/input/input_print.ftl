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
        <div style="text-align: center; padding: 5px">入  库  单（带过磅单）</div>
<table border="1">
    <tr>
        <td>入库日期</td>
        <td colspan="2">${data.input_time?string("yyyy年MM月dd日")}</td>
        <td>入库单号</td>
        <td colspan="2">${data.code}</td>
        <td>收货人</td>
        <td colspan="2">${data.accept_person}</td>
    </tr>
    <tr>
        <td>供货单位</td>
        <td colspan="2">${data.merchant_name}</td>
        <td>入库数量</td>
        <td colspan="2">${data.count}</td>
        <td>发货人</td>
        <td colspan="2">${data.send_person}</td>
    </tr>
    <tr>
        <td>物品编号</td>
        <td>物品名称</td>
        <td>类别</td>
        <td>规格</td>
        <td>单位</td>
        <td>单价</td>
        <td>数量</td>
        <td>总额</td>
        <td>所入仓库</td>
    </tr>
    <tr>
        <td>${data.material_code}</td>
        <td>${data.material_name}</td>
        <td>${data.purchase_type_name}</td>
        <td>${data.standard_name}</td>
        <td>${data.unit}</td>
        <td>${data.price}/${data.unit}</td>
        <td>${data.count}</td>
        <td>${data.money}</td>
        <td>${data.warehouse}</td>
    </tr>
<#--    <tr>
        <td>合计</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>-->
    <tr>
        <td>备注</td>
        <td colspan="8">${data.remark}</td>
    </tr>
    <tr>
        <td>司机车号</td>
        <td colspan="3">${data.car_num}</td>
        <td>过磅人</td>
        <td colspan="4">${data.weigh_person}</td>
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