<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, notice.model.vo.*" %>
<%
	int cPage = (int) request.getAttribute("cPage");
	String pageBar = (String) request.getAttribute("pageBar");
	List<Notice> list = (List<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<title>Insert title here</title>

<%-- <script>
$(function(){
	var num = 0;
	$("#moveEvent").on("click", function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/gson/notice/noticeEvent",
			type:"get",
			dateType:"json",
			success:function(data){
				console.log(data);
				
				var table = $("<table class='table table-dark' id='products'></table>");
				var form = $("<form id='setRows'></form>");
				var html = "<thead><tr><th scope='col'>글번호</th>";
				html += "<th scope='col'>글제목</th>";
				html += "<th scope='col'>작성자</th>";
				html += "<th scope='col'>작성일</th></tr></thead>";
				html += "<tbody>";
				table.append(form);
				table.append(html);
				
				for(var i in data){
					var user = data[i];
					var html2 = "<tr><th scope='row'>"+user.eventNo+"</th>";
					html2 += "<td><a href='<%=request.getContextPath()%>/event/eventView?eventNo="+user.eventNo+"'>"+user.eventTitle+"</a></td>";
					html2 += "<td>관리자입니다</td>";
					html2 += "<td>"+user.eventContent+"</td></tr>";
					
					table.append(html2);
					num++;
				}
					var html3 = "</tbody>";
					table.append(html3);
		
					$("#ajax").html(table);
					
					var $setRows = $('#setRows');

					$setRows.submit(function (e) {
					    e.preventDefault();
					    var rowPerPage = 5; // 한번에 보고자 하는 갯수

					    var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
					    if (!rowPerPage) {
					        alert(zeroWarning);
					        return;
					    }
					    $('#nav').remove();
					    var $products = $('#products');

					    $products.after('<div id="nav">');


					    var $tr = $($products).find('tbody tr');
					    var rowTotals = $tr.length; // 총 컨텐츠 수..
						console.log(rowTotals);

					    var pageTotal = Math.ceil(rowTotals/ rowPerPage);
					    var i = 0;

					    for (; i < pageTotal; i++) {
					        $('<a href="#"></a>')
					                .attr('rel', i)
					                .html(i + 1)
					                .appendTo('#nav');
					    }

					    $tr.addClass('off-screen')
					            .slice(0, rowPerPage)
					            .removeClass('off-screen');

					    var $pagingLink = $('#nav a');
					    $pagingLink.on('click', function (evt) {
					        evt.preventDefault();
					        var $this = $(this);
					        if ($this.hasClass('active')) {
					            return;
					        }
					        $pagingLink.removeClass('active');
					        $this.addClass('active');

					        // 0 => 0(0*4), 4(0*4+4)
					        // 1 => 4(1*4), 8(1*4+4)
					        // 2 => 8(2*4), 12(2*4+4)
					        // 시작 행 = 페이지 번호 * 페이지당 행수
					        // 끝 행 = 시작 행 + 페이지당 행수

					        var currPage = $this.attr('rel');
					        var startItem = currPage * rowPerPage;
					        var endItem = startItem + rowPerPage;

					        $tr.css('opacity', '0.0')
					                .addClass('off-screen')
					                .slice(startItem, endItem)
					                .removeClass('off-screen')
					                .animate({opacity: 1}, 300);

					    });

					    $pagingLink.filter(':first').addClass('active');

					});
					$setRows.submit();
					
			},complete:function(data){
				
			}
		});
	});
});

</script> --%>
<script>
$(function(){
	$("#btn-write").click(function(){
		location.href = "<%=request.getContextPath()%>/notice/noticeForm";
	});
});
</script>

</head>
<body>
	<h2>공지사항 하위</h2>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  	<a class="navbar-brand" href="#" onclick="location.href = '<%=request.getContextPath()%>/notice/noticeList'">공지사항</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   			 <span class="navbar-toggler-icon"></span>
  		</button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#" onclick="location.href = '<%=request.getContextPath()%>/event/eventList'">이벤트<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="location.href = '<%=request.getContextPath()%>/notice/questList'">문의게시판</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
	<hr />
<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">글제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <%if(list.isEmpty()){%>
    	<tr>
			<td colspan="4" align="center">게시글이 없습니다.</td>
		</tr>
    <%} else {
        for(Notice n : list){%>
      <th scope="row"><%=n.getNoticeNo() %></th>
      <td><a href="<%=request.getContextPath()%>/notice/noticeView?noticeNo=<%=n.getNoticeNo()%>">
            <%=n.getNoticeTitle() %></a></td>
      <td>관리자입니다</td>
      <td><%=n.getNoticeDate() %></td>
    </tr>
    <%} // end of for 
      } // end of if %> 
  </tbody>
</table>
	
	<div id="pageBar">
		<%=pageBar %>
	</div>

	<hr />
	<button type="button" class="btn btn-primary" id="btn-write">글쓰기</button>
	
</body>
</html>