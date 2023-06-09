<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/toastr.min.css" />
    <title>体育馆场地管理系统</title>
    <style type="text/css">
        /* 不显示右侧滚动条 */
        body{
            overflow-y: hidden;
            overflow-x: hidden;
        }
        /*调整导航条与下面元素的间距*/
        .navbar-myset{
            margin-bottom: 0px;
        }
        /*调整图标和菜单栏和导航条的间距*/
        .icon-myset,.direction{
            padding-top: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid;
            border-right: 1px solid;
            border-color: #e7e7e7;
        }
        /* 设置图标间距 */
        .icon-setpd{
            margin-left:  8px;
            margin-right: 9px;
        }
        .icon-myset :first-child{
            margin-left: 20px;
        }
        /*让左右紧贴*/
        .all-menu-set{
            padding-right: 0px;
        }
        .menu-right{
            padding-left: 0px;
            padding-right: 0px;
        }
        /*把菜单栏靠近最左*/
        .container-myset{
            padding-left: 0px;
            margin-left: 0px;
            margin-right: 0px;
            width: 100%;
        }
        /* 设置菜单栏的边框样式 */
        .menu-myset{
            border-bottom: 1px solid;
            border-right: 1px solid;
            border-color: #e7e7e7;
        }
        .menu-myset>li{
            border-bottom: 1px solid;
            border-color: #e7e7e7;
        }
        /* 设置菜单栏内图标和文字间隔 */
        .menu-myset>li>a>img{
            padding-right: 6px;
        }
        /*设置菜单栏紧贴着*/
        .nav-stacked>li+li {
            margin-top: 0px;
        }
        /*设置首页图标间隔*/
        .direction{
            padding-left: 20px;
            border-top: 0px;
            border-left: 0px;
            border-right: 0px;
        }
        /*设置首页图标和文字的间隔*/
        .direction>img{
            vertical-align: bottom;
            margin-right: 5px;
        }
        /* 将logo和文字调整到同一行 */
        .hidden-xs {
            float: left;
            margin-right: 5px;
        }
        /* 设置管理员图标及文字大小 */
        .admin-set {
            font-size: 15px;
        }
        /* 设置iframe的父框架的height */
        .tab-pane{
            height: 100%;
        }

    </style>

</head>
<body>
    <!-- 实现导航条 -->
    <nav class="navbar navbar-default navbar-myset" role="navigation">
        <!-- 导航条的左边图标及文字 -->
        <div class="navbar-header" >
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/bck_index.jsp">
<%--                 <img alt="Charisma Logo" src="${pageContext.request.contextPath}/img/logo20.png" class="hidden-xs"> --%>
                <span>体育馆场地管理系统-管理员模块</span>
            </a>
        </div>
        <!-- 管理员菜单 -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown admin-set">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false">
                        <i class="glyphicon glyphicon-user"></i>
                        ${admin.admin_Username}
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" style="min-width: 100%;">
                        <li><a href="javascript:void(0)" data-toggle="modal" data-target="#UpdatePassword">修改密码</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="javascript:void(0)" class="logout">注销登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
	
    <div class="container container-myset">
        <div class="row">
            <div class="col-lg-2 col-sm-2 all-menu-set">
                <div class="icon-myset">
                    <img class="icon-setpd" src="${pageContext.request.contextPath}/img/soccer-ball-variant.png" >
                    <img class="icon-setpd" src="${pageContext.request.contextPath}/img/basketball.png">
                    <img class="icon-setpd" src="${pageContext.request.contextPath}/img/ping-pong.png">
                    <img class="icon-setpd" src="${pageContext.request.contextPath}/img/badminton.png">
                    <img class="icon-setpd" src="${pageContext.request.contextPath}/img/snooker.png">
                </div>
                <ul class="nav nav-pills nav-stacked menu-myset">
                    <li role="presentation" class="menu-li active">
                        <a href="#summary" data-toggle="tab" onclick="changedirection('总览')">
<%--                            <img src="${pageContext.request.contextPath}/img/report.png">--%>
                            总览
                        </a>
                    </li>
                    <li role="presentation" class="menu-li">
                        <a href="#venue" data-toggle="tab" onclick="changedirection('场地管理')">
<%--                            <img src="${pageContext.request.contextPath}/img/updated.png">--%>
                            场地管理
                        </a>
                    </li>
                    <li role="presentation" class="menu-li">
                        <a href="#order" data-toggle="tab" onclick="changedirection('预约查询')">
<%--                            <img src="${pageContext.request.contextPath}/img/loupe.png">--%>
                            预约查询
                        </a>
                    </li>
                    <li role="presentation" class="menu-li">
                        <a href="#notice" data-toggle="tab" onclick="changedirection('通知发布')">
<%--                            <img src="${pageContext.request.contextPath}/img/send.png">--%>
                            通知发布
                        </a>
                    </li>
<%--                    <li role="presentation" class="menu-li">--%>
<%--                        <a href="#analytics" data-toggle="tab" onclick="changedirection('情况分析')">--%>
<%--&lt;%&ndash;                            <img src="${pageContext.request.contextPath}/img/analytics.png">&ndash;%&gt;--%>
<%--                            情况分析--%>
<%--                        </a>--%>
<%--                    </li>--%>
                    <li role="presentation" class="menu-li">
                        <a href="#user" data-toggle="tab" onclick="changedirection('用户管理')">
<%--                            <img src="${pageContext.request.contextPath}/img/analytics.png">--%>
                            用户管理
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-10 col-sm-10 menu-right">
                <div class="direction">
                    <img src="${pageContext.request.contextPath}/img/home.png">
                    <span>首页</span>
                    <span class="glyphicon glyphicon-menu-right">
                    </span>
                    <span id="ddirection">总览</span>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="summary">
                        <iframe id ="iframe_summary" src ="${pageContext.request.contextPath}/admin/bck_summary.jsp" width="100%" height="100%" marginheight="0" marginwidth="0" frameborder="0">
                            <p>Your browser does not support iframes.</p>
                        </iframe>                            
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="venue">
                        <iframe id ="iframe_venue" src ="${pageContext.request.contextPath}/admin/bck_venue.jsp" width="100%" height="100%" marginheight="0" marginwidth="0" frameborder="0">
                            <p>Your browser does not support iframes.</p>
                        </iframe> 
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="order">
                        <iframe id ="iframe_order" src ="${pageContext.request.contextPath}/admin/bck_order.jsp" width="100%" height="100%" marginheight="0" marginwidth="0" frameborder="0">
                            <p>Your browser does not support iframes.</p>
                        </iframe> 
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="notice">
                        <iframe id ="iframe_notice" src ="${pageContext.request.contextPath}/admin/bck_notice.jsp" width="100%" height="100%" marginheight="0" marginwidth="0" frameborder="0" >
                            <p>Your browser does not support iframes.</p>
                        </iframe> 
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="analytics">
                        <iframe id ="iframe_analytics" src ="${pageContext.request.contextPath}/admin/bck_analytics.jsp" width="100%" height="100%" marginheight="0" marginwidth="0" frameborder="0" >
                            <p>Your browser does not support iframes.</p>
                        </iframe> 
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="user">
                        <iframe id ="iframe_user" src ="${pageContext.request.contextPath}/admin/bck_user.jsp" width="100%" height="100%" marginheight="0" marginwidth="0" frameborder="0" >
                            <p>Your browser does not support iframes.</p>
                        </iframe>
                    </div>
                  </div>
            </div>
        </div>
    </div>
    <!-- 修改密码模态框 -->
    <div class="modal fade" id="UpdatePassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document" >
          <div class="modal-content" style="margin-top:20%;">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="exampleModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
              <form id="admin_update" method="post" action="${pageContext.request.contextPath}/admin?method=update_password">
                <div class="form-group">
                  <label for="recipient-name" class="control-label">原密码:</label>
                  <input type="password" name="prepassword" class="form-control" id="prepassword">
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="control-label">新密码:</label>
                    <input type="password" name="newpassword" class="form-control" id="newpassword">
                  </div>
                  <div class="form-group">
                    <label for="recipient-name" class="control-label">确认密码:</label>
                    <input type="password" class="form-control" id="repassword">
                  </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">取消修改</button>
              <button type="button" class="submit_update_password btn btn-danger">确认修改</button>
            </div>
          </div>
        </div>
      </div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/js/md5.js"></script>
<script>
	$(function() {
	    // 设置操作结果提示的位置和展示时间
	    toastr.options.positionClass = 'toast-center-center';
	    toastr.options.timeOut = 1200;
	
	    hoverdropdownOpen();
	    
	    //调整iframe的宽度
	    var h1 = $(window).height(); //获取整个浏览器客户端的高度
	    var h2 = $(".navbar-myset").height(); //获取导航条的高度
	    var h3 = $(".icon-myset").height(); //获取导航条的高度
	    var h4 = $(".direction").height(); //获取当前位置指示条的高度
	    $(".menu-myset").height((h1-h2-h3)+'px');
	    $(".tab-content").height((h1-h2-h3)+'px');
	    
	    //关闭模态框
	    $("body").on("click", ".close,.myclose",function(e){
	        //关闭notice的modal内容
	        $("#add_notice_model").remove(); 
	        $("#update_notice_model").remove();
	        $("#del_notice_model").remove();
	        //关闭venue的modal内容
            $("#add_venue_model").remove();
            $("#update_venue_model").remove();
            $("#del_venue_model").remove();
            //关闭user的modal内容
            $("#add_user_model").remove();
            $("#update_user_model").remove();
            $("#del_user_model").remove();
	        //移除遮罩
	        $("#backdropId_add_notice").remove(); 
	        $("#backdropId_del_notice").remove();
	        $("#backdropId_update_notice").remove();
	        $("#backdropId_add_venue").remove(); 
	        $("#backdropId_del_venue").remove();
	        $("#backdropId_update_venue").remove();
	    });
	    
	    //提交notice的添加
	    $("body").on("click", ".submit_add_notice",function(e){
	        $.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/admin?method=add_notice",
				"type":"POST",
				"data":{"notice_Man":$('#notice_Man').val(),"notice_Title":$('#notice_Title').val(),
					"notice_Content":$('#notice_Content').val(),"notice_Time":$('#notice_Time').val()
				},
				"dataType":"json",
				"success":function(data){
					toastr.success('添加通知成功');
					$("#backdropId_add_notice").remove(); //移除遮罩
			        $("#add_notice_model").remove(); //关闭modal内容
					$('#iframe_notice').attr('src',"${pageContext.request.contextPath}/admin/bck_notice.jsp");//刷新子页面
				}
			});
	    });
	    
	    //提交notice的删除
	    $("body").on("click", ".submit_del_notice",function(e){
	    	 $.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/admin?method=del_notice",
				"type":"POST",
				"data":{"del_notice_id":$('#del_notice_id').val()},
				"dataType":"json",
				"success":function(data){
					toastr.success('删除通知成功');
					$("#backdropId_del_notice").remove(); //移除遮罩
			        $("#del_notice_model").remove(); //关闭modal内容
					$('#iframe_notice').attr('src',"${pageContext.request.contextPath}/admin/bck_notice.jsp");//刷新子页面
				}
			});
	    });
	    
	    //提交notice的修改
	    $("body").on("click", ".submit_update_notice",function(e){
	    	 $.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/admin?method=update_notice",
				"type":"POST",
				"data":{"notice_Id":$('#notice_Id').val(),"notice_Man":$('#notice_Man').val(),"notice_Title":$('#notice_Title').val(),
					"notice_Content":$('#notice_Content').val(),"notice_Time":$('#notice_Time').val()
				},
				"dataType":"json",
				"success":function(data){
					toastr.success('修改通知成功');
					$("#backdropId_update_notice").remove(); //移除遮罩
			        $("#update_notice_model").remove(); //关闭modal内容
					$('#iframe_notice').attr('src',"${pageContext.request.contextPath}/admin/bck_notice.jsp");//刷新子页面
				}
			});
	    });
	   
	    //提交venue的添加
	    $("body").on("click", ".submit_add_venue",function(e){
	        $.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/admin?method=add_venue",
				"type":"POST",
				"data":{"venue_Type":$('#venue_Type').val(),"venue_Name":$('#venue_Name').val(),
					"venue_Price":$('#venue_Price').val(),"venue_Capacity":$('#venue_Capacity').val(),
					"venue_Open":$('#venue_Open').val(),"venue_Close":$('#venue_Close').val()
				},
				"dataType":"json",
				"success":function(data){
					toastr.success('添加场馆成功');
					$("#backdropId_add_venue").remove(); //移除遮罩
			        $("#add_venue_model").remove(); //关闭modal内容
					$('#iframe_venue').attr('src',"${pageContext.request.contextPath}/admin/bck_venue.jsp");//刷新子页面
				}
			});
	    });
	    
	    //提交venue的删除
	    $("body").on("click", ".submit_del_venue",function(e){
	    	 $.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/admin?method=del_venue",
				"type":"POST",
				"data":{"del_venue_id":$('#del_venue_id').val()},
				"dataType":"json",
				"success":function(data){
					toastr.success('删除场馆成功');
					$("#backdropId_del_venue").remove(); //移除遮罩
			        $("#del_venue_model").remove(); //关闭modal内容
					$('#iframe_venue').attr('src',"${pageContext.request.contextPath}/admin/bck_venue.jsp");//刷新子页面
				}
			});
	    });
	    
	    //提交venue的修改
	    $("body").on("click", ".submit_update_venue",function(e){
	        $.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/admin?method=update_venue",
				"type":"POST",
				"data":{"venue_Id":$('#venue_Id').val(),
					"venue_Type":$('#venue_Type').val(),"venue_Name":$('#venue_Name').val(),
					"venue_Price":$('#venue_Price').val(),"venue_Capacity":$('#venue_Capacity').val(),
					"venue_Open":$('#venue_Open').val(),"venue_Close":$('#venue_Close').val()
				},
				"dataType":"json",
				"success":function(data){
					toastr.success('修改场馆成功');
					$("#backdropId_update_venue").remove(); //移除遮罩
			        $("#update_venue_model").remove(); //关闭modal内容
					$('#iframe_venue').attr('src',"${pageContext.request.contextPath}/admin/bck_venue.jsp");//刷新子页面
				}
			});
	    });

        //提交user的修改
        $("body").on("click", ".submit_update_user",function(e){
            $.ajax({
                "async":false,
                "url":"${pageContext.request.contextPath}/admin?method=update_user",
                "type":"POST",
                "data":{"user_Id":$('#user_Id').val(),
                    "balance":$('#balance').val()
                },
                "dataType":"json",
                "success":function(data){
                    toastr.success('修改用户余额成功');
                    $("#backdropId_update_venue").remove(); //移除遮罩
                    $("#update_user_model").remove(); //关闭modal内容
                    $('#iframe_user').attr('src',"${pageContext.request.contextPath}/admin/bck_user.jsp");//刷新子页面
                }
            });
        });
	    //提交password的修改
	    $("body").on("click", ".submit_update_password",function(e){
	    	if($('#prepassword').val().trim()==''){
				toastr.warning('原密码不能为空');	
			}
			else if($('#newpassword').val().trim()==''){
				toastr.warning('新密码不能为空');
			}
			else if($('#newpassword').val().trim()!=$('#repassword').val().trim()){
				toastr.warning('两次填写密码不一致');
			}
			else if($('#prepassword').val().trim()!="${admin.admin_Password}"){
				toastr.error('原密码填写错误');
			}
			else{
				$("#admin_update").submit();
			}
	    });

	    //退出登录
	    $("body").on("click", ".logout",function(e){
	    	$.ajax({
				"async":true,
				"url":"${pageContext.request.contextPath}/admin?method=logout",
				"type":"POST",
				"dataType":"json",
				"success":function(data){
					$(location).attr('href', '${pageContext.request.contextPath}/admin/bck_login.jsp');
				}
			});
	    });
	}); 

	//设置鼠标悬浮展示
	function hoverdropdownOpen() {
	   var $dropdownLi = $('li.dropdown');
	   $dropdownLi.mouseover(function() {
	     $(this).addClass('open');
	   }).mouseout(function() {
	     $(this).removeClass('open');  
	   });
	 }
	
	//设置添加场馆开放时间函数
	function add_venue_st(obj){
	    var st = obj.value;
	    //赋值
	    $("#venue_Open").attr("value",st);
	    //清空
	    $("#in_venue_ed").empty();
	    //添加
	    for(var i=parseInt(st)+1;i<=22;i++){
	        $("#in_venue_ed").append("<option value='"+i+"'>"+i+":00</option>");
	    }    
	}
	
	//设置添加场馆关闭时间函数
	function add_venue_ed(obj){
	    var ed = obj.value;
	    $("#venue_Close").attr("value",ed);
	}
	
	//设置点击更换direction
	function changedirection(tx){
		$('#ddirection').text(tx);
	}
</script>
</html>
