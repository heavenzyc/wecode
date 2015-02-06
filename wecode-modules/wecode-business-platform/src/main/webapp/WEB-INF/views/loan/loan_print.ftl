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
        <div style="text-align: center; padding: 5px">借    款    单</div>
<table border="1">
    <tr>
        <td colspan="8" style="text-align: right">${(data.loan_time)?string("yyyy 年 MM 月 dd 日")}</td>
    </tr>
    <tr>
        <td colspan="2" width="100px">借款部门</td>
        <td>${data.loan_dept_name}</td>
        <td>借款人</td>
        <td>${data.loan_person}</td>
        <td>使用部门</td>
        <td colspan="2">${data.loan_dept_name}</td>
    </tr>
    <tr>
        <td colspan="2">款项类别</td>
        <td colspan="6">
            现金<input type="checkbox" <#if data.loan_type=='CASH'>checked </#if> >&nbsp;&nbsp;&nbsp;&nbsp;
            支票<input type="checkbox" <#if data.loan_type=='CHECK'>checked </#if>>&nbsp;&nbsp;&nbsp;&nbsp;
            支票号码：${data.check_num}
        </td>
    </tr>
    <tr>
        <td colspan="2">借款用途</td>
        <td colspan="6" rowspan="2">${data.reason}</td>
    </tr>
    <tr>
        <td colspan="2">及理由</td>
        <#--<td colspan="6"></td>-->
    </tr>
    <tr>
        <td colspan="2">借款金额</td>
        <td colspan="6">(大写) ${data.money_capital} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥ ${data.money_lower}</td>
    </tr>
    <tr>
        <td colspan="2">还款方式</td>
        <td colspan="6">${data.repay_method}</td>
    </tr>
    <tr>
        <td colspan="2">批准人:${data.approve}</td>
        <td>财务核准</td>
        <td>${data.verify}</td>
        <td>财务审核</td>
        <td>${data.finance_verify}</td>
        <td>部门审核</td>
        <td width="70px">${data.dept_verify}</td>
    </tr>
    <tr>
        <td colspan="2">附件(张) ${data.annex}</td>
        <td>备  注</td>
        <td colspan="5">${data.remark}</td>
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