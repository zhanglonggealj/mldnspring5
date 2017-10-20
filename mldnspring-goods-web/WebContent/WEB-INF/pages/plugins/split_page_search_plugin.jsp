<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8") ;
String basePath = request.getScheme() + "://" + 
		request.getServerName() + ":" + request.getServerPort() + 
		request.getContextPath();
%>
<%--	// 考虑到以后的结合开发，本处使用request属性范围传递
	request.setAttribute("columnData",columnData) ;	// 属性名称
	request.setAttribute("handleUrl",dept_list_url) ;
	request.setAttribute("keyWord",keyWord) ;
	request.setAttribute("column",column) ;
--%>
<%	// columnData格式：标签名称:字段名称|标签名称:字段名称|
	String columnData = (String) request.getAttribute("columnData") ;
	String handleUrl = basePath + (String) request.getAttribute("handleUrl") ;
	String keyWord = (String) request.getAttribute("keyWord") ;
	String column = (String) request.getAttribute("column") ;
%>
<div id="searchPageDiv" align="center">
	<form action="<%=handleUrl%>" method="post">
<%
	if (!(columnData == null || "".equals(columnData))) {
%>
		<select id="col" name="col">
	<%
		String columnResults [] = columnData.split("\\|") ;
		for (int x = 0 ; x < columnResults.length ; x ++) {
			String temp [] = columnResults[x].split(":") ;
	%>
			<option value="<%=temp[1]%>" <%=temp[1].equals(column) ? "selected" : ""%>><%=temp[0]%></option>
	<%
		}
	%>
		</select>
<%
	}
%>
		<input type="text" id="kw" name="kw" value="<%=keyWord == null ? "" : keyWord%>">
		<input type="submit" value="检索">
	</form>
</div>