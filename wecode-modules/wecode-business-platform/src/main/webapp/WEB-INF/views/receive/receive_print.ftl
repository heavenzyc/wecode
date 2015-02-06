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
        <div style="text-align: center; padding: 5px">收    款    单</div>
<table border="1">
    <tr>
        <td colspan="6" style="text-align: right">${(data.receive_time)?string("yyyy 年 MM 月 dd 日")}</td>
    </tr>
    <tr>
        <td>应收款单位及项目</td>
        <td colspan="5">${data.merchant}</td>
    </tr>
    <tr>
        <td>收款项目</td>
        <td colspan="5" rowspan="2">${data.reason}</td>
    </tr>
    <tr>
        <td>及理由</td>
    </tr>
    <tr>
        <td>款项类别</td>
        <td colspan="5">
            现金<input type="checkbox" <#if data.receive_type=='CASH'>checked </#if> >&nbsp;&nbsp;&nbsp;&nbsp;
            支票<input type="checkbox" <#if data.receive_type=='CHECK'>checked </#if>>&nbsp;&nbsp;&nbsp;&nbsp;
            支票号码：${data.check_num}
        </td>
    </tr>
    <tr>
        <td>应收款总额</td>
        <td colspan="5">(大写) ${data.money_capital} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥ ${data.money_lower}</td>
    </tr>
    <tr>
        <td>收到金额</td>
        <td colspan="2">${data.money}</td>
        <td>欠款余额</td>
        <td colspan="2">${data.arrears}</td>
    </tr>
    <tr>
        <td>收款负责人</td>
        <td colspan="2">${data.receive_person}</td>
        <td>经办人</td>
        <td colspan="2">${data.approve}</td>
    </tr>
    <tr>
        <td>财务核准人</td>
        <td width="100px">${data.verify}</td>
        <td>财务审核人</td>
        <td>${data.finance_verify}</td>
        <td>部门审核人</td>
        <td width="80px">${data.dept_verify}</td>
    </tr>
    <tr>
        <td colspan="2">附件(张)  ${data.annex}</td>
        <td>备  注</td>
        <td colspan="3">${data.remark}</td>
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