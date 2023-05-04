<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <title>bck_user</title>
    <style>
        html { overflow-x:hidden; }
        .table {
            margin-left: 10px;
        }

        /* 清除面板边框 */
        .panel-default {
            border: 0px;
        }

        /* 控制面板间距 */
        .panel-body {
            margin: 0px 10px;
            width: 1410px;
        }

        /* 设置按钮间距 */
        .bt2 {
            margin-left: 10px;
        }

        /* 表单1调整 */
        .form1-tx {
            width: 50%;
        }

        .form1-bt {
            height: 26px;
        }

        /* 设置发布通知按钮间距 */
        .preadd-btn {
            margin-left: 113px;
        }

        table tbody tr td:last-of-type {
            width: 120px;
            border-bottom: 1px solid;
            border-color: #e3e3e3;
        }
    </style>
    
</head>

<body>
    <div class="panel panel-default">
        <div class="panel-body container">
            <div class="row">
                <div class="col-sm-4">
                    <form id="query_venue" method="POST" action="${pageContext.request.contextPath}/admin?method=query_user">
                        <span>用户账号查询:</span>
                        <input type="text" class="form1-tx" id="query_key" name="query_key" value="${query_key}">
                        <input type="hidden" id="currentPage" name="currentPage" value="${pageBean_user.currentPage}">
                        <input type="hidden" id="currentCount" name="currentCount" value="${pageBean_user.currentCount}">
                        <input type="submit" class="form1-bt btn btn-sm btn-primary" value="查询">
                    </form>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </div>
        <!-- Table -->
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>用户账号</th>
                    <th>用户性别</th>
                    <th>用户年龄</th>
                    <th>用户邮箱</th>
                    <th>是否学生</th>
                    <th>用户余额</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${pageBean_user.list}" var="user" varStatus="vs" >
             		<tr>
		                 <th scope="row">${vs.count+pageBean_user.currentCount*pageBean_user.currentPage-pageBean_user.currentCount}</th>
		                 <td>${user.user_Id}</td>
		                 <td>${user.user_Sex}</td>
		                 <td>${user.user_Age}</td>
		                 <td>${user.user_Email}</td>
		                 <td>${user.is_Student}</td>
		                 <td>${user.balance}</td>
	                     <td>
	                        <button type="button" onclick="openupdate_user_Modal('${user.user_Id}','${user.balance}')"
	                            class="bt1 btn btn-info btn-xs">修改</button>
<%--	                        <button type="button" onclick="opendel_venue_Modal('${venue.venue_Id}')"--%>
<%--	                            class="bt2 btn btn-danger btn-xs">删除</button>--%>
                   		 </td>
	                 </tr>
				</c:forEach>
            </tbody>
        </table>
        <div class="container" style="width: 1410px;">
            <div class="row">
                <div class="col-sm-9" style="margin-top:23px;">
                    <div class="row">
                        <div class="col-sm-5" style="padding-right: 0px; width:300px">
                            <span style="font-size: 20px;">当前总共有${pageBean_user.totalCount}条数据,每页显示</span>
                        </div>
                        <div class="col-sm-2" style="padding-left: 10px;padding-right:0px; width:55px;">
                            <div class="dropdown showpagenum">
                                <button class="btn btn-default dropdown-toggle" style="height: 27px; padding-top:3px;"
                                    type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="true">
                                    <span style="display:inline-block;width:11px;">${pageBean_user.currentCount}</span>
                                    <span class="caret" style="margin-left: 3px;"></span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1"
                                    style="min-width: 41px;overflow:visible;">
                                    <li><a href="javascript:void(0);" onclick="changeShowPageNum('5')"
                                            style="display:none; padding-left:14px;">5</a></li>
                                    <li><a href="javascript:void(0);" onclick="changeShowPageNum('7')"
                                            style="padding-left:14px;">7</a></li>
                                    <li><a href="javascript:void(0);" onclick="changeShowPageNum('10')"
                                            style="padding-left:14px;">10</a></li>
                                    <li><a href="javascript:void(0);" onclick="changeShowPageNum('15')"
                                            style="padding-left:14px;">15</a></li>
                                    <li><a href="javascript:void(0);" onclick="changeShowPageNum('20')"
                                            style="padding-left:14px;">20</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-4" style="padding-left: 20px;">
                            <span style="font-size: 20px;">条数据</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style="margin-left:-60px;">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <!-- 判断当前页是否是第一页 -->
							<c:if test="${pageBean_user.currentPage==1 }">
								<li class="disabled">
									<a href="javascript:void(0);" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							<c:if test="${pageBean_user.currentPage!=1 }">
								<li>
									<a href="javascript:void(0);" onclick="changePage(${pageBean_user.currentPage-1})" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>	
							
							<c:if test="${pageBean_user.totalPage<=5 }">
								<c:forEach begin="1" end="${pageBean_user.totalPage }" var="page">
									<!-- 判断当前页 -->
									<c:if test="${pageBean_user.currentPage==page }">
										<li class="active"><a href="javascript:void(0);">${page}</a></li>
									</c:if>
									<c:if test="${pageBean_user.currentPage!=page }">
										<li><a href="javascript:void(0);" onclick="changePage(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${pageBean_user.totalPage>5 && pageBean_user.currentPage==1}">
								<li class="active"><a href="javascript:void(0);">1</a></li>
								<li><a href="javascript:void(0);" onclick="changePage('2')">2</a></li>
								<li><a href="javascript:void(0);" onclick="changePage('3')">3</a></li>
								<li><a href="javascript:void(0);" onclick="changePage('4')">4</a></li>
								<li><a href="javascript:void(0);" onclick="changePage('5')">...</a></li>
							</c:if>
							<c:if test="${pageBean_user.totalPage>5 && pageBean_user.totalPage-pageBean_user.currentPage<3}">
								<c:forEach begin="${pageBean_user.totalPage-3}" end="${pageBean_user.totalPage }" var="page">
									<!-- 判断当前页 -->
									<c:if test="${pageBean_user.currentPage==page }">
										<li class="active"><a href="javascript:void(0);">${page}</a></li>
									</c:if>
									<c:if test="${pageBean_user.currentPage!=page }">
										<li><a href="javascript:void(0);" onclick="changePage(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<li><a href="javascript:void(0);">...</a></li>
							</c:if>
							<c:if test="${pageBean_user.totalPage>5 && pageBean_user.currentPage!=1 && pageBean_user.totalPage-pageBean_user.currentPage>=3}">
								<c:forEach begin="${pageBean_user.currentPage-1}" end="${pageBean_user.currentPage+2}" var="page">
									<!-- 判断当前页 -->
									<c:if test="${pageBean_user.currentPage==page }">
										<li class="active"><a href="javascript:void(0);">${page}</a></li>
									</c:if>
									<c:if test="${pageBean_user.currentPage!=page }">
										<li><a href="javascript:void(0);" onclick="changePage(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<li><a href="javascript:void(0);" onclick="changePage('${pageBean_user.currentPage+3}')">...</a></li>
							</c:if>
							
				             <!-- 判断当前页是否是最后一页 -->
							<c:if test="${pageBean_user.currentPage==pageBean_user.totalPage }">
								<li class="disabled">
									<a href="javascript:void(0);" aria-label="Next"> 
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
							<c:if test="${pageBean_user.currentPage!=pageBean_user.totalPage }">
								<li>
									<a href="javascript:void(0);" onclick="changePage(${pageBean_venue.currentPage+1})" aria-label="Next"> 
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="${pageContext.request.contextPath}/text/javascript"></script>
<script type="text/javascript">
    $(function () {
    	if("${empty pageBean_user}"=="true"){
             $("#query_venue").submit();
        };
        //更新选项
        $(".showpagenum ul li a").each(function () {
            if("${pageBean_user.currentCount}" == $(this).text()) $(this).hide();
            else $(this).show();
        });
    });

    function changePage(pageNum) {
        //1 将页码的值放入对应表单隐藏域中
        $("#currentPage").val(pageNum);
        //2 提交表单
        $("#query_venue").submit();				
     };

     /* 改变每页显示的页数 */
     function changeShowPageNum(num) {
         $('#currentCount').val(num);
         $("#currentPage").val("1");
         $("#query_venue").submit();
     }
	
     /* 导出场馆数据 */
     function export_venue(){
    	 this.location.href="${pageContext.request.contextPath}/admin?method=export_venue";
     }
    /* 编辑场馆 */
    function openupdate_user_Modal(user_Id,balance) {
        var fatherBody = $(window.top.document.body); //获得父窗体的body
        //为父窗体添加modal内容
        fatherBody.append(' \
        <div class="modal fade in" id="update_user_model" role="dialog" style="padding-left: 16px; display: block;">\
                <div class="modal-dialog">\
                    <div class="modal-content" style="margin-top:20%">\
                        <form>\
                            <div class="modal-header">\
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span\
                                        aria-hidden="true">&times;</span></button>\
                                <h4 class="modal-title" style="text-align: center;">充值余额</h4>\
                            </div>\
                            <div class="modal-body">\
                                <div class="row" style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;" ><span>用户账号:</span></div>\
                                    <div class="col-md-9 " style="padding-left:0px">\
                                        <input type="text" id="user_Id" class="form-control" readonly="readonly" required autofocus value='
                                        	+user_Id+
                                           	'>\
                                    </div>\
                                </div>\
                                <div class="row"style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;"><span>用户余额:</span></div>\
                                    <div class="col-md-9 " style="padding-left:0px">\
                                        <input type="text" id="balance" class="form-control" required autofocus value='
                                        	+balance+
                                           	'>\
                                    </div>\
                                </div>\
                            </div>\
                            <div class="modal-footer">\
                                <button type="button" class="btn btn-default myclose" data-dismiss="modal">取消</button>\
                                <button type="button" class="submit_update_user btn btn-primary">确认修改</button>\
                            </div>\
                        </form>\
                    </div>\
                </div>\
            </div>');
        fatherBody.append("<div id='backdropId_update_venue' class='modal-backdrop fade in'></div>"); //为父窗体添加遮罩
    }
</script>
</html>
