<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>游戏管理后台</title>
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- bootstrap framework -->
    <link href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <!-- main stylesheet -->
    <link href="${pageContext.request.contextPath}/admin/css/main.min.css" rel="stylesheet" media="screen" id="mainCss">
    <!-- elegant icons -->
    <link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" media="screen">
    <!-- datepicker -->
    <link href="${pageContext.request.contextPath}/admin/css/datepicker3.css" rel="stylesheet" media="screen">
    <!-- jBox -->
    <link href="${pageContext.request.contextPath}/admin/css/jbox.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/admin/css/noticeborder.css" rel="stylesheet" media="screen">

</head>
<body class="side_menu_active side_menu_expanded">
<div id="page_wrapper">

    <!-- header -->
    <header id="main_header">
        <div class="container-fluid">
            <!--logo-->
            <div class="brand_section">
                <a href="#"><img src="${pageContext.request.contextPath}/admin/picture/logo01.png" alt="site_logo"
                                 width="108" height="40" style="margin-top: 5px"></a>
            </div>
            <div class="header_user_actions dropdown">
                <div data-toggle="dropdown" class="dropdown-toggle user_dropdown">
                    <div class="user_avatar">
                        <img src="${pageContext.request.contextPath}/admin/picture/head01.png" width="38" height="38">
                    </div>
                    <span class="caret"></span>
                </div>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="#">个人中心</a></li>
                    <li><a href="#">注销</a></li>
                </ul>
            </div>
        </div>
    </header>

    <!-- main content -->
    <div id="main_wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- 查询表单 -->
                    <form id="search_form" action="#" method="post">
                        <!--查询条件部分-->
                        <div class="row">
                            <!--按名称查询-->
                            <div class="col-md-2">
                                <input style="height:35px" id="search_item_name" type="text"
                                       class="form-control input-sm" placeholder="输入名称" name="item_name" value="">
                            </div>

                            <!--按类型或者平台选择-->
                            <div class="col-md-1">
                                <button style="width:120px" id="search_tagsAndPlatform_btn" type="button"
                                        data-toggle="modal" data-target="#tagsAndplatfromLayer" class="btn btn-primary">
                                    选择标签或平台
                                </button>
                            </div>

                            <div class="col-md-9">
                                <!--查询按钮 - 提交-->
                                <button id="search_btn" type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
                                <!-- 重置查询条件 并提交 -->
                                <button id="reset_search_btn" type="button" class="btn btn-primary">重置</button>
                            </div>
                        </div>
                    </form><!-- 查询表单 end  -->
                    <!-- 查询结果显示 -->
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-yuk2 toggle-arrow-tiny" id="footable_demo"
                                   data-filter="#textFilter" data-page-size="10">
                                <thead>
                                <tr>
                                    <!--描述：游戏数据标签-->
                                    <th>id</th>
                                    <th>游戏名称</th>
                                    <th>类型</th>
                                    <th>平台</th>
                                    <!-- 调用排序方法，将自己的字段名传 -->
                                    <th>折扣</th>
                                    <th>原价</th>
                                    <th>图片地址</th>
                                    <th>发售日期</th>
                                    <th>是否热门</th>
                                    <th>是否畅销</th>
                                    <th>是否免费</th>
                                    <th>是否特价</th>
                                    <th>是否即将推出</th>
                                    <th>是否新品</th>
                                    <th>状态</th>
                                </tr>
                                </thead>
                               <%-- <c:forEach items="${itemList}" var="item">
                                    <tbody id="item_info_date">
                                    <tr>
                                        <td>${item.item_id}</td>
                                        <td>${item.item_name}</td>
                                        <td class="item_tag_name">${item.item_tagids}</td>
                                        <td class="item_platform_name">${item.item_platform}</td>
                                        <td>${item.item_discount == '0'? '无折扣':item.item_discount}</td>
                                        <td>${item.item_original_price}</td>
                                        <td>${item.item_cap_image}</td>
                                        <td>${item.item_release_date}</td>
                                        <td>${item.is_hot == true ?'热门':'否'}</td>
                                        <td>${item.is_hot_sale == true ?'热销':'否'}</td>
                                        <td>${item.is_free == true ?'免费':'否'}</td>
                                        <td>${item.is_specials == true ?'特价':'否'}</td>
                                        <td>${item.is_upcoming == true ?'即将推出':'否'}</td>
                                        <td>${item.is_new == true ?'新品':'否'}</td>
                                        <td>${item.is_enable == true ?'上架':'已下架'}</td>
                                        <td>
                                            <a herf="#" id="edit_btn" class="btn btn-xs btn-info" data-toggle="modal"
                                               data-target="#editLayer" onclick="editItems()">修改</a>
                                            <a herf="#" id="del_btn" class="btn btn-xs btn-danger"
                                               onclick="deleteItems()">下架</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:forEach>--%>
                                <c:forEach items="${itemList }" var="item">
                                    <tbody id="item_info_date">
                                    <tr>
                                        <td>${item.item_id }</td>
                                        <td>${item.item_name }</td>
                                        <td class="item_tag_name">${item.item_tagids }</td>
                                        <td class="item_platform_name">${item.item_platform }</td>
                                        <td>${item.item_discount == '0' ? '无折扣' : item.item_discount }</td>
                                        <td>${item.item_original_price }</td>
                                        <td>${item.item_cap_image }</td>
                                        <td>${item.item_release_date }</td>
                                        <td>${item.is_hot == true ? '热门' :  '否' }</td>
                                        <td>${item.is_hot_sale == true ? '热销' :  '否'  }</td>
                                        <td>${item.is_free == true ? '免费' :  '否'  }</td>
                                        <td>${item.is_specials == true ? '特价' :  '否'  }</td>
                                        <td>${item.is_upcoming == true ? '即将推出' :  '否'  }</td>
                                        <td>${item.is_new == true ? '新品' :  '否'  }</td>
                                        <td>${item.is_enable == true ? '上架' :  '已下架'  }</td>
                                        <td><!--   -->
                                            <a herf="#" id="edit_btn" class="btn btn-xs btn-info" data-toggle="modal" data-target="#editLayer" onclick="editItems(${item.item_id})">修改</a>
                                            <a herf="#" id="del_btn" class="btn btn-xs ${item.is_enable == true ? 'btn-warning' : 'btn-danger' }" onclick="deleteItems(${item.item_id}, ${item.is_enable})">${item.is_enable == true ? '下架' : '上架' }</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:forEach>

                                <tfoot class="hide-if-no-paging">
                                <tr>
                                    <td colspan="5">
                                        <ul class="pagination pagination-sm"></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div><!-- 查询结果显示 end-->
                </div>
            </div>
        </div>
    </div>

    <!-- add layer 游戏添加弹出层-->
    <div class="modal fade" id="addLayer">
        <div class="modal-dialog modal-content">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加游戏</h4>
                </div>
                <div class="modal-body">
                    <!--描述：添加游戏弹出层表单-->
                    <form class="form-horizontal" id="add_items_form">
                        <!-- item_id -->
                        <div class="form-group">
                            <label for="add_item_id" class="col-sm-2 control-label">id</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_item_id" placeholder="id"
                                       name="item_id">
                            </div>
                        </div>

                        <!-- 名称 -->
                        <div class="form-group">
                            <label for="add_item_name" class="col-sm-2 control-label">游戏名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_item_name" placeholder="游戏名称"
                                       name="item_name">
                            </div>
                        </div>

                        <!-- 标签 -->
                        <div class="form-group">
                            <label for="add_item_tagids" class="col-sm-2 control-label">标签</label>
                            <div class="col-sm-10">
                                <div>
                                    <label><input type="checkbox" name="add_tag" value="">角色扮演</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="add_tag" value="">动作</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="add_tag" value="">冒险</label>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>

                        <!-- 平台 -->
                        <div class="form-group">
                            <label for="add_item_platform" class="col-sm-2 control-label">平台</label>
                            <div class="col-sm-10">
                                <div>
                                    <label><input type="checkbox" name="add_tag" value="">win</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="add_tag" value="">mac</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="add_tag" value="">linux</label>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>

                        <!-- 折扣 -->
                        <div class="form-group">
                            <label for="add_item_discount" class="col-sm-2 control-label">折扣</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_item_discount" placeholder="折扣"
                                       name="item_discount">
                            </div>
                        </div>

                        <!-- 原价-->
                        <div class="form-group">
                            <label for="add_item_original_price" class="col-sm-2 control-label">原价</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_item_original_price" placeholder="原价"
                                       name="item_original_price">
                            </div>
                        </div>

                        <!-- 封面 -->
                        <div class="form-group">
                            <label for="add_item_cap_image" class="col-sm-2 control-label">游戏封面</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" id="add_item_cap_image" name="upload_image">
                            </div>
                        </div>

                        <!-- 发售日期 -->
                        <div class="form-group">
                            <label for="add_item_release_date" class="col-sm-2 control-label">发售日期</label>
                            <div class="col-sm-10">
                                <div class="input-group date" id="dp_component">
                                    <input type="text" class="form-control" placeholder="发售日期" name="item_release_date">
                                    <span class="input-group-addon"><i class="icon_calendar"></i></span>
                                </div>
                            </div>
                        </div>

                        <!-- 标志位 读取数据词典中所有标志位进行加载 -->
                        <div class="form-group">
                            <label for="add_other" class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div>
                                    <!-- 读取数据词典中的 标志位 -->
                                    <label><input type="checkbox" class="add_item_flag" name="" value="">新品</label>
                                    <label><input type="checkbox" class="add_item_flag" name="" value="">优惠</label>
                                    <label><input type="checkbox" class="add_item_flag" name="" value="">免费游戏</label>
                                </div>
                            </div>
                        </div>
                    </form><!--描述：添加游戏弹出层表单 end-->
                </div>
                <div class="modal-footer">
                    <!-- 表单取消和确认按钮 -->
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary btn-sm" onclick="addItem()">确认添加</button>
                </div>
            </div>
        </div>
    </div><!-- add layer 游戏添加弹出层 end-->

    <!-- edit layer 游戏修改弹出层-->
    <div class="modal fade" id="editLayer">
        <div class="modal-dialog modal-content">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改游戏</h4>
                </div>
                <div class="modal-body">
                    <!--描述：游戏修改弹出层-->
                    <form class="form-horizontal" id="edit_items_form" method="post">
                        <!-- item_id -->
                        <input type="hidden" id="edit_item_id" name="item_id"/>

                        <!-- 名称 -->
                        <div class="form-group">
                            <label for="edit_item_name" class="col-sm-2 control-label">游戏名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_item_name" placeholder="游戏名称"
                                       name="item_name">
                            </div>
                        </div>

                        <!-- 标签 -->
                        <div class="form-group">
                            <label for="edit_item_tagids" class="col-sm-2 control-label">标签</label>
                            <div class="col-sm-10">
                                <div>
                                    <label><input type="checkbox" name="edit_tag" value="">角色扮演</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="edit_tag" value="">冒险</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="edit_tag" value="">动作</label>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>

                        <!-- 平台 -->
                        <div class="form-group">
                            <label for="edit_item_platform" class="col-sm-2 control-label">平台</label>
                            <div class="col-sm-10">
                                <div>
                                    <label><input type="checkbox" name="edit_platform" value="">win</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="edit_platform" value="">mac</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="edit_platform" value="">linux</label>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>

                        <!-- 折扣 -->
                        <div class="form-group">
                            <label for="edit_item_discount" class="col-sm-2 control-label">折扣</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_item_discount" placeholder="折扣"
                                       name="item_discount">
                            </div>
                        </div>

                        <!-- 原价 -->
                        <div class="form-group">
                            <label for="edit_item_original_price" class="col-sm-2 control-label">原价</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_item_original_price" placeholder="原价"
                                       name="item_original_price">
                            </div>
                        </div>

                        <!-- 封面 -->
                        <div class="form-group">
                            <label for="edit_item_cap_image_src" class="col-sm-2 control-label">游戏封面</label>
                            <div class="col-sm-10">
                                <img id="edit_item_cap_image_src" alt="" src="">
                            </div>
                        </div>

                        <!-- 上传图片 -->
                        <div class="form-group">
                            <label for="edit_item_cap_image" class="col-sm-2 control-label">上传图片</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" id="edit_item_cap_image" name="upload_image">
                            </div>
                        </div>

                        <!-- 发售日期 -->
                        <div class="form-group">
                            <label for="edit_item_release_date" class="col-sm-2 control-label">发售日期</label>
                            <div class="col-sm-10">
                                <div class="input-group date" id="dp_component">
                                    <input type="text" class="form-control" placeholder="发售日期"
                                           id="edit_item_release_date" name="item_release_date" value="">
                                    <span class="input-group-addon"><i class="icon_calendar"></i></span>
                                </div>
                            </div>
                        </div>

                        <!-- 游戏标志位 -->
                        <div class="form-group">
                            <label for="edit_other" class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div>
                                    <!-- 所有游戏标志位 -->
                                    <label><input type="checkbox" class="edit_item_flag" name="" value="">新品</label>
                                    <label><input type="checkbox" class="edit_item_flag" name="" value="">优惠</label>
                                    <label><input type="checkbox" class="edit_item_flag" name="" value="">免费游戏</label>
                                </div>
                            </div>
                        </div>
                    </form><!--描述：添加游戏弹出层表单 end-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary btn-sm" onclick="updateItem()">确认修改</button>
                </div>
            </div>
        </div>
    </div><!-- edit layer 游戏修改弹出层 end-->

    <!-- search_tagsAndplatfrom_layer 选择标签或平台的查询条件弹出层-->
    <div class="modal fade" id="tagsAndplatfromLayer">
        <div class="modal-dialog modal-content">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">选择标签或者平台</h4>
                </div>
                <div class="modal-body">
                    <!--描述：选择标签或平台的查询条件弹出层 表单-->
                    <form class="form-horizontal" id="search_tagsAndplatfromLayer" method="post">
                        <!-- item_id -->
                        <!-- <input type="hidden" id="edit_item_id" name="item_id"/> -->

                        <!-- 标签 -->
                        <div class="form-group">
                            <label for="edit_item_tagids" class="col-sm-2 control-label">标签</label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <label><input type="checkbox" name="search_tag" value="">角色扮演</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="search_tag" value="">冒险</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="search_tag" value="">动作</label>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>
                        <!-- 平台 -->
                        <div class="form-group">
                            <label for="edit_item_platform" class="col-sm-2 control-label">平台</label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <label><input type="checkbox" name="search_platform" value="">win</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="search_platform" value="">mac</label>&nbsp;&nbsp;
                                    <label><input type="checkbox" name="search_platform" value="">linux</label>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>
                    </form><!--描述：选择标签或平台的查询条件弹出层 表单 end-->
                </div>
                <div class="modal-footer">
                    <button id="search_cancel_btn" type="button" class="btn btn-default btn-sm" data-dismiss="modal">
                        取消
                    </button>
                    <button type="button" class="btn btn-primary btn-sm" onclick="">确认选择</button>
                </div>
            </div>
        </div>
    </div><!-- search_tagsAndplatfrom_layer 选择标签或平台的查询条件弹出层 end-->

    <!-- main menu 左侧主菜单按钮-->
    <nav id="main_menu">
        <div class="menu_wrapper">
            <ul>
                <li class="first_level">
                    <a href="javascript:void(0)">
                        <span class="icon_document_alt first_level_icon"></span>
                        <span class="menu-title">游戏管理</span>
                    </a>
                    <ul>
                        <li class="submenu-title">游戏管理</li>
                        <li><a href="#" data-toggle="modal" data-target="#addLayer">添加游戏</a></li>
                        <li><a href="#">游戏列表</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="menu_toggle">
                    <span class="icon_menu_toggle">
                        <i class="arrow_carrot-2left toggle_left"></i>
                        <i class="arrow_carrot-2right toggle_right" style="display:none"></i>
                    </span>
        </div>
    </nav><!-- main menu 左侧主菜单按钮 end-->
</div>

<!-- 引入第三方js文件 -->
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
<!-- jQuery Cookie -->
<script src="${pageContext.request.contextPath}/admin/js/jquerycookie.min.js"></script>
<!-- Bootstrap Framework -->
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
<!-- retina images -->
<script src="${pageContext.request.contextPath}/admin/js/retina.min.js"></script>
<!-- switchery -->
<script src="${pageContext.request.contextPath}/admin/js/switchery.min.js"></script>
<!-- typeahead -->
<script src="${pageContext.request.contextPath}/admin/js/typeahead.bundle.min.js"></script>
<!-- fastclick -->
<script src="${pageContext.request.contextPath}/admin/js/fastclick.min.js"></script>
<!-- match height -->
<script src="${pageContext.request.contextPath}/admin/js/jquery.matchheight-min.js"></script>
<!-- scrollbar -->
<script src="${pageContext.request.contextPath}/admin/js/jquery.mcustomscrollbar.concat.min.js"></script>
<!-- moment.js (date library) -->
<script src="${pageContext.request.contextPath}/admin/js/moment-with-langs.min.js"></script>
<!-- Yukon Admin functions -->
<script src="${pageContext.request.contextPath}/admin/js/yukon_all.min.js"></script>
<!-- page specific plugins -->
<!-- footable -->
<script src="${pageContext.request.contextPath}/admin/js/footable.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/footable.paginate.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/footable.filter.min.js"></script>
<!-- datepicker -->
<script src="${pageContext.request.contextPath}/admin/js/bootstrap-datepicker.js"></script>
<!-- jBox -->
<script src="${pageContext.request.contextPath}/admin/js/jbox.min.js"></script>

<!-- js代码 -->
<script type="text/javascript">
    //在页面加载完毕后执行
    $(function () {
        //加载第三方组件
        //footable
        yukon_footable.goodslist();
        //datepicker
        yukon_datepicker.p_forms_extended();


        init();
    })

    function init() {
        $(".item_tag_name").each(function () {
            //获取td内容拆分
            var ids = $(this).html();
            var idArray = ids.split("#");
            //获取divObj
            var divObj = $(this);
            //使用ajax发送数据
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/admin/items/adminTags",
                contentType:"application/json",
                dataType:"json",
                data:JSON.stringify(idArray),
                success:function (data) {
                    //alert(data[0]);
                    var str = "";
                    for (var i = 0;i <  data.length;i++){
                        str += data[i]+" ";
                    }
                    $(divObj).html(str);
                }
            });
        })
    }
    
    
    
    /*function init() {
        //获取所有class为item_tag_name的td
        $(".item_tag_name").each(function () {
            //获取td内容 拆分
            var ids = $(this).html();
            var idArray = ids.split("#");
            //获取divObj
            var divObj = $(this);
            //实用ajax 发送数据
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/items/adminTags",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(idArray),
                success: function (data) {
                    //获取名字列表
                    alert(data[0]);
                    var str = "";
                    for (var i = 0; i < data.length; i++) {
                        str += data(i) + " ";
                    }
                    $(divObj).html(str);
                }
            })
        });
    }*/
</script>
</body>
</html>