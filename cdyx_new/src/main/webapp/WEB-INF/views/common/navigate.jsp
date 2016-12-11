<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar">
    <div class="photoperson">
        <strong>FASHABLE</strong>
        <img src="<%=request.getContextPath()%>/web/img/photo.png" />
        <div class="photoperson_le"><i>园宝的爱</i><span></span></div>
    </div>
    <div class="navbar">
        <div class="accordion accordion2" id="accordion-1">
            <div class="accordion-group accordion-groupa">
                <div class="accordion-heading" data-toggle="collapse" data-parent="#accordion-1" href="#accordion-element-1">
                    <a class="accordion-toggle collapsed">
                        <i class="iconall iconmenu1"></i>
                        <strong>餐厅管理</strong>
                    </a>
                    <i class="icon ion-ios-arrow-right"></i>
                    <span class="badgecircle color_b"></span>
                </div>
                <div id="accordion-element-1" class="accordion-body collapse">
                    <div class="accordion-inner" data-toggle="tab" href="#magemakework">
                        <a href="">今日菜单</a>
                    </div>
                    <div class="accordion-inner" data-toggle="tab" href="#magemakejia">
                        <a href="">历史菜单</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion accordion2" id="accordion-2">
            <div class="accordion-group accordion-groupa">
                <div class="accordion-heading" data-toggle="collapse" data-parent="#accordion-2" href="#accordion-element-2">
                    <a class="accordion-toggle collapsed">
                        <i class="iconall iconmenu2"></i>
                        <strong>菜品管理</strong>
                    </a>
                    <i class="icon ion-ios-arrow-right"></i>
                    <span class="badgecircle color_b"></span>
                </div>
                <div id="accordion-element-2" class="accordion-body collapse">
                    <div class="accordion-inner" data-toggle="tab" href="#magemakework">
                        <a href="">午餐 <i class="icon ion-ios-arrow-left"></i><span class="badge">20</span></a>
                    </div>
                    <div class="accordion-inner" data-toggle="tab" href="#magemakejia">
                        <a href="">晚餐<i class="icon ion-ios-arrow-left"></i></a>
                    </div>
                    <div class="accordion-inner" data-toggle="tab" href="#magemakeout">
                        <a href="">酒水<i class="icon ion-ios-arrow-left"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <h3>清单汇总</h3>
        <div class="accordion accordion2" id="accordion-3">
            <div class="accordion-group accordion-groupa">
                <div class="accordion-heading" data-toggle="collapse" data-parent="#accordion-3" href="#accordion-element-3">
                    <a class="accordion-toggle collapsed">
                        <i class="iconall iconmenu3"></i>
                        <strong>看单</strong>
                    </a>
                    <i class="icon ion-ios-arrow-right"></i>
                    <span class="badgecircle color_b"></span>
                </div>
                <div id="accordion-element-3" class="accordion-body collapse">
                    <div class="accordion-inner" data-toggle="tab" href="#magemakework">
                        <a href="">午餐 <i class="icon ion-ios-arrow-left"></i><span class="badge">20</span></a>
                    </div>
                    <div class="accordion-inner" data-toggle="tab" href="#magemakejia">
                        <a href="">晚餐<i class="icon ion-ios-arrow-left"></i></a>
                    </div>
                    <div class="accordion-inner" data-toggle="tab" href="#magemakeout">
                        <a href="">酒水<i class="icon ion-ios-arrow-left"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion accordion2" id="accordion-4">
            <div class="accordion-group accordion-groupa">
                <div class="accordion-heading" data-toggle="collapse" data-parent="#accordion-4" href="#accordion-element-4">
                    <a class="accordion-toggle collapsed">
                        <i class="iconall iconmenu4"></i>
                        <strong>消费</strong>
                    </a>
                    <i class="icon ion-ios-arrow-right"></i>
                    <span class="badgecircle color_b"></span>
                </div>
                <div id="accordion-element-4" class="accordion-body collapse">
                    <div class="accordion-inner" data-toggle="tab" href="#magemakework">
                        <a href="">午餐 <i class="icon ion-ios-arrow-left"></i><span class="badge">20</span></a>
                    </div>
                    <div class="accordion-inner" data-toggle="tab" href="#magemakejia">
                        <a href="">晚餐<i class="icon ion-ios-arrow-left"></i></a>
                    </div>
                    <div class="accordion-inner" data-toggle="tab" href="#magemakeout">
                        <a href="">酒水<i class="icon ion-ios-arrow-left"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>