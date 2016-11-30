<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.Default" Title="无标题页" Codebehind="Default.aspx.cs" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">
	            function scroll(obj) {
		            var tmp = (obj.scrollLeft)++;
		            //当滚动条到达右边顶端时
		            if (obj.scrollLeft==tmp) obj.innerHTML += obj.innerHTML;
		            //当滚动条滚动了初始内容的宽度时滚动条回到最左端
		            if (obj.scrollLeft>=obj.firstChild.offsetWidth) obj.scrollLeft=0;
	            }
	            var _timer = setInterval("scroll(document.getElementById('scrollobj'))", 20); 
                function _stop() { 
                if (_timer != null) { 
                clearInterval(_timer); 
                } 
                } 
                function _start() { 
                _timer = setInterval("scroll(document.getElementById('scrollobj'))", 20); 
                } 
				
				$(document).ready(function(){
				$(".flq_body").find("span").click(function(){
				$("#flq_hide2").value=this.innerText;
				});});
          
 </script>
 <div class="default-page">
<div class="">
	<div class="hidden-sm hidden-xs col-md-3">
			<div class="flq_head col-md-12">图书分类</div>
		<div class="flq_body">
			<ul>
			<li><span><asp:LinkButton onCommand="GotoSearch" CommandName="小说" runat="server">小说</asp:LinkButton></span></li>
			<li><span><asp:LinkButton onCommand="GotoSearch" CommandName="散文集" runat="server">散文集</asp:LinkButton></span></li>
			<li><span><asp:LinkButton onCommand="GotoSearch" CommandName="教育" runat="server">教育</asp:LinkButton></span></li>
			<li><span><asp:LinkButton onCommand="GotoSearch" CommandName="励志" runat="server">励志</asp:LinkButton></span></li>
			<li><span><asp:LinkButton onCommand="GotoSearch" CommandName="历史" runat="server">历史</asp:LinkButton></span></li>
			<li><span><asp:LinkButton onCommand="GotoSearch" CommandName="IT计算机" runat="server">IT计算机</asp:LinkButton></span></li>
			<li><span><asp:LinkButton onCommand="GotoSearch" CommandName="传记" runat="server">传记</asp:LinkButton></span></li>
			<li><span><asp:LinkButton onCommand="GotoSearch" CommandName="艺术" runat="server">艺术</asp:LinkButton></span></li>
			<li><span><asp:LinkButton onCommand="GotoSearch" CommandName="摄影" runat="server">摄影</asp:LinkButton></span></li>
			</ul>
		</div>
		<asp:TextBox ID="flq_hide" class="flq_hide" runat="server" onclick="GotoSearch" Visible="False"/>
		<input type="hidden" id="flq_hide2">
	</div>
	

	<div class="col-xs-12 col-md-9">
<div class="row"><!--单书籍轮播页-->
            <div id="myCarousel" class="col-xs-12  col-sm-10 col-sm-offset-1 col-md-11 col-md-offset-0 carousel slide" data-ride="carousel" data-interval="6000">
   <!-- 轮播（Carousel）指标 -->
   <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
   </ol>   
   <!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
      <div class="item active">
         <img class=" carousel-inner img-responsive img-rounded " src="./image/1.jpg" alt="First slide">
      </div>
      <div class="item">
         <img class=" carousel-inner img-responsive img-rounded "  src="./image/2.jpg" alt="Second slide">
      </div>
      <div class="item">
         <img class=" carousel-inner img-responsive img-rounded "  src="./image/3.jpg" alt="Third slide">
      </div>
   </div>
   <!-- 轮播（Carousel）导航 -->
   <a class="carousel-control left" href="#myCarousel" 
      data-slide="prev">&lsaquo;</a>
   <a class="carousel-control right" href="#myCarousel" 
      data-slide="next">&rsaquo;</a>
            </div> <!--myCarousel-->
</div>
	<div class="row hidden-md hidden-lg">
			<div class="row flq_head">图书分类</div>
		<div class="row flq_body">
			<ul>
			<li class="col-xs-3 col-sm-2"><span><asp:LinkButton onCommand="GotoSearch" CommandName="小说" runat="server">小说</asp:LinkButton></span></li>
			<li class="col-xs-3 col-sm-2"><span><asp:LinkButton onCommand="GotoSearch" CommandName="散文集" runat="server">散文集</asp:LinkButton></span></li>
			<li class="col-xs-3 col-sm-2"><span><asp:LinkButton onCommand="GotoSearch" CommandName="教育" runat="server">教育</asp:LinkButton></span></li>
			<li class="col-xs-3 col-sm-2"><span><asp:LinkButton onCommand="GotoSearch" CommandName="励志" runat="server">励志</asp:LinkButton></span></li>
			<li class="col-xs-3 col-sm-2"><span><asp:LinkButton onCommand="GotoSearch" CommandName="历史" runat="server">历史</asp:LinkButton></span></li>
			<li class="col-xs-3 col-sm-2"><span><asp:LinkButton onCommand="GotoSearch" CommandName="IT计算机" runat="server">IT计算机</asp:LinkButton></span></li>
			<li class="col-xs-3 col-sm-2"><span><asp:LinkButton onCommand="GotoSearch" CommandName="传记" runat="server">传记</asp:LinkButton></span></li>
			<li class="col-xs-3 col-sm-2"><span><asp:LinkButton onCommand="GotoSearch" CommandName="艺术" runat="server">艺术</asp:LinkButton></span></li>
			<li class="col-xs-3 col-sm-2"><span><asp:LinkButton onCommand="GotoSearch" CommandName="摄影" runat="server">摄影</asp:LinkButton></span></li>
			</ul>
		</div>
	</div>	
	<div class="row"><!--多书籍走马灯-->
            <div class="col-xs-12  col-sm-12 col-md-11 carousel">
                <div id="scrollobj" onmouseover="javascript:_stop();" onmouseout="javascript:_start();" class="book_picture2">
                   <asp:Repeater ID="Repeater1" runat="server">
                      <ItemTemplate>
                        <a href="book.aspx?book_id=<%# Eval("book_id") %>"><img alt="<%# Eval("title") %>" height="200px" title="<%# Eval("title") %>" src="./image/books/<%# Eval("picname") %>" /></a>
                      </ItemTemplate>
                    </asp:Repeater>
                </div>
             </div>
	</div>
	</div>
</div>
</div>
</asp:Content>