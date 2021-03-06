<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/views/backStage/commons/commons.jsp"%>
<html lang="en">
  <head>
    <%@include file="/views/backStage/commons/commonHeader.jsp"%>
    <style type="text/css">
    	img {
    		cursor:pointer;
    	} 
    </style>
  </head>
  <body>
	<%@include file="/views/backStage/commons/commonBegin.jsp"%>
  <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                      	<form class="form-inline" role="form" style="margin-bottom: 10px;" 
                      		action="<%=path %>/backStage/goods/list" method="get">
                             <div class="form-group" style="margin: 10px;">
                                 <input name="name" value="${name}" type="text" class="form-control" placeholder="名称">
                             </div>
                             <div class="form-group" style="margin: 10px;">
                             	<button type="submit" class="btn btn-primary"> 查 询 </button>
                        	 </div>
                        	 <div class="form-group" style="float: right;margin: 10px;margin-right: 50px;">
                                 <div class="col-lg-offset-2 col-lg-10">
                                     <button id="btnGoodAdd" type="button" class="btn btn-danger" >新增商品</button>
                                 </div>
                             </div>
                         </form>

                      	<form id="userform" name="userform" action="<%=path %>/backStage/goods/list" method="get">
                          <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr style="background-color: #ecd59e;">
                              	<th>编号</th>
			                    <th>商品名称</th>
			                    <th>商品类型</th>
			                    <th>单价</th>
			                    <th>库存</th>
			                    <th>上架</th>
			                    <th>是否推荐</th>
			                    <th>促销单价</th>
			                    <th>促销开始日期</th>
			                    <th>促销结束日期</th>
			                    <th>操作</th>
                          </tr>
                          </thead>
                          <tbody>
                          	<!--表格头部结束-->
							<c:forEach items="${list }" var="li" varStatus="s">
	                          <tr class="odd gradeX">
	                          	  	<td>${li.id}</td>
				                    <td>${li.name}</td>
				                    <td>${li.goodsTypeName}</td>
				                    <td>${li.period_amt}</td>
				                    <td>${li.stock}</td>
				                    <td><c:choose>
										<c:when test="${li.flag == '10'}">
											<img src="<%=path%>/static/backStage/img/icon/yes.gif" onclick="changeFlagNo(this,${li.id})" class="img_hold"/>
										</c:when>
										<c:when test="${li.flag == '20'}">
											<img src="<%=path%>/static/backStage/img/icon/no.gif" onclick="changeFlagYes(this,${li.id})" class="img_hold"/>
										</c:when>
									</c:choose></td>
									<td><c:choose>
										<c:when test="${li.is_Recommend == 'Y'}">
											<img src="<%=path%>/static/backStage/img/icon/yes.gif" onclick="changeRecommendNo(this,${li.id})" class="img_hold"/>
										</c:when>
										<c:when test="${li.is_Recommend == 'N'}">
											<img src="<%=path%>/static/backStage/img/icon/no.gif" onclick="changeRecommendYes(this,${li.id})" class="img_hold"/>
										</c:when>
									</c:choose></td>
									 <td>${li.sales_amt}</td>
									 <td>${li.sales_date_begin}</td>
									 <td>${li.sales_date_end}</td>
	                              <td>
	                              	<button class="btn btn-primary btn-xs" type="button" onclick="edit('${li.id}')"><i class="icon-pencil"></i></button>
	                              	<button class="btn btn-danger btn-xs" type="button" onclick="delGoods(${li.id})"><i class="icon-trash"></i></button>
	                              </td>
	                          </tr>
	                        </c:forEach>
                          </tbody>
                          </table>
                          <!-- 分页标签开始  -->
				            <div class="">
				                <paginator:page name="paginator" form="userform" action="/backStage/goods/list" />
				            </div>
				          <!-- 分页标签结束 -->
                        </form>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
      
	<%@include file="/views/backStage/commons/commonEnd.jsp"%>
	<script type="text/javascript" src="<%=path %>/static/backStage/assets/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript" src="<%=path %>/static/backStage/js/layer/layer.js"></script>
	
	<script type="text/javascript">
		$("#btnGoodAdd").click( function () {
			window.location.href='<%=basePath%>backStage/goods/detail';
		});
		
		function edit(id){
			window.location.href='<%=basePath%>backStage/goods/detail?id='+id;
		}
		
		function delGoods(id){
	    	// 删除前确认提示
			layer.confirm('确定要将此商品移到回收站吗？', {
				btn: ['移到回收站','取消'], //按钮
			}, function(){
				if(updateFlag(id,'90')){
		    		$("#userform").submit();
		    	}
			}, function(){
			});
	    }
	    function changeFlagYes(obj, id){
	    	// 删除前确认提示
			layer.confirm('是否要将此商品【上架】吗？', {
				btn: ['上架','取消'], //按钮
			}, function(){
				if(updateFlag(id,"10")){
		    		$(obj).attr('src',"<%=path%>/static/backStage/img/icon/yes.gif");
		    		$(obj).attr('onclick',"changeFlagNo(this,'"+id+"')");
		    	}
		    	layer.closeAll('dialog');
			}, function(){
			});
	    }
	    function changeFlagNo(obj, id){
	    	// 删除前确认提示
			layer.confirm('是否要将此商品【下架】吗？', {
				btn: ['下架','取消'], //按钮
			}, function(){
				if(updateFlag(id,"20")){
		    		$(obj).attr('src',"<%=path%>/static/backStage/img/icon/no.gif");
		    		$(obj).attr('onclick',"changeFlagYes(this,'"+id+"')");
		    	}
		    	layer.closeAll('dialog');
			}, function(){
			});
	    }
	    
	    function changeRecommendYes(obj, id){
	    	// 删除前确认提示
			layer.confirm('是否要将此商品设置为【推荐】吗？', {
				btn: ['推荐','关闭'], //按钮
			}, function(){
				if(updateRecommend(id,"Y")){
		    		$(obj).attr('src',"<%=path%>/static/backStage/img/icon/yes.gif");
		    		$(obj).attr('onclick',"changeRecommendNo(this,'"+id+"')");
		    	}
		    	layer.closeAll('dialog');
			}, function(){
			});
	    }
	    function changeRecommendNo(obj, id){
	    	// 删除前确认提示
			layer.confirm('是否要将此商品取消【推荐】吗？', {
				btn: ['取消推荐','关闭'], //按钮
			}, function(){
				if(updateRecommend(id,"N")){
		    		$(obj).attr('src',"<%=path%>/static/backStage/img/icon/no.gif");
		    		$(obj).attr('onclick',"changeRecommendYes(this,'"+id+"')");
		    	}
		    	layer.closeAll('dialog');
			}, function(){
			});
	    }
	    function updateRecommend(id, isRecommend){
	    	$.ajax({
                type:"get",
                data:{
                	"id" : id,
                	"isRecommend" : isRecommend
                },
                async: false,
                url:"<%=basePath%>backStage/goods/updateRecommend",
                success:function(data) {
                	if(data!='S'){
                		layer.alert("更新是否推荐失败："+data,{icon: 2,skin: 'layer-ext-moon'});
                		return false;	
                	}
                },
                error:function(){
                    layer.alert("更新异常，请联系管理员！",{icon: 2,skin: 'layer-ext-moon'});
                    return false;
                }
            });
            
            return true;
	    }
	    
	    function updateFlag(id , flag){
	    	$.ajax({
                type:"get",
                data:{
                	"id" : id,
                	"flag" : flag
                },
                async: false,
                url:"<%=basePath%>backStage/goods/updateFlag",
                success:function(data) {
                	if(data!='S'){
                		layer.alert("更新商品状态失败："+data,{icon: 2,skin: 'layer-ext-moon'});
                		return false;	
                	}
                },
                error:function(){
                    layer.alert("更新商品状态异常，请联系管理员！",{icon: 2,skin: 'layer-ext-moon'});
                    return false;
                }
            });
            
            return true;
	    }
	</script>
	
	</body>
</html>
