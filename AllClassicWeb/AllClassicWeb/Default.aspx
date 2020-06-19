<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AllClassicWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >


    <div class="banner" >
                
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active"> 
                    <img src="Content/img/banner/banner1.jpg" /> 
                </div>

                <div class="item">
                    <img src="Content/img/banner/banner2.png" />
                </div>

                <div class="item">
                    <img src="Content/img/banner/banner3.jpg" />
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </div>



    <div class="section1">
        <ul class="tab">
            <li class="on"><a href="">콩클정보</a></li>
            <li><a href="">오디션정보</a></li>
            <li><a href="">구인구직</a></li>
            <li><a href="">Q&amp;A</a></li>
        </ul>
        <ul class="list">
            <li><a href="">제20회 한국 쇼팽 콩쿠르 안내</a></li>
            <li><a href="">제35회 음연콩쿨	</a></li>
            <li><a href="">2018 대구오페라하우스 제9회 전국 아마추어 성악 콩쿠르</a></li>
            <li><a href="">2018년도 제18회 서울오케스트라 콩쿠르	</a></li>
            <li><a href="">제4회 새소리 전국 음악 콩쿠르</a></li>
        </ul>
    </div>


    <div class="section2">
        <div class="section2-1">
            <h2>클래식음악 소식</h2>
            <div class="txt"><a href="#">서산시, 수준 높은 공연문화 유치로 고품격 문화도시 조성
                <br />
                <span>2018-05-08</span></a></div>
            <div class="img"><a href="#">
                <img src="img/news.jpg"></a></div>
            <div class="more"><a href="#">+</a></div>
        </div>
        <div class="section2-2">
            <h2>팝업존</h2>
            <div class="img"><a href="#">
                <img src="img/popup.jpg"></a></div>
            <div class="more"><a href="#">+</a></div>
        </div>
    </div>

    <div class="section3">
        <h2>공연일정 안내</h2>
        <div class="section3-1">
            <div class="day_m">
                <h3>이달의 행사일정</h3>
                <div class="year">2019</div>
                <div class="month">06</div>
                <div class="arr1"><a href="#">
                    <img src="img/day_arr1.png"></a></div>
                <div class="arr2"><a href="#">
                    <img src="img/day_arr2.png"></a></div>
            </div>
        </div>
        <div class="section3-2">
            <div class="day_d">
                <ul class="dday">
                    <li class="on"><a href="#">01</a></li>
                    <li><a href="#">02</a></li>
                    <li><a href="#">03</a></li>
                    <li><a href="#">04</a></li>
                    <li><a href="#">05</a></li>
                    <li><a href="#">06</a></li>
                    <li><a href="#">07</a></li>
                    <li><a href="#">08</a></li>
                    <li><a href="#">09</a></li>
                    <li><a href="#">10</a></li>
                    <li><a href="#">11</a></li>
                    <li><a href="#">12</a></li>
                    <li><a href="#">13</a></li>
                    <li><a href="#">14</a></li>
                    <li><a href="#">15</a></li>
                    <li><a href="#">16</a></li>
                    <li><a href="#">17</a></li>
                    <li><a href="#">18</a></li>
                    <li><a href="#">19</a></li>
                    <li><a href="#">20</a></li>
                    <li><a href="#">21</a></li>
                    <li><a href="#">22</a></li>
                    <li><a href="#">23</a></li>
                    <li><a href="#">24</a></li>
                    <li><a href="#">25</a></li>
                    <li><a href="#">26</a></li>
                    <li><a href="#">27</a></li>
                    <li><a href="#">28</a></li>
                    <li><a href="#">29</a></li>
                    <li><a href="#">30</a></li>
                    <li><a href="#">31</a></li>
                </ul>
                <ul class="dimg">
                    <li><a href="#">
                        <img src="img/day_img1.jpg"></a></li>
                    <li><a href="#">
                        <img src="img/day_img2.jpg"></a></li>
                    <li><a href="#">
                        <img src="img/day_img3.jpg"></a></li>
                </ul>
            </div>
        </div>
        <div class="more"><a href="#">+</a></div>
    </div>



</asp:Content>
