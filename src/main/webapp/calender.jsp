<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
var cal15 = new CalendarPopup();
cal15.setReturnFunction("setMultipleValues4");
function setMultipleValues4(y,m,d) {
     document.forms[0].date15_year.value=y;
     document.forms[0].date15_month.selectedIndex=m;
     for (var i=0; i<document.forms[0].date15_date.options.length; i++) {
          if (document.forms[0].date15_date.options[i].value==d) {
               document.forms[0].date15_date.selectedIndex=i;
               }
          }
     }
var cal16 = new CalendarPopup();
cal16.setReturnFunction("setMultipleValues5");
function setMultipleValues5(y,m,d) {
     document.forms[0].date16_year.value=y;
     document.forms[0].date16_month.selectedIndex=m;
     for (var i=0; i<document.forms[0].date16_date.options.length; i++) {
          if (document.forms[0].date16_date.options[i].value==d) {
               document.forms[0].date16_date.selectedIndex=i;
               }
          }
     }
function getDateString(y_obj,m_obj,d_obj) {
     var y = y_obj.options[y_obj.selectedIndex].value;
     var m = m_obj.options[m_obj.selectedIndex].value;
     var d = d_obj.options[d_obj.selectedIndex].value;
     if (y=="" || m=="") { return null; }
     if (d=="") { d=1; }
     return str= y+'-'+m+'-'+d;
     }

</script>
</head>
<body onload="setMultipleValues4('2010','mar','28')">

</body>
</html>