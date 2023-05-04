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
    <title>bck_venue</title>
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
                    <form id="query_venue" method="POST" action="${pageContext.request.contextPath}/admin?method=query_venue">
                        <span>场馆名字查询:</span>
                        <input type="text" class="form1-tx" id="query_key" name="query_key" value="${query_key}">
                        <input type="hidden" id="currentPage" name="currentPage" value="${pageBean_venue.currentPage}">
                        <input type="hidden" id="currentCount" name="currentCount" value="${pageBean_venue.currentCount}">
                        <input type="submit" class="form1-bt btn btn-sm btn-primary" value="查询">
                    </form>
                </div>
                <div class="col-sm-3"></div>
                <div class="col-sm-2" style="padding-left:80px;">
                    <button type="button" onclick="openadd_venue_Modal()"
                        class="preadd-btn btn btn-success btn-sm">添加场馆</button>
                </div>
                <div class="col-sm-2" style="padding-left: 30px;">
                    <button type="button" onclick="export_venue()"
                        class="preadd-btn btn btn-warning btn-sm">导出数据</button>
                </div>
            </div>
        </div>
        <!-- Table -->
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>场馆名字</th>
                    <th>场馆类别</th>
                    <th>接待能力</th>
                    <th>场馆价格</th>
                    <th>开放时间</th>
                    <th>关闭时间</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${pageBean_venue.list}" var="venue" varStatus="vs" >
             		<tr>
		                 <th scope="row">${vs.count+pageBean_venue.currentCount*pageBean_venue.currentPage-pageBean_venue.currentCount}</th>
		                 <td>${venue.venue_Name}</td>
		                 <td>${venue.venue_Type}</td>
		                 <td>${venue.venue_Capacity }</td>
		                 <td>${venue.venue_Price }</td>
		                 <td>${venue.venue_Open}:00</td>
		                 <td>${venue.venue_Close}:00</td>
	                     <td>
	                        <button type="button" onclick="openupdate_venue_Modal('${venue.venue_Id}','${venue.venue_Name}',
	                        '${venue.venue_Type}','${venue.venue_Capacity}','${venue.venue_Price}',
	                        '${venue.venue_Open}','${venue.venue_Close}')"
	                            class="bt1 btn btn-info btn-xs">修改</button>
	                        <button type="button" onclick="opendel_venue_Modal('${venue.venue_Id}')"
	                            class="bt2 btn btn-danger btn-xs">删除</button>
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
                            <span style="font-size: 20px;">当前总共有${pageBean_venue.totalCount}条数据,每页显示</span>
                        </div>
                        <div class="col-sm-2" style="padding-left: 10px;padding-right:0px; width:55px;">
                            <div class="dropdown showpagenum">
                                <button class="btn btn-default dropdown-toggle" style="height: 27px; padding-top:3px;"
                                    type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="true">
                                    <span style="display:inline-block;width:11px;">${pageBean_venue.currentCount}</span>
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
							<c:if test="${pageBean_venue.currentPage==1 }">
								<li class="disabled">
									<a href="javascript:void(0);" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							<c:if test="${pageBean_venue.currentPage!=1 }">
								<li>
									<a href="javascript:void(0);" onclick="changePage(${pageBean_venue.currentPage-1})" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>

							<c:if test="${pageBean_venue.totalPage<=5 }">
								<c:forEach begin="1" end="${pageBean_venue.totalPage }" var="page">
									<!-- 判断当前页 -->
									<c:if test="${pageBean_venue.currentPage==page }">
										<li class="active"><a href="javascript:void(0);">${page}</a></li>
									</c:if>
									<c:if test="${pageBean_venue.currentPage!=page }">
										<li><a href="javascript:void(0);" onclick="changePage(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${pageBean_venue.totalPage>5 && pageBean_venue.currentPage==1}">
								<li class="active"><a href="javascript:void(0);">1</a></li>
								<li><a href="javascript:void(0);" onclick="changePage('2')">2</a></li>
								<li><a href="javascript:void(0);" onclick="changePage('3')">3</a></li>
								<li><a href="javascript:void(0);" onclick="changePage('4')">4</a></li>
								<li><a href="javascript:void(0);" onclick="changePage('5')">...</a></li>
							</c:if>
							<c:if test="${pageBean_venue.totalPage>5 && pageBean_venue.totalPage-pageBean_venue.currentPage<3}">
								<c:forEach begin="${pageBean_venue.totalPage-3}" end="${pageBean_venue.totalPage }" var="page">
									<!-- 判断当前页 -->
									<c:if test="${pageBean_venue.currentPage==page }">
										<li class="active"><a href="javascript:void(0);">${page}</a></li>
									</c:if>
									<c:if test="${pageBean_venue.currentPage!=page }">
										<li><a href="javascript:void(0);" onclick="changePage(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<li><a href="javascript:void(0);">...</a></li>
							</c:if>
							<c:if test="${pageBean_venue.totalPage>5 && pageBean_venue.currentPage!=1 && pageBean_venue.totalPage-pageBean_venue.currentPage>=3}">
								<c:forEach begin="${pageBean_venue.currentPage-1}" end="${pageBean_venue.currentPage+2}" var="page">
									<!-- 判断当前页 -->
									<c:if test="${pageBean_venue.currentPage==page }">
										<li class="active"><a href="javascript:void(0);">${page}</a></li>
									</c:if>
									<c:if test="${pageBean_venue.currentPage!=page }">
										<li><a href="javascript:void(0);" onclick="changePage(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
								<li><a href="javascript:void(0);" onclick="changePage('${pageBean_venue.currentPage+3}')">...</a></li>
							</c:if>

				             <!-- 判断当前页是否是最后一页 -->
							<c:if test="${pageBean_venue.currentPage==pageBean_venue.totalPage }">
								<li class="disabled">
									<a href="javascript:void(0);" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
							<c:if test="${pageBean_venue.currentPage!=pageBean_venue.totalPage }">
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
    	if("${empty pageBean_venue}"=="true"){
             $("#query_venue").submit();
        };
        //更新选项
        $(".showpagenum ul li a").each(function () {
            if("${pageBean_venue.currentCount}" == $(this).text()) $(this).hide();
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

    /* 添加新的场馆 */
    function openadd_venue_Modal() {
        var fatherBody = $(window.top.document.body); //获得父窗体的body
        //为父窗体添加modal内容
        fatherBody.append(' \
                <div class="modal fade in" id="add_venue_model" role="dialog" style="padding-left: 16px; display: block;">\
                <div class="modal-dialog">\
                    <div class="modal-content" style="margin-top:20%">\
                        <form>\
                            <div class="modal-header">\
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span\
                                        aria-hidden="true">&times;</span></button>\
                                <h4 class="modal-title" style="text-align: center;">添加场馆</h4>\
                            </div>\
                            <div class="modal-body">\
                                <div class="row" style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;" ><span>场馆名字:</span></div>\
                                    <div class="col-md-9 " style="padding-left:0px">\
                                        <input type="text" id="venue_Name" class="form-control" required autofocus>\
                                    </div>\
                                </div>\
                                <div class="row"style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;"><span>场馆类别:</span></div>\
                                    <div class="col-md-9 " style="padding-left:0px">\
                                        <select id="venue_Type" class="form-control">\
                                            <option value="乒乓球场">乒乓球场</option>\
                                            <option value="排球场">排球场</option>\
                                            <option value="篮球场">篮球场</option>\
                                            <option value="网球场">网球场</option>\
                                            <option value="羽毛球场">羽毛球场</option>\
                                        </select>\
                                    </div>\
                                </div>\
                                <div class="row"style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;"><span>接待能力:</span></div>\
                                    <div class="col-md-9" style="padding-left:0px">\
                                        <input type="text" id="venue_Capacity" class="form-control" required autofocus>\
                                    </div>\
                                </div>\
                                <div class="row"style="margin-top: 3px;">\
                                	<div class="col-md-2" style="margin-top: 5px;"><span>场馆价格:</span></div>\
                                	<div class="col-md-9" style="padding-left:0px">\
                                    	<input type="text" id="venue_Price" class="form-control" required autofocus>\
                                	</div>\
                            	</div>\
                                <div class="row"style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;"><span>开放时间:</span></div>\
                                    <div class="col-md-9" style="padding-left:0px">\
                                        <input type="hidden" id="venue_Open" value="9">\
                                        <select id="in_venue_st" onchange="add_venue_st(this)" class="form-control">\
                                            <option value="9">9:00</option>\
                                            <option value="10">10:00</option>\
                                            <option value="11">11:00</option>\
                                            <option value="12">12:00</option>\
                                            <option value="13">13:00</option>\
                                            <option value="14">14:00</option>\
                                            <option value="15">15:00</option>\
                                            <option value="16">16:00</option>\
                                            <option value="17">17:00</option>\
                                            <option value="18">18:00</option>\
                                        </select>\
                                    </div>\
                                </div>\
                                <div class="row"style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;"><span>关闭时间:</span></div>\
                                    <div class="col-md-9" style="padding-left:0px">\
                                        <input type="hidden" id="venue_Close" value="19">\
                                        <select id="in_venue_ed" onchange="add_venue_ed(this)" class="form-control">\
                                            <option value="10">10:00</option>\
                                            <option value="11">11:00</option>\
                                            <option value="12">12:00</option>\
                                            <option value="13">13:00</option>\
                                            <option value="14">14:00</option>\
                                            <option value="15">15:00</option>\
                                            <option value="16">16:00</option>\
                                            <option value="17">17:00</option>\
                                            <option value="18">18:00</option>\
                                            <option value="19">19:00</option>\
                                        </select>\
                                    </div>\
                                </div>\
                            </div>\
                            <div class="modal-footer">\
                                <button type="button" class="btn btn-default myclose" data-dismiss="modal">取消</button>\
                                <button type="button" class="submit_add_venue btn btn-primary">确认添加</button>\
                            </div>\
                        </form>\
                    </div>\
                </div>\
            </div>');
        fatherBody.append("<div id='backdropId_add_venue' class='modal-backdrop fade in'></div>"); //为父窗体添加遮罩
    }
    /* 编辑场馆 */
    function openupdate_venue_Modal(venue_Id,venue_Name,venue_Type,
    	venue_Capacity,venue_Price,venue_Open,venue_Close) {
        var fatherBody = $(window.top.document.body); //获得父窗体的body
       	var op_st = "";
       	for(var ix=venue_Open;ix<=21;ix++)
       		op_st+="<option value=\""+ix+"\">"+ix+":00</option>";
		var op_ed = "";
    	for(var ix=venue_Close;ix<=22;ix++)
    		op_ed+="<option value=\""+ix+"\">"+ix+":00</option>";
        //为父窗体添加modal内容
        fatherBody.append(' \
        <div class="modal fade in" id="update_venue_model" role="dialog" style="padding-left: 16px; display: block;">\
                <div class="modal-dialog">\
                    <div class="modal-content" style="margin-top:20%">\
                        <form>\
                            <div class="modal-header">\
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span\
                                        aria-hidden="true">&times;</span></button>\
                                <h4 class="modal-title" style="text-align: center;">修改场馆</h4>\
                            </div>\
                            <input type="hidden" id="venue_Id" value='
								+venue_Id+
							'>\
             <div class="modal-body">\
                 <div class="row" style="margin-top: 3px;">\
                     <div class="col-md-2" style="margin-top: 5px;" ><span>场馆名字:</span></div>\
                     <div class="col-md-9 " style="padding-left:0px">\
                         <input type="text" id="venue_Name" class="form-control" readonly="readonly" required autofocus value='
                                        	+venue_Name+
                                           	'>\
                                    </div>\
                                </div>\
                                <div class="row"style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;"><span>场馆类别:</span></div>\
                                    <div class="col-md-9 " style="padding-left:0px">\
                                         <select id="venue_Type" class="form-control">\
                                            <option value="乒乓球场">乒乓球场</option>\
                                            <option value="排球场">排球场</option>\
                                            <option value="篮球场">篮球场</option>\
                                            <option value="网球场">网球场</option>\
                                            <option value="羽毛球场">羽毛球场</option>\
                                        </select>\
                                    </div>\
                                </div>\
                                <div class="row"style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;"><span>接待能力:</span></div>\
                                    <div class="col-md-9" style="padding-left:0px">\
                                        <input type="text" id="venue_Capacity" class="form-control" required autofocus value='
                                        	+venue_Capacity+
                                           	'>\
                                    </div>\
                                </div>\
                                <div class="row"style="margin-top: 3px;">\
                                	<div class="col-md-2" style="margin-top: 5px;"><span>场馆价格:</span></div>\
                                	<div class="col-md-9" style="padding-left:0px">\
                                    	<input type="text" id="venue_Price" class="form-control" required autofocus value='
                                        	+venue_Price+
                                           	'>\
                                	</div>\
                            	</div>\
                                <div class="row"style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;"><span>开放时间:</span></div>\
                                    <div class="col-md-9" style="padding-left:0px">\
                                        <input type="hidden" id="venue_Open" value='
                                        	+venue_Open+
                                           	'>\
											<select id="in_venue_st" onchange="add_venue_st(this)" class="form-control">'
											+op_st+
                                        '</select>\
                                    </div>\
                                </div>\
                                <div class="row"style="margin-top: 3px;">\
                                    <div class="col-md-2" style="margin-top: 5px;"><span>关闭时间:</span></div>\
                                    <div class="col-md-9" style="padding-left:0px">\
                                        <input type="hidden" id="venue_Close" value='
                                        	+venue_Close+
                                           	'>\
                                        <select id="in_venue_ed" onchange="add_venue_ed(this)" class="form-control">'
                                         +op_ed+
                                        '</select>\
                                    </div>\
                                </div>\
                            </div>\
                            <div class="modal-footer">\
                                <button type="button" class="btn btn-default myclose" data-dismiss="modal">取消</button>\
                                <button type="button" class="submit_update_venue btn btn-primary">确认修改</button>\
                            </div>\
                        </form>\
                    </div>\
                </div>\
            </div>');
        fatherBody.append("<div id='backdropId_update_venue' class='modal-backdrop fade in'></div>"); //为父窗体添加遮罩
    }
    /* 删除场馆 */
    function opendel_venue_Modal(del_id) {
        var fatherBody = $(window.top.document.body); //获得父窗体的body
        //为父窗体添加modal内容
        fatherBody.append(' \
                <div class="modal fade in" id="del_venue_model" role="dialog" style="padding-left: 16px; display: block;">\
                <div class="modal-dialog" style="margin-top:15%">\
                    <div class="modal-content" style="width:300px;top: 50%;left: 50%;margin-top: -25px;margin-left: -150px;">\
                        <form>\
                        	<input type="hidden" id="del_venue_id" value='
                        	+del_id+
                        	'>\
                            <div class="modal-header">\
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span\
                                        aria-hidden="true">&times;</span></button>\
                                <h4 class="modal-title" style="text-align: center;">操作提示</h4>\
                            </div>\
                            <div class="modal-body">\
                                <label for="message-text" class="control-label">确定要删除所选场馆？</label>\
                            </div>\
                            <div class="modal-footer">\
                            <button type="button" class="btn btn-default myclose" data-dismiss="modal">取消</button>\
                            <button type="button" class="submit_del_venue btn btn-danger">确定</button>\
                        </div>\
                        </form>\
                    </div>\
                </div>\
            </div>');
        fatherBody.append("<div id='backdropId_del_venue' class='modal-backdrop fade in'></div>"); //为父窗体添加遮罩
    }
</script>
</html>
